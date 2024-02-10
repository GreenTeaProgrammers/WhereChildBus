import torch.nn as nn


class Net(nn.Module):
    def __init__(self, num_classes):
        super(Net, self).__init__()
        self.relu = nn.ReLU()
        self.pool = nn.MaxPool2d(2, stride=2)

        self.conv1 = nn.Conv2d(in_channels=1, out_channels=16, kernel_size=3)
        self.conv2 = nn.Conv2d(in_channels=16, out_channels=32, kernel_size=3)

        self.linear = nn.Linear(32 * 5 * 5, 120)
        self.classier = nn.Linear(120, num_classes)

    def forward(self, x):
        x = self.conv1(x)
        x = self.relu(x)
        x = self.pool(x)
        x = self.conv2(x)
        x = self.relu(x)
        x = self.pool(x)
        x = x.view(x.size()[0], -1)
        x = self.linear(x)
        x = self.relu(x)
        x = self.classier(x)
        return x
