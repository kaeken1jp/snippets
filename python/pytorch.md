# PyTorch

[PyTorch](https://pytorch.org/)


## install

[Start Locally | PyTorch](https://pytorch.org/get-started/locally/)

```sh
pip install torch torchvision
```

## torch.cuda.is_available()

`torch.cuda.is_available()` is a function provided by the PyTorch library in Python that returns a boolean value indicating whether CUDA-enabled GPU (Graphics Processing Unit) is available for running computations on the device. 

CUDA is a parallel computing platform and programming model developed by NVIDIA, which is used to perform mathematical computations on GPUs. PyTorch can use GPUs to accelerate the training of deep neural networks, which is particularly useful for large-scale models that may require days or weeks to train on a CPU.

The `torch.cuda.is_available()` function checks whether the GPU is available and properly configured for use with PyTorch. If the function returns `True`, then PyTorch can use the GPU to accelerate computations. If the function returns `False`, then PyTorch cannot use the GPU and computations will be performed on the CPU.

Here's an example of using `torch.cuda.is_available()` in a PyTorch program:

```python
import torch

# Check if CUDA is available
if torch.cuda.is_available():
    device = torch.device("cuda")          # Use GPU
else:
    device = torch.device("cpu")           # Use CPU

# Create a tensor on the device
x = torch.randn(3, 3, device=device)

# Perform some computations
y = torch.matmul(x, x.transpose(0, 1))

# Move tensor back to CPU for printing
print(y.cpu())
```

In the above example, we first check whether CUDA is available using `torch.cuda.is_available()`. If it is available, we create a PyTorch device object that uses the GPU (`torch.device("cuda")`). We then create a PyTorch tensor `x` on the device and perform some computations using the `torch.matmul()` function. Finally, we move the tensor back to the CPU using the `.cpu()` method before printing its values.



# ###############################

# PyTorch VS PyTorch Lightning

https://www.pytorchlightning.ai/index.html

PyTorch Lightning is a lightweight PyTorch wrapper for high-performance AI research that aims to make the development of complex deep learning models more accessible and streamlined. It provides a standardized and simplified interface for researchers and engineers to build and train models while focusing on the high-level logic of the model architecture and training loop, instead of low-level details such as device management, distributed training, and checkpointing. 

PyTorch Lightning introduces a set of best practices for training deep learning models, including automatic batching, gradient accumulation, mixed precision, and easy logging and visualization. It also provides a range of pre-built templates and interfaces for popular research tasks such as image classification, object detection, and natural language processing.

Overall, PyTorch Lightning aims to accelerate the development of deep learning research and enable researchers to focus on innovation and experimentation rather than infrastructure and boilerplate code.

## install

```
pip install pytorch-lightning
```


## Lightning Module

```

import torch
from torch import nn
from torch.nn import functional as F
from torch.utils.data import DataLoader
from torch.utils.data import random_split
from torchvision.datasets import MNIST
from torchvision import transforms
import pytorch_lightning as pl

class LitAutoEncoder(pl.LightningModule):
	def __init__(self):
		super().__init__()
		self.encoder = nn.Sequential(
      nn.Linear(28 * 28, 64),
      nn.ReLU(),
      nn.Linear(64, 3))
		self.decoder = nn.Sequential(
      nn.Linear(3, 64),
      nn.ReLU(),
      nn.Linear(64, 28 * 28))

	def forward(self, x):
		embedding = self.encoder(x)
		return embedding

	def configure_optimizers(self):
		optimizer = torch.optim.Adam(self.parameters(), lr=1e-3)
		return optimizer

	def training_step(self, train_batch, batch_idx):
		x, y = train_batch
		x = x.view(x.size(0), -1)
		z = self.encoder(x)    
		x_hat = self.decoder(z)
		loss = F.mse_loss(x_hat, x)
		self.log('train_loss', loss)
		return loss

	def validation_step(self, val_batch, batch_idx):
		x, y = val_batch
		x = x.view(x.size(0), -1)
		z = self.encoder(x)
		x_hat = self.decoder(z)
		loss = F.mse_loss(x_hat, x)
		self.log('val_loss', loss)

# data
dataset = MNIST('', train=True, download=True, transform=transforms.ToTensor())
mnist_train, mnist_val = random_split(dataset, [55000, 5000])

train_loader = DataLoader(mnist_train, batch_size=32)
val_loader = DataLoader(mnist_val, batch_size=32)

# model
model = LitAutoEncoder()

# training
trainer = pl.Trainer(gpus=4, num_nodes=8, precision=16, limit_train_batches=0.5)
trainer.fit(model, train_loader, val_loader)
    

```


## torch.utils.checkpoint.checkpoint()

```python
import torch
import torch.nn as nn
import torch.utils.checkpoint as checkpoint

class MyModel(nn.Module):
    def __init__(self):
        super(MyModel, self).__init__()
        self.conv1 = nn.Conv2d(3, 64, kernel_size=3, stride=1, padding=1)
        self.conv2 = nn.Conv2d(64, 128, kernel_size=3, stride=1, padding=1)
        self.conv3 = nn.Conv2d(128, 256, kernel_size=3, stride=1, padding=1)
        self.fc1 = nn.Linear(256*8*8, 1024)
        self.fc2 = nn.Linear(1024, 10)

    def forward(self, x):
        x = checkpoint.checkpoint(self.conv1, x)
        x = checkpoint.checkpoint(self.conv2, x)
        x = checkpoint.checkpoint(self.conv3, x)
        x = x.view(-1, 256*8*8)
        x = checkpoint.checkpoint(self.fc1, x)
        x = self.fc2(x)
        return x


model = MyModel()


learning_rate = 0.01
optimizer = torch.optim.SGD(model.parameters(), lr=learning_rate)


for epoch in range(num_epochs):
    for i, (images, labels) in enumerate(train_loader):
       
        outputs = model(images)
        loss = criterion(outputs, labels)
        
       
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        
        
        if i % save_interval == 0:
            checkpoint_name = f"checkpoint_{epoch}_{i}.pt"
            checkpoint_data = {'model': model.state_dict(),
                               'optimizer': optimizer.state_dict(),
                               'epoch': epoch,
                               'i': i}
            torch.save(checkpoint_data, checkpoint_name)
```
