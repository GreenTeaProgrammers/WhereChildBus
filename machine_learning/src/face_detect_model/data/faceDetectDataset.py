import torch
from torchvision import transforms
import torchvision.transforms.functional as TF
from torch.utils.data import Dataset
import os
import cv2

class FaceDetectDataset(Dataset):
    VALID_EXTENSIONS = {".png"}  # 適宜調整

    def __init__(self, config, transform=None):
        self.data_dir = config["dataset"]["root_path"]
        self.transform = transform
        self.face_data = []
        self.label_name_dict = {}
        name_label_dict = {}
        self.label_num = 0

        for file_name in os.listdir(self.data_dir):
            if not self._is_valid_file(file_name):
                continue

            file_path = os.path.join(self.data_dir, file_name)
            people_name = file_name.split("-")[0]

            image = cv2.imread(file_path)
            if image is None:
                continue
            # BGRからRGBに変換
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            # 画像をPIL Imageに変換（transformにPIL Imageを要求する場合）
            # image = Image.fromarray(image)

            # 人物名とラベルの対応を辞書に保存
            if name_label_dict.get(people_name) is None:
                self.label_name_dict[self.label_num] = people_name
                name_label_dict[people_name] = self.label_num
                self.label_num += 1

            # label_img_dataの代わりに、(label, image)のタプルを直接face_dataに追加
            self.face_data.append((
                torch.tensor(name_label_dict[people_name], dtype=torch.int64),
                image,  # この時点ではまだNumPy配列
            ))

    def _is_valid_file(self, file_name):
        return os.path.splitext(file_name)[1].lower() in self.VALID_EXTENSIONS

    def __len__(self):
        return len(self.face_data)

    def __getitem__(self, idx):
        label, image = self.face_data[idx]

        # transformが定義されている場合はここで適用
        if self.transform:
            image = self.transform(image)

        return label, image

    def get_label_name_dict(self):
        return self.label_name_dict

    def get_label_num(self):
        return self.label_num

    def get_image_shape(self):
        # 最初の画像の形状を取得するために変換後のTensorを使用
        if len(self.face_data) > 0:
            _, sample_image = self.face_data[0]
            if self.transform:
                sample_image = self.transform(sample_image)
            return sample_image.shape
        else:
            return None