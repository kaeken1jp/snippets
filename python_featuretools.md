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

```
Entityset: transactions
  Entities:
    transactions [Rows: 500, Columns: 5]
    products [Rows: 5, Columns: 2]
    customers [Rows: 5, Columns: 3]
    sessions [Rows: 35, Columns: 4]
  Relationships:
    transactions.product_id -> products.product_id
    transactions.session_id -> sessions.session_id
    sessions.customer_id -> customers.customer_id
```

```python
feature_matrix, features_defs = ft.dfs(entityset=es, target_entity="customers")
feature_matrix.head(5)
```







