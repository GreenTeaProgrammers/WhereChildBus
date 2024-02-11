import torch
from torch.utils.data import Dataset
import os
import cv2


class FaceDetectDataset(Dataset):
    def __init__(self, config):
        self.data_dir = config["dataset"]["root_path"]
        self.data = []
        self.label_name_dict = {}
        name_label_dict = {}
        self.label_num = 0

        for file in os.listdir(self.data_dir):
            file_path = os.path.join(self.data_dir, file)
            name = file.split("-")[0]
            image = cv2.imread(file_path)
            one_data = [torch.Tensor(self.label_num), image]
            self.data.append(one_data)

            if name_label_dict.get(name) is None:
                self.label_name_dict[self.label_num] = name
                name_label_dict[name] = self.label_num
                self.label_num += 1

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        return self.data[idx]

    def get_label_name_dict(self):
        return self.label_name_dict

    def get_label_num(self):
        return self.label_num
