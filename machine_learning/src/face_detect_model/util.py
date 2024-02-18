import logging
import re

import random
import torch
from google.cloud.storage import Bucket
import os
import numpy as np

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


def _is_valid_file(file_name):
    VALID_EXTENSIONS = {".png"}
    return os.path.splitext(file_name)[1].lower() in VALID_EXTENSIONS


def save_pickle_to_gcs(bucket: Bucket, upload_model_path: str, obj: object):
    logger.info(f"Saving model to {upload_model_path}")
    blob = bucket.blob(upload_model_path)
    with blob.open("wb", ignore_flush=True) as f:
        torch.save(obj, f)
    logger.info(f"Model saved to {upload_model_path}")
