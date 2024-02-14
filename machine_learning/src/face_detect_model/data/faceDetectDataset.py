import torch
from torchvision import transforms
import os
import cv2
from PIL import Image  # PILライブラリからImageクラスをインポート

class FaceDetectDataset(torch.utils.data.Dataset):
    VALID_EXTENSIONS = {".png"}  # 変更しない

    def __init__(self, config, transform=None):
        self.data_dir = config["dataset"]["root_path"]
        self.transform = transform if transform is not None else self.default_transforms()
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

            if name_label_dict.get(people_name) is None:
                self.label_name_dict[self.label_num] = people_name
                name_label_dict[people_name] = self.label_num
                self.label_num += 1

            self.face_data.append((
                torch.tensor(name_label_dict[people_name], dtype=torch.int64),
                image,  # ここではNumPy配列として格納
            ))

    @staticmethod
    def default_transforms():
        return transforms.Compose([
            transforms.ToPILImage(),  # NumPy配列をPIL Imageに変換
            transforms.Resize((224, 224)),
            transforms.RandomHorizontalFlip(),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
        ])

    def augment_image(self, image, num_variations=5):
        transformations = self.default_transforms()  # デフォルトの変換を使用
        augmented_images = []

        for _ in range(num_variations):
            # ここでランダムな変換を適用する
            augmented_image = transformations(image)
            augmented_images.append(augmented_image)

        return torch.stack(augmented_images)  # テンソルのリストをスタックして返す

    def _is_valid_file(self, file_name):
        return os.path.splitext(file_name)[1].lower() in self.VALID_EXTENSIONS

    def __len__(self):
        return len(self.face_data)

    def __getitem__(self, idx):
        label, image_np = self.face_data[idx]
        image = Image.fromarray(image_np)  # NumPy配列をPIL Imageに変換

        # ここでaugment_imageメソッドを使用して画像のバリエーションを生成
        augmented_images = self.augment_image(image)

        # ラベルと拡張された画像のリストを紐付けて返す
        return [(label, augmented_image) for augmented_image in augmented_images]

    def get_label_name_dict(self):
        return self.label_name_dict

    def get_label_num(self):
        return self.label_num

    def get_image_shape(self):
        if len(self.face_data) > 0:
            _, sample_image = self.face_data[0]
            if self.transform:
                sample_image = self.transform(sample_image)
            return sample_image.shape
        else:
            return None