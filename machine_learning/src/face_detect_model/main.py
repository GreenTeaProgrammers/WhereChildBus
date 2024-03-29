import argparse
import os

import torch
import yaml
from dotenv import load_dotenv
from face_detect_model.data.faceDetectDataset import FaceDetectDataset
from face_detect_model.gcp_util import get_bucket, init_client
from face_detect_model.model.faceDetectModel import FaceDetectModel
from face_detect_model.trainer import Trainer
from face_detect_model.util import logger, save_pickle_to_gcs, switch_to_bus_type

load_dotenv("secrets/.env")


def TrainAndTest(args: argparse.Namespace, config: dict):
    args.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    logger.info(f"Your env is : {args.device}")

    logger.info("client Initializing")
    client = init_client()

    # datasetの読み込み
    logger.info("dataset Initializing")
    dataset = FaceDetectDataset(args, config, client)

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

    idx_to_label = dataset.get_idx_label_dict()
    if args.mode == "train":
        bucket = get_bucket(
            client,
            os.environ.get("BUCKET_NAME_FOR_MODEL"),
        )
        save_pickle_to_gcs(
            bucket=bucket,
            upload_model_path=f"{args.nursery_id}/{args.bus_id}/idx_to_label_{switch_to_bus_type(args.bus_type)}.pth",
            obj=idx_to_label,
        )
        logger.info("idx_to_label is saved")

    # modelの読み込み
    logger.info("model Initializing")
    num_classes = dataset.get_label_num()
    image_shape = dataset.get_image_shape()

    face_detect_model = FaceDetectModel(
        config, num_classes=num_classes, input_dim=image_shape
    )
    face_detect_model.to(args.device)

    # trainerの読み込み
    trainer = Trainer(
        args,
        config,
        client,
        face_detect_model,
        train_dataset,
        valid_dataset,
        test_dataset,
    )
    if args.mode == "train":
        # 学習
        trainer.train()
        logger.info("Done training!")
    elif args.mode == "test":
        # テスト
        face_detect_model.load_state_dict(
            torch.load(config["train"]["test_model_path"])
        )
        trainer.test()
    else:  # TODO: 他のモードを実装する
        raise ValueError("invalid mode")


def main(args: argparse.Namespace):
    # TODO: configに関するsanity_checkを実装する
    with open("src/face_detect_model/config.yaml", "r") as f:
        config = yaml.safe_load(f)
    TrainAndTest(args, config)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", type=str, choices=["train", "test"], default="train")
    parser.add_argument("--nursery_id", type=str)
    parser.add_argument(
        "--child_ids",
        type=str,
        nargs="*",
    )
    parser.add_argument("--bus_id", type=str)
    parser.add_argument("--bus_type", type=int)

    args = parser.parse_args()

    main(args)
