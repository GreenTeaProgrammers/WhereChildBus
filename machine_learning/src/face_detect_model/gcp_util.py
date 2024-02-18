import google.cloud.storage as gcs
from google.cloud.storage import Bucket
import os


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
