[Poetry - Python dependency management and packaging made easy](https://python-poetry.org/)

# install

```
$ pip install poetry
```

```
curl -sSL https://install.python-poetry.org | python3 -
```

# version

```
poetry -V
```

# basic usage

```
$ poetry new poetry-demo

$ cd poetry-demo/

$ tree
.
├── README.md
├── poetry_demo
│   └── __init__.py
├── pyproject.toml
└── tests
    └── __init__.py
```


```
$ cat pyproject.toml
[tool.poetry]
name = "poetry-demo"
version = "0.1.0"
description = ""
authors = ["xxx"]
readme = "README.md"
packages = [{include = "poetry_demo"}]

[tool.poetry.dependencies]
python = "^3.8"


[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
```

