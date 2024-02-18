import logging
import re

import random
import torch
import google.cloud.storage as gcs
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


def init_client():
    # NOTE: gcloud auth application-default loginにて事前に認証
    PROJECT_ID = os.environ.get("PROJECT_ID")

    client = gcs.Client(PROJECT_ID)
    if client is None:
        logger.error("Failed to initialize client.")
        exit(1)
    else:
        return client


def get_bucket(client: gcs.Client, bucket_name: str):
    bucket = client.bucket(bucket_name)

    if bucket.exists():
        return bucket
    else:
        raise ValueError(f"Failed to {bucket_name} does not exist.")


def get_blobs(bucket: Bucket, blob_name: str):
    # blobsの中身に対するエラーハンドリング
    try:
        blobs = list(bucket.list_blobs(prefix=blob_name))
        if len(blobs) == 0:  # 最初の要素がない場合、イテレータは空
            raise ValueError(f"No blobs found with prefix '{blob_name}' in the bucket.")
        else:
            return blobs
    except Exception as e:
        raise ValueError(f"Failed to get blobs from '{blob_name}' due to an error: {e}")


def get_child_id(blob_name: str):
    # UUIDの正規表現パターン
    uuid_pattern = r"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"

    # 正規表現でUUIDを検索
    uuids = re.findall(uuid_pattern, blob_name)

    # 目的のUUIDを取得（2番目に現れるUUID）
    child_id = uuids[1] if len(uuids) > 1 else None
    return child_id


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


def save_model_to_gcs(
    bucket: Bucket, upload_model_path: str, model_instance: torch.nn.Module
):
    logger.info(f"Saving model to {upload_model_path}")
    blob = bucket.blob(upload_model_path)
    with blob.open("wb", ignore_flush=True) as f:
        torch.save(model_instance.state_dict(), f)
    logger.info(f"Model saved to {upload_model_path}")
