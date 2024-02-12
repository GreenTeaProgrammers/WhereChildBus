import torch
import torchvision.transforms.functional as TF
from torch.utils.data import Dataset
import os
import cv2


class FaceDetectDataset(Dataset):
    VALID_EXTENSIONS = {".png"}  # 適宜調整

    def __init__(self, config):
        self.data_dir = config["dataset"]["root_path"]
        self.face_data = []
        self.label_name_dict = {}
        name_label_dict = {}
        self.label_num = 0

        for file_name in os.listdir(self.data_dir):
            # macOS環境におけるDS_Storeなどのファイルをスキップ
            if not self._is_valid_file(file_name):
                continue

            file_path = os.path.join(self.data_dir, file_name)
            people_name = file_name.split("-")[0]

            # TODO: データ拡張によってはBGR -> RGB変換処理を検討
            image = cv2.imread(file_path)
            if image is None:
                continue
            image_tensor = TF.to_tensor(image)

            # 人物名とラベルの対応を辞書に保存
            if name_label_dict.get(people_name) is None:
                self.label_name_dict[self.label_num] = people_name
                name_label_dict[people_name] = self.label_num
                self.label_num += 1

            label_img_data = (
                torch.tensor(name_label_dict[people_name], dtype=torch.int64),
                image_tensor,
            )
            self.face_data.append(label_img_data)

    def _is_valid_file(self, file_name):
        return os.path.splitext(file_name)[1].lower() in self.VALID_EXTENSIONS

    def __len__(self):
        return len(self.face_data)

    def __getitem__(self, idx):
        return self.face_data[idx]

    def get_label_name_dict(self):
        return self.label_name_dict

    def get_label_num(self):
        return self.label_num

    def get_image_shape(self):
        return self.face_data[0][1].shape
