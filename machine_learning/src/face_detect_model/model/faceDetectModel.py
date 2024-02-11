import torch.nn as nn


def compute_conv_output_size(L_in, kernel_size, stride=1, padding=0, dilation=1):
    """畳み込み層を通過した後の出力サイズを計算する関数"""
    L_out = int((L_in + 2 * padding - dilation * (kernel_size - 1) - 1) / stride + 1)
    return L_out


class FaceDetectModel(nn.Module):
    def __init__(self, config: dict, num_classes: int, input_dim: tuple):
        super(FaceDetectModel, self).__init__()
        self.config = config

        in_channels = config["model"]["in_channels"]
        kernel_size = config["model"]["Conv2d"]["kernel_size"]
        pooling_kernel_size = config["model"]["pooling"]["kernel_size"]
        pooling_stride = config["model"]["pooling"]["stride"]

        self.relu = nn.ReLU()
        self.pool = nn.MaxPool2d(kernel_size=pooling_kernel_size, stride=pooling_stride)

        self.conv1 = nn.Conv2d(
            in_channels=in_channels, out_channels=16, kernel_size=kernel_size
        )
        self.conv2 = nn.Conv2d(in_channels=16, out_channels=32, kernel_size=kernel_size)

        self.flatten = nn.Flatten()

        # 入力特徴マップのサイズを畳み込み層とプーリング層を通過した後のサイズで更新
        size = compute_conv_output_size(input_dim[1], kernel_size)
        size = compute_conv_output_size(
            size, pooling_kernel_size, stride=pooling_stride
        )
        size = compute_conv_output_size(size, kernel_size)
        size = compute_conv_output_size(
            size, pooling_kernel_size, stride=pooling_stride
        )

        # 最終的な特徴マップのサイズに基づいてLinear層の入力サイズを設定
        linear_input_size = 32 * size * size

        self.linear = nn.Linear(linear_input_size, config["model"]["hidden_size"])
        self.classifier = nn.Linear(config["model"]["hidden_size"], num_classes)

    def forward(self, x):
        x = self.conv1(x)
        x = self.relu(x)
        x = self.pool(x)
        x = self.conv2(x)
        x = self.relu(x)
        x = self.pool(x)
        x = self.flatten(x)
        x = self.linear(x)
        x = self.relu(x)
        x = self.classifier(x)
        return x
