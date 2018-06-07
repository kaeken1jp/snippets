# python_featuretools snippets

https://github.com/Featuretools/featuretools

## pip install
```bash
$ pip install pyYAML --ignore-installed
$ pip install cloudpickle --ignore-installed
$ pip install featuretools
Successfully installed featuretools-0.1.21
```

## demo
```python
import featuretools as ft
es = ft.demo.load_mock_customer(return_entityset=True)
print(es)
```





