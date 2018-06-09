# python_pipenv snippets

## install
```bash
pip install --user pipenv
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
