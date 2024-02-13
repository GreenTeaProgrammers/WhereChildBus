import cv2
import os
import yaml
import numpy as np
import argparse
import logging
from dotenv import load_dotenv


from detectFaceUtil import (
    load_cascade,
    detect_face,
    clip_and_resize_face,
    save_face,
)

load_dotenv()

logging.basicConfig(
    format="%(asctime)s - %(levelname)s - %(name)s - PID: %(process)d -  %(message)s",
    datefmt="%m/%d/%Y %H:%M:%S",
    level=logging.INFO,
)
logger = logging.getLogger(__name__)


def load_image(args, blobs=None):
    # 画像の読み込み
    images = []
    if args.env == "local":
        for image_path in os.listdir(args.image_dir_path):
            logger.info(f"loading: {image_path}")
            image = cv2.imread(args.image_dir_path + image_path)
            if image is None:
                logger.error(f"Can not find or load : {image_path}")
                continue
            images.append(image)
    elif args.env == "remote":

        for blob in blobs:
            logger.info(f"loading: {blob.name}")
            if blob.name.endswith("/"):
                logger.info(f"skip: {blob.name}")
                continue

            # バイトデータから numpy 配列を作成
            image_data = blob.download_as_string()
            image_array = np.frombuffer(image_data, dtype=np.uint8)

            # cv2.imdecode でバイト配列を画像に変換
            image = cv2.imdecode(image_array, cv2.IMREAD_COLOR)
            if image is None:
                logger.error(f"Can not load: {blob.name}")
                continue
            images.append(image)
    return images


def main(args):
    logger.info(f"env: {args.env}")
    with open("src/face_detect_model/config.yaml", "r") as f:
        config = yaml.safe_load(f)

    face_cascade_path = config["face_detect"]["cascade_path"]
    image_size = (
        config["face_detect"]["clip_size"]["height"],
        config["face_detect"]["clip_size"]["width"],
    )

    if args.env == "local":
        save_dir_path = args.save_dir_path
        # 保存先ディレクトリの作成，存在した場合は中身を削除
        os.makedirs(save_dir_path, exist_ok=True)
        for file in os.listdir(save_dir_path):
            file_path = os.path.join(save_dir_path, file)
            if os.path.isfile(file_path):
                os.remove(file_path)
    elif args.env == "remote":
        from google.oauth2 import service_account
        import google.cloud.storage as gcs

        # TODO: GCP Cloud Functions でdeployする際の実装
        key_path = os.environ.get("CREDENTIALS_KEY_PATH")
        credential = service_account.Credentials.from_service_account_file(key_path)

        PROJECT_ID = os.environ.get("PROJECT_ID")
        BUCKET_NAME = os.environ.get("BUCKET_NAME")

        SOURCE_BLOB_NAME = f"{args.nursery_id}/{args.child_id}/row/"

        client = gcs.Client(PROJECT_ID, credentials=credential)
        bucket = client.bucket(BUCKET_NAME)
        logger.info("get bucket success!")

        blobs = bucket.list_blobs(prefix=SOURCE_BLOB_NAME, delimiter="/")

    # Haar Cascadeの読み込み
    face_cascade = load_cascade(face_cascade_path)

    if args.env == "local":
        images = load_image(args)
    elif args.env == "remote":
        images = load_image(args, blobs=blobs)

    logger.info("Detecting faces...")
    if args.env == "remote":
        from google.cloud.storage import Blob

    detect_face_num = 0
    for image in images:
        faces = detect_face(
            image,
            face_cascade,
            scaleFactor=config["face_detect"]["scale_factor"],
            minNeighbors=config["face_detect"]["min_neighbors"],
            minSize=(
                config["face_detect"]["min_size"]["height"],
                config["face_detect"]["min_size"]["width"],
            ),
        )

        # 検出された各顔に対して処理
        for face in faces:
            clipped_face = clip_and_resize_face(face, image, image_size)
            if args.env == "local":
                save_file_name = f"{detect_face_num}.png"
                logger.info(f"saving: {save_file_name}")
                save_face(clipped_face, save_dir_path, save_file_name)
            elif args.env == "remote":
                _, encoded_image = cv2.imencode(".png", clipped_face)
                png_cliped_face_data = encoded_image.tobytes()

                save_blob_name = f"{args.nursery_id}/{args.child_id}/clipped/{args.child_id}-{detect_face_num}.png"
                logger.info(f"uploading: {save_blob_name}")
                save_blob = Blob(save_blob_name, bucket)
                save_blob.upload_from_string(
                    data=png_cliped_face_data, content_type="image/png"
                )
            detect_face_num += 1
    logger.info("Done")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    env_subparsers = parser.add_subparsers(dest="env")

    local_parser = env_subparsers.add_parser("local")
    local_parser.add_argument(
        "--img_dir_path",
        type=str,
        help="画像のディレクトリパス",
        required=True,
    )
    local_parser.add_argument(
        "--save_dir_path",
        type=str,
        help="保存先のディレクトリパス",
        required=True,
    )

    remote_parser = env_subparsers.add_parser("remote")
    remote_parser.add_argument(
        "--nursery_id",
        type=str,
        help="保育園・幼稚園のID",
        required=True,
    )
    remote_parser.add_argument(
        "--child_id",
        type=str,
        help="園児のID",
        required=True,
    )

    args = parser.parse_args()
    main(args)
