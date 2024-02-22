import argparse
import logging
import os

import cv2
import google.cloud.storage as gcs
import numpy as np
import yaml
from dotenv import load_dotenv
from face_detect_model.DetectFaceAndClip.detectFaceUtil import (
    clip_and_resize_face,
    detect_face,
    load_cascade,
)
from face_detect_model.gcp_util import (
    get_blobs,
    get_bucket,
    init_client,
    save_face_image_to_remote,
)
from google.cloud.storage import Blob, Bucket

load_dotenv("secrets/.env")

logging.basicConfig(
    format="%(asctime)s - %(levelname)s - %(name)s - PID: %(process)d -  %(message)s",
    datefmt="%m/%d/%Y %H:%M:%S",
    level=logging.INFO,
)
logger = logging.getLogger(__name__)

# TODO: GCSに関する処理を別ファイルに切り出す


def load_image(args: argparse.Namespace, blobs=None):
    """画像の読み込みを行うラッパー関数"""
    if args.env == "local":
        return load_image_from_local(args.image_dir_path)
    elif args.env == "remote":
        return load_image_from_remote(blobs)


def load_image_from_local(image_dir_path: str):
    images = []
    for image_path in os.listdir(image_dir_path):
        logger.info(f"loading: {image_path}")
        image = cv2.imread(image_dir_path + image_path)
        if image is None:
            logger.error(f"Can not find or load : {image_path}")
            continue
        images.append(image)
    return images


def load_image_from_remote(blobs: list):
    images = []
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


def init_save_dir(save_dir_path: str):
    os.makedirs(save_dir_path, exist_ok=True)
    for file in os.listdir(save_dir_path):
        file_path = os.path.join(save_dir_path, file)
        if os.path.isfile(file_path):
            os.remove(file_path)


def save_face_image_to_local(face: np.ndarray, save_dir: str, save_file_name: str):
    """クリップされた顔画像を保存する"""
    os.makedirs(save_dir, exist_ok=True)

    save_path = os.path.join(save_dir, save_file_name)
    cv2.imwrite(save_path, face)


def detect_face_and_clip(args: argparse.Namespace, config: dict):
    face_cascade_path = config["face_detect"]["cascade_path"]
    image_size = (
        config["face_detect"]["clip_size"]["height"],
        config["face_detect"]["clip_size"]["width"],
    )

    # 保存先ディレクトリの作成，存在した場合は中身を削除
    if args.env == "local":
        init_save_dir(args.save_dir_path)

    # GCSとの接続
    if args.env == "remote":
        client = init_client()
        BUCKET_NAME = os.environ.get("BUCKET_NAME")
        bucket = get_bucket(client, BUCKET_NAME)

    # Haar Cascadeの読み込み
    face_cascade = load_cascade(face_cascade_path)

    if args.env == "local":
        images = load_image(args)
    elif args.env == "remote":
        SOURCE_BLOB_NAME = f"{args.nursery_id}/{args.child_id}/raw/"
        blobs = get_blobs(bucket, SOURCE_BLOB_NAME)
        images = load_image(args, blobs=blobs)
    else:
        logger.error(f"Invalid env: {args.env}")
        exit(1)

    logger.info("Detecting faces...")
    if len(images) == 0:
        logger.error("No face Detected")

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
                logger.info(f"save: {save_file_name}")
                save_face_image_to_local(
                    clipped_face, args.save_dir_path, save_file_name
                )
            elif args.env == "remote":
                save_blob_name = f"{args.nursery_id}/{args.child_id}/clipped/{args.child_id}-{detect_face_num}.png"
                logger.info(f"save: {save_blob_name}")
                save_face_image_to_remote(clipped_face, save_blob_name, bucket)
            detect_face_num += 1


def main(args: argparse.Namespace):
    logger.info(f"env: {args.env}")
    with open("src/face_detect_model/config.yaml", "r") as f:
        config = yaml.safe_load(f)

    detect_face_and_clip(args, config)

    logger.info("Done")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    env_subparsers = parser.add_subparsers(dest="env")

    local_parser = env_subparsers.add_parser("local")
    local_parser.add_argument(
        "--image_dir_path",
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
