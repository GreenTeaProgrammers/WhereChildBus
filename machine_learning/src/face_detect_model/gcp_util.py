import os

import cv2
import google.cloud.storage as gcs
import numpy as np
from face_detect_model.util import logger
from google.cloud.storage import Blob, Bucket


def init_client():
    # NOTE: gcloud auth application-default loginにて事前に認証
    PROJECT_ID = os.environ.get("PROJECT_ID")

    client = gcs.Client(PROJECT_ID)
    if client is None:
        raise RuntimeError("Failed to initialize client.")
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


def decode_face_image_from_ndaarray(face_image: np.ndarray):
    _, encoded_image = cv2.imencode(".png", face_image)
    png_clipped_face_data = encoded_image.tobytes()
    return png_clipped_face_data


def save_face_image_to_remote(
    face_image: np.ndarray,
    save_blob_name: str,
    bucket: Bucket,
):
    """クリップされた顔画像をGCSに保存する"""
    png_cliped_face_data = decode_face_image_from_ndaarray(face_image)

    save_blob = Blob(save_blob_name, bucket)
    save_blob.upload_from_string(data=png_cliped_face_data, content_type="image/png")
    logger.info(f"Saved face image to {save_blob_name} in GCS.")
