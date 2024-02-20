import os

import torch
from PIL import Image

from face_detect_model.util import (
    load_image_from_remote,
)

from face_detect_model.gcp_util import get_bucket, get_blobs
from face_detect_model.util import get_augment_transform, get_default_transforms


# (child_id, image)のタプルを返す
class FaceDetectDataset(torch.utils.data.Dataset):

    def __init__(self, args, config, client):
        self.args = args
        self.config = config

        default_transform = get_default_transforms()

        bucket_name = os.environ.get("BUCKET_NAME")
        bucket = get_bucket(client, bucket_name)

        self.face_data = []
        self.label_name_dict = {}
        self.name_label_dict = {}
        self.label_num = 0

        label_image_list = []
        for child_id in args.child_ids:
            SOURCE_BLOB_NAME = f"{args.nursery_id}/{child_id}/clipped/"

            blobs = get_blobs(bucket, SOURCE_BLOB_NAME)
            label_image_list.extend(load_image_from_remote(blobs))

        for label, image in label_image_list:
            if label not in self.name_label_dict:
                self._add_label(label)

            label_tensor = self._convert_label_to_tensor(label)
            image_pil = self._convert_image_to_pil(image)

            self.face_data.append((label_tensor, default_transform(image_pil)))

            augmented_images = self.augment_image(
                image_pil,
                num_variations=self.config["dataset"]["augmentation"]["num_variations"],
            )
            for aug_img in augmented_images:
                self.face_data.append((label_tensor, aug_img))

    def _convert_label_to_tensor(self, label: str):
        return torch.tensor(self.name_label_dict[label], dtype=torch.int64)

    def _convert_image_to_pil(self, image):
        return Image.fromarray(image)

    def _add_label(self, label: str):
        self.label_name_dict[self.label_num] = label
        self.name_label_dict[label] = self.label_num
        self.label_num += 1

    def augment_image(self, image, num_variations=100):
        # ランダムな変換を適用するための拡張設定を強化
        transformations = get_augment_transform()
        augmented_images = []
        for _ in range(num_variations):
            augmented_image = transformations(image)
            augmented_images.append(augmented_image)
        return augmented_images

    def __len__(self):
        return len(self.face_data)

    def __getitem__(self, idx):
        return self.face_data[idx]

    def get_idx_label_dict(self):
        return self.label_name_dict

    def get_label_num(self):
        return self.label_num

    def get_image_shape(self):
        return self.face_data[0][1].shape
