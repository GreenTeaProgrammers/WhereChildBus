import torch
from torchvision import transforms
import os
import cv2
from PIL import Image

class FaceDetectDataset(torch.utils.data.Dataset):
    VALID_EXTENSIONS = {".png"}

    def __init__(self, config, transform=None):
        self.data_dir = config["dataset"]["root_path"]
        default_transform = self.get_default_transforms()
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
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)  # BGRからRGBに変換

            if people_name not in name_label_dict:
                self.label_name_dict[self.label_num] = people_name
                name_label_dict[people_name] = self.label_num
                self.label_num += 1
            
            label = torch.tensor(name_label_dict[people_name], dtype=torch.int64)
            image_pil = Image.fromarray(image)

            self.face_data.append((label, default_transform(image_pil)))
            
            augmented_images = self.augment_image(image_pil, num_variations=100)
            for aug_img in augmented_images:
                self.face_data.append((label, aug_img))

    def get_default_transforms(self):
        return transforms.Compose([
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
        ])
        
    def get_augment_transform(self):
        return transforms.Compose([
            transforms.RandomApply([transforms.Resize((256, 256))], p=0.5),
            transforms.RandomCrop((100, 100)),
            transforms.RandomHorizontalFlip(p=0.5),
            transforms.RandomVerticalFlip(p=0.5),
            transforms.RandomApply([transforms.RandomRotation(degrees=180)], p=0.5),
            transforms.RandomApply([transforms.RandomAffine(degrees=0, translate=(0.1, 0.1), scale=(0.8, 1.2))], p=0.5),
            transforms.RandomApply([transforms.ColorJitter(brightness=0.2, contrast=0.2, saturation=0.2, hue=0.1)], p=0.5),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
        ])


    def augment_image(self, image, num_variations=100):
    # ランダムな変換を適用するための拡張設定を強化
        transformations = self.get_augment_transform()
        augmented_images = []
        for _ in range(num_variations):
            augmented_image = transformations(image)
            augmented_images.append(augmented_image)
        return augmented_images

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
