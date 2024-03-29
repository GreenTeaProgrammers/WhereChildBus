import argparse
import os
import time

import torch
import yaml
from dotenv import load_dotenv

load_dotenv("secrets/.env")

from face_detect_model.DetectFaceAndClip.detectFaceUtil import (
    clip_and_resize_face,
    detect_face,
    load_cascade,
)
from face_detect_model.gcp_util import (
    get_bucket,
    init_client,
    save_face_image_to_remote,
)
from face_detect_model.model.faceDetectModel import FaceDetectModel
from face_detect_model.util import (
    get_default_transforms_for_gray,
    load_image_from_binary,
    load_pickle_to_gcs,
    logger,
    switch_to_bus_type,
    smile_detecter,
)


def load_model(model_pickle, config, num_classes, input_shape) -> FaceDetectModel:
    try:
        model = FaceDetectModel(config, num_classes, input_shape)
        model.load_state_dict(model_pickle)
    except Exception as e:
        raise ValueError(f"Failed to load model due to an error: {e}")
    return model


def get_clipped_face(image, faces, image_size):
    clipped_faces = []
    for face in faces:
        clipped_face = clip_and_resize_face(face, image, image_size)
        clipped_faces.append(clipped_face)
    return clipped_faces


def detect_face_and_clip_from_image(image, config):
    face_cascade_path = config["face_detect"]["cascade_path"]
    image_size = (
        config["face_detect"]["clip_size"]["height"],
        config["face_detect"]["clip_size"]["width"],
    )

    # Haar Cascadeの読み込み
    face_cascade = load_cascade(face_cascade_path)

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

    clipped_faces = get_clipped_face(image, faces, image_size)
    return clipped_faces


def convert_to_tensor_from_images(clipped_face_images):
    transforms = get_default_transforms_for_gray()
    image_tensors = []
    for clipped_face_image in clipped_face_images:
        image_tensor = transforms(clipped_face_image)
        image_tensors.append(image_tensor)
    return image_tensors


def get_clipped_faces_from_images(args, config, detecter, save_bucket):
    all_faces = []
    for video_clip in args.video_chunk:
        image = load_image_from_binary(args, video_clip)
        clipped_faces = detect_face_and_clip_from_image(image, config)
        if len(clipped_faces) > 0:
            # timestampをファイル名に含めて保存
            for clipped_face in clipped_faces:
                smile_degree = detecter.detect_smile_degree(clipped_face)
                logger.info(f"Smile degree: {smile_degree}")
                smile_image = detecter.add_smile_degree_to_image(image, smile_degree)
                now = time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())
                save_face_image_to_remote(
                    smile_image,
                    f"{args.nursery_id}/{args.bus_id}/{now}_{smile_degree}.png",
                    save_bucket,
                )
        all_faces.extend(clipped_faces)
    return all_faces


def get_model_input_shape(tensor):
    return tensor.shape


def pred_child_from_tensor(model, input_image_tensor):
    output = model(input_image_tensor.unsqueeze(0))
    logger.info(f"Predicted present: {torch.nn.functional.softmax(output, dim=1)}")
    pred = output.argmax(dim=1)
    return pred


def get_pred_child(model, input_image_tensors, idx_to_label_dict):
    pred_child_ids = set()

    # TODO: 複数枚をバッチで処理する
    for input_image_tensor in input_image_tensors:
        pred = pred_child_from_tensor(model, input_image_tensor)
        child_id = idx_to_label_dict[pred.item()]
        logger.info(f"Predicted child id: {child_id}")
        pred_child_ids.add(child_id)

    return pred_child_ids


def pred_child_from_images(args, config):
    client = init_client()
    bucket_name = os.environ.get("BUCKET_NAME_FOR_MODEL")
    bucket_name_for_image = os.environ.get("BUCKET_NAME_FOR_FACE")
    bucket = get_bucket(client, bucket_name)
    bucket_for_face = get_bucket(client, bucket_name_for_image)
    idx_to_label_dict_bucket_path = f"{args.nursery_id}/{args.bus_id}/idx_to_label_{switch_to_bus_type(args.bus_type)}.pth"

    idx_to_label_dict = load_pickle_to_gcs(bucket, idx_to_label_dict_bucket_path)
    model_class_num = len(idx_to_label_dict)

    detecter = smile_detecter()
    clipped_faces = get_clipped_faces_from_images(
        args, config, detecter, bucket_for_face
    )

    if len(clipped_faces) == 0:
        logger.info("No face detected.")
        return []

    input_image_tensors = convert_to_tensor_from_images(clipped_faces)

    model_bucket_path = (
        f"{args.nursery_id}/{args.bus_id}/model_{switch_to_bus_type(args.bus_type)}.pth"
    )
    input_shape = get_model_input_shape(input_image_tensors[0])
    logger.info(f"Input shape: {input_shape}")
    model_pickle = load_pickle_to_gcs(bucket, model_bucket_path)
    model = load_model(
        model_pickle=model_pickle,
        config=config,
        num_classes=model_class_num,
        input_shape=input_shape,
    )
    model.eval()

    logger.info("Start predicting child id")
    pred_child_ids = get_pred_child(model, input_image_tensors, idx_to_label_dict)
    logger.info(f"Predicted child ids: {pred_child_ids}")
    logger.info("Done")

    return list(pred_child_ids)


def main(args):
    with open("src/face_detect_model/config.yaml", "r") as f:
        config = yaml.safe_load(f)
    pred_child_ids_list = pred_child_from_images(args, config)
    return pred_child_ids_list


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--nursery_id", type=str, required=True)
    parser.add_argument("--bus_id", type=str, required=True)
    parser.add_argument("--bus_type", type=int, required=True)

    args = parser.parse_args()
    args.video_chunk = [[]]
    args.photo_height = 240
    args.photo_width = 320

    main(args)
