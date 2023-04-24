# PyTorch

[PyTorch](https://pytorch.org/)


## install

[Start Locally | PyTorch](https://pytorch.org/get-started/locally/)

```sh
pip install torch torchvision
```



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
