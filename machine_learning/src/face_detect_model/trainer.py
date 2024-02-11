import os
import torch
import torch.nn as nn
import argparse

from data.faceDetectDataset import FaceDetectDataset
from model.faceDetectModel import FaceDetectModel


class Trainer:
    def __init__(
        self,
        args: argparse.Namespace,
        config: dict,
        model: FaceDetectModel,
        train_dataset: FaceDetectDataset,
        valid_dataset: FaceDetectDataset,
        test_dataset: FaceDetectDataset,
    ):
        self.args = args
        self.config = config
        self.model = model

        self.criterion = torch.nn.CrossEntropyLoss()
        self.optimizer = torch.optim.Adam(
            self.model.parameters(), lr=config["train"]["learning_rate"]
        )
        self.softmax = nn.Softmax(dim=1)

        self.epoch = 1
        self.step_num = 1

        self.best_loss = float("inf")

        self.train_dataset = train_dataset
        self.valid_dataset = valid_dataset
        self.test_dataset = test_dataset

        self.train_dataloader = torch.utils.data.DataLoader(
            self.train_dataset,
            batch_size=config["train"]["train_batch_size"],
            shuffle=True,
        )
        self.valid_dataloader = torch.utils.data.DataLoader(
            self.valid_dataset,
            batch_size=config["train"]["valid_batch_size"],
            shuffle=False,
        )
        self.test_dataloader = torch.utils.data.DataLoader(
            self.test_dataset,
            batch_size=config["train"]["test_batch_size"],
            shuffle=False,
        )

        self.save_model_dir = config["train"]["save_model_dir"]
        if not os.path.exists(self.save_model_dir):
            os.makedirs(self.save_model_dir)

    def train(self):
        for _ in range(self.config["train"]["epoch"]):
            for label, image in self.train_dataloader:
                self.step(label, image)
            self.end_epoch()

            if self.epoch % self.config["train"]["validate_interval"] == 0:
                self.save_model(
                    self.save_model_dir + f"model_epoch_{self.epoch}.pth",
                )
                self.validate()

        self.test()

    def step(self, label: torch.Tensor, image: torch.Tensor):
        self.optimizer.zero_grad()

        output = self.model(image.to(self.args.device))

        loss = self.criterion(output, label)
        loss.backward()
        self.optimizer.step()

        self.last_loss = loss.item()
        self.step_num += 1

    def end_epoch(self):
        print(f"Epoch {self.epoch} Loss: {self.last_loss}")

        if self.last_loss < self.best_loss:
            self.best_loss = self.last_loss
            self.save_model(self.save_model_dir + "best_model.pth")

        self.epoch += 1
        self.step_num = 1

    def validate(self):
        collect_list = []
        pred_list = []
        for label, image in self.valid_dataloader:
            output = self.model(image.to(self.args.device))
            output = self.softmax(output)

            pred = torch.argmax(output, 1)

            pred_list.append(pred)
            collect_list.append(label)

        accuracy = self.calc_accuracy(pred_list, collect_list)
        print(f"########## Epoch {self.epoch} ##########")
        print(f"Validation Accuracy: {accuracy}")

        if self.args.debug:
            print(f"Collect: {collect_list}")
            print(f"Predict: {pred_list}")

    def test(self):
        self.model.eval()
        collect_list = []
        pred_list = []
        for label, image in self.test_dataloader:
            with torch.no_grad():
                output = self.model(image.to(self.args.device))
            output = self.softmax(output)

            pred = torch.argmax(output, 1)

            pred_list.append(pred)
            collect_list.append(label)

        accuracy = self.calc_accuracy(pred_list, collect_list)
        print("########## Test ##########")
        print(f"Test Accuracy: {accuracy}")
        if self.args.debug:
            print(f"Collect: {collect_list}")
            print(f"Predict: {pred_list}")

    def calc_accuracy(self, pred_list, collect_list):
        pred = torch.cat(pred_list)
        collect = torch.cat(collect_list)
        accuracy = (pred == collect).sum().item() / len(collect)
        return accuracy

    def save_model(self, save_path: str):
        torch.save(self.model.state_dict(), save_path)
