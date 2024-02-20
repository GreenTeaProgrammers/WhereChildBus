import logging
import re

import random
import torch
from google.cloud.storage import Bucket
from torchvision import transforms
import os
import numpy as np

from generated.machine_learning.v1.func_args import (
    FaceDetectAndClip_Args,
)

import cv2

logging.basicConfig(
    format="%(asctime)s - %(levelname)s - %(name)s - PID: %(process)d -  %(message)s",
    datefmt="%m/%d/%Y %H:%M:%S",
    level=logging.INFO,
)
logger = logging.getLogger(__name__)


def set_seed(seed):
    random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)


def get_child_id(blob_name: str):
    # UUIDの正規表現パターン
    uuid_pattern = r"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"

    # 正規表現でUUIDを検索
    uuids = re.findall(uuid_pattern, blob_name)

    # 目的のUUIDを取得（2番目に現れるUUID）
    child_id = uuids[1] if len(uuids) > 1 else None
    return child_id


# TODO: gRPC用に生成されたファイルを用いることができないか検証し，置換
def switch_to_bus_type(bus_type_num: int):
    bus_type_str = "BUS_TYPE_"
    if bus_type_num == 0:
        return bus_type_str + "UNSPECIFIED"
    elif bus_type_num == 1:
        return bus_type_str + "MORNING"
    elif bus_type_num == 2:
        return bus_type_str + "EVENING"
    else:
        raise ValueError(f"Invalid bus_type: {bus_type_num}")


def load_image_from_remote(blobs: list):
    images = []
    for blob in blobs:
        logger.info(f"loading: {blob.name}")
        if _is_valid_file(blob.name) is False:
            logger.info(f"skip: {blob.name}")
            continue

        # バイトデータから numpy 配列を作成
        image_data = blob.download_as_string()
        image_array = np.frombuffer(image_data, dtype=np.uint8)

        # cv2.imdecode でバイト配列を画像に変換
        image = cv2.imdecode(image_array, cv2.IMREAD_COLOR)
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)  # BGRからRGBに変換
        if image is None:
            logger.error(f"Can not load: {blob.name}")
            continue
        child_id = get_child_id(blob.name)
        images.append((child_id, image))
    return images


def load_image_from_binary(args: FaceDetectAndClip_Args, binary: bytes):
    image_array = np.frombuffer(binary, dtype=np.uint8)
    image = image_array.reshape((args.photo_height, args.photo_width))
    # 画像を回転
    image = np.rot90(image, k=3)

    # TODO: GSCへの画像保存
    if image is None:
        raise ValueError("Can not load image from binary.")
    return image


def get_default_transforms():
    return transforms.Compose(
        [
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
        ]
    )


def get_default_transforms_for_gray():
    return transforms.Compose(
        [
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.5], std=[0.5]),
        ]
    )


def get_augment_transform():
    return transforms.Compose(
        [
            transforms.RandomCrop((100, 100)),
            transforms.RandomHorizontalFlip(p=0.5),
            transforms.RandomVerticalFlip(p=0.5),
            transforms.RandomApply([transforms.RandomRotation(degrees=180)], p=0.5),
            transforms.RandomApply(
                [
                    transforms.RandomAffine(
                        degrees=0, translate=(0.1, 0.1), scale=(0.8, 1.2)
                    )
                ],
                p=0.5,
            ),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
        ]
    )


def _is_valid_file(file_name):
    VALID_EXTENSIONS = {".png"}
    return os.path.splitext(file_name)[1].lower() in VALID_EXTENSIONS


def save_pickle_to_gcs(bucket: Bucket, upload_model_path: str, obj: object):
    logger.info(f"Saving pickle to {upload_model_path}")
    blob = bucket.blob(upload_model_path)
    with blob.open("wb", ignore_flush=True) as f:
        torch.save(obj, f)
    logger.info(f"pickle saved to {upload_model_path}")


def load_pickle_to_gcs(bucket: Bucket, obj_path: str) -> object:
    logger.info(f"Loading pickle from {obj_path}")
    blob = bucket.blob(obj_path)
    with blob.open("rb") as f:
        model = torch.load(f)
    logger.info(f"pickle loaded from {obj_path}")
    return model
