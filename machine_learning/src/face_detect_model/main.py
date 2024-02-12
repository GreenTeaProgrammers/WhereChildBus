import yaml
import argparse
import torch

from data.faceDetectDataset import FaceDetectDataset
from model.faceDetectModel import FaceDetectModel
from trainer import Trainer
from util import logger


def main(args: argparse.Namespace, config: dict):
    args.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    logger.info("Your env is : {args.device}")

    # datasetの読み込み
    logger.info("dataset Initializing")
    dataset = FaceDetectDataset(config)

    train_data_size = int(len(dataset) * config["dataset"]["ratio"]["train"])
    valid_data_size = int(len(dataset) * config["dataset"]["ratio"]["valid"])
    test_data_size = len(dataset) - train_data_size - valid_data_size

    train_dataset, valid_dataset, test_dataset = torch.utils.data.random_split(
        dataset,
        [
            train_data_size,
            valid_data_size,
            test_data_size,
        ],
    )

    # modelの読み込み
    logger.info("model Initializing")
    num_classes = dataset.get_label_num()
    image_shape = dataset.get_image_shape()
    face_detect_model = FaceDetectModel(config, num_classes, image_shape)
    face_detect_model.to(args.device)

    # trainerの読み込み
    trainer = Trainer(
        args, config, face_detect_model, train_dataset, valid_dataset, test_dataset
    )
    if args.mode == "train":
        # 学習
        trainer.train()
    elif args.mode == "test":
        # テスト
        face_detect_model.load_state_dict(
            torch.load(config["train"]["test_model_path"])
        )
        trainer.test()
    else:  # TODO: 他のモードを実装する
        raise ValueError("invalid mode")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--config", type=str, default="src/face_detect_model/config.yaml"
    )
    parser.add_argument("--mode", type=str, required=True, choices=["train", "test"])
    parser.add_argument("--debug", action="store_true")
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()

    with open(args.config, "r") as f:
        config = yaml.safe_load(f)

    main(args, config)
