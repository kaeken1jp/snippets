# python_scikit-learn snippets

## install
```bash
pip install -U scikit-learn
```

## datasets
```python
from sklearn import datasets
iris = datasets.load_iris()
print(iris.data)
digits = datasets.load_digits()
print(digits.data)
```
