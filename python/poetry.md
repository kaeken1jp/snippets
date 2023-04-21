[Poetry - Python dependency management and packaging made easy](https://python-poetry.org/)

# pros cons 

Poetry is a popular Python package and dependency management tool that simplifies the process of managing dependencies and creating virtual environments. It has several advantages, including:

Pros:

Simplifies dependency management: Poetry simplifies the process of managing dependencies and allows you to define your project's dependencies in a single file, making it easier to keep track of them.

Virtual environments: Poetry provides support for virtual environments, making it easier to isolate dependencies between projects and avoid conflicts.

Locks dependencies: Poetry creates a lock file that specifies the exact version of each dependency, ensuring consistency across different environments and preventing conflicts.

Improved dependency resolution: Poetry uses a deterministic algorithm that ensures compatibility and resolves dependency conflicts more reliably than other tools like pip.

Easy installation: Poetry is easy to install and use, and it provides a user-friendly interface for managing projects and dependencies.

Cons:

Limited plugin support: Poetry's plugin ecosystem is still relatively small, which means that some functionality may not be available or require manual configuration.

New tool: Poetry is still a relatively new tool, and it may not be as well-established or widely adopted as other tools like pip.

Learning curve: Although Poetry is easy to use, it may take some time to learn its unique syntax and features.

Limited documentation: While Poetry has extensive documentation, some features may not be well-documented or may require additional research to understand.

In summary, Poetry is a powerful and convenient tool for managing Python projects and dependencies, and it offers several advantages over other tools like pip. However, it also has some limitations and may not be the best choice for every project or developer.



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




