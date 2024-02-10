import torch.nn as nn


class Net(nn.Module):
    def __init__(self, config: dict, num_classes: int):
        super(Net, self).__init__()
        self.config = config
        # 汎用性のために入力チャンネル数をconfigから取得(一応)
        in_channels = config["model"]["in_channels"]
        self.relu = nn.ReLU()
        self.pool = nn.MaxPool2d(
            kernel_size=config["model"]["kernel_size"], stride=config["model"]["stride"]
        )

        self.conv1 = nn.Conv2d(
            in_channels=in_channels,
            out_channels=16,
            kernel_size=config["model"]["Conv2d"]["kernel_size"],
        )
        self.conv2 = nn.Conv2d(
            in_channels=16,
            out_channels=32,
            kernel_size=config["model"]["Conv2d"]["kernel_size"],
        )
        # Flatten操作を明示的に
        self.flatten = nn.Flatten()
        self.linear = nn.Linear(32 * 5 * 5, config["model"]["hidden_size"])
        self.classifier = nn.Linear(config["model"]["hidden_size"], num_classes)

    def forward(self, x):
        x = self.conv1(x)
        x = self.relu(x)
        x = self.pool(x)
        x = self.conv2(x)
        x = self.relu(x)
        x = self.pool(x)
        # Flatten層を使用
        x = self.flatten(x)
        x = self.linear(x)
        x = self.relu(x)
        x = self.classifier(x)
        return x
