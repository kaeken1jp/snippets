# link

[pypa/pipenv: Python Development Workflow for Humans\.](https://github.com/pypa/pipenv)


# install (mac)
```bash
brew install pipenv
```


## install
```bash
pip install --user pipenv
```

# version
```bash
pipenv --version
```


## pipenv install
```bash
$ mkdir pipenv_test1
$ cd pipenv_test1/
$ pipenv --two
$ cat Pipfile
[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]

[dev-packages]

[requires]
python_version = "2.7"

$ cd ..; mkdir pipenv_test2
$ cd pipenv_test2
$ pipenv --three
$ cat Pipfile
[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]

[dev-packages]

[requires]
python_version = "3.5"
```
