import logging
import os
import random
import re

import cv2
import numpy as np
import torch
from generated.machine_learning.v1.func_args import FaceDetectAndClip_Args
from google.cloud.storage import Bucket
from torchvision import transforms

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


def load_image_from_remote(blobs: list, color_channel: int):
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

        if color_channel == 3:
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)  # BGRからRGBに変換
        elif color_channel == 1:
            image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        else:
            raise ValueError(f"Invalid color_channel: {color_channel}")

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


def get_augment_transform_for_gray():
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
            transforms.Normalize(mean=[0.5], std=[0.5]),
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


class smile_detecter:
    def __init__(
        self, scaleFactor=1.1, minNeighbors=10, cascade_path="haarcascade_smile.xml"
    ):
        self.scaleFactor = scaleFactor
        self.minNeighbors = minNeighbors
        self.smile_cascade = self.get_casecade(cascade_path)

    def get_casecade(self, cascade_path):
        cascade = cv2.CascadeClassifier(cv2.data.haarcascades + cascade_path)
        if cascade is None:
            raise ValueError(f"Can not load cascade: {cascade_path}")
        return cascade

    # def detect_smile_degree(self, gray_image):
    #     smile = self.smile_cascade.detectMultiScale(
    #         gray_image, scaleFactor=self.scaleFactor, minNeighbors=self.minNeighbors
    #     )
    #     if len(smile) > 0:
    #         (_, _, sw, sh) = smile[0]
    #         smile_area = sw * sh
    #         smile_degree = (
    #             smile_area / (gray_image.shape[0] * gray_image.shape[1]) * 100
    #         )
    #         return smile_degree
    #     return 0

    def detect_smile_degree(self, gray_image):
        smile = self.smile_cascade.detectMultiScale(
            gray_image, scaleFactor=self.scaleFactor, minNeighbors=self.minNeighbors
        )
        if len(smile) > 0:
            (_, _, sw, sh) = smile[0]
            smile_area = sw * sh
            # 仮定として、顔の最大30%が笑顔の面積となる場合
            max_smile_area = (gray_image.shape[0] * gray_image.shape[1]) * 0.25
            # 実際の笑顔の面積を最大笑顔面積で割り、100を掛けて正規化
            smile_degree = (smile_area / max_smile_area) * 100
            # 100を超える値を100に制限
            smile_degree = min(smile_degree, 100)
            return smile_degree
        else:
            return 0

    def add_smile_degree_to_image(
        self, image, smile_degree, font_scale=0.7, thickness=2
    ):
        # 画像の高さと幅を取得
        height, width = image.shape[:2]

        # テキストを追加する位置（画像の下部中央付近）
        position = (10, height - 10)  # 下部に少し余白を残す

        # テキストのフォント
        font = cv2.FONT_HERSHEY_SIMPLEX

        # テキストの色（BGR形式）
        color = (255, 255, 255)  # 白色

        # テキストの背景色
        background_color = (0, 0, 0)  # 黒色

        # 小数点以下1桁まで表示
        smile_degree = round(smile_degree, 1)

        # テキストの背景を描画（背景に少し余白を持たせるためにテキストサイズを計算）
        (text_width, text_height), _ = cv2.getTextSize(
            f"Smile degree: {smile_degree}", font, font_scale, thickness
        )
        image_copy = image.copy()
        cv2.rectangle(
            image_copy,
            position,
            (position[0] + text_width, position[1] + text_height + 10),
            background_color,
            -1,
        )

        # テキストを画像に追加
        cv2.putText(
            image_copy,
            f"Smile degree: {smile_degree}",
            position,
            font,
            font_scale,
            color,
            thickness,
            cv2.LINE_AA,
        )

        return image_copy
