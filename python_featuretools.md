# python_featuretools snippets

https://github.com/Featuretools/featuretools
https://docs.featuretools.com/

## pip install
```bash
$ pip install pyYAML --ignore-installed
$ pip install cloudpickle --ignore-installed
$ pip install featuretools
Successfully installed featuretools-0.1.21
```

## getting started
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

## Running DFS
```python
feature_matrix, feature_defs = ft.dfs(entityset=es,
    target_entity="customers",
    agg_primitives=["count"],
    trans_primitives=["month"],
    max_depth=1)

feature_matrix
```

## Creating "Deep Features"
```python
feature_matrix, feature_defs = ft.dfs(entityset=es,
    target_entity="customers",
    agg_primitives=["mean", "sum", "mode"],
    trans_primitives=["month", "hour"],
    max_depth=2)

feature_matrix
feature_matrix[['MEAN(sessions.SUM(transactions.amount))']]
feature_matrix[['MODE(sessions.HOUR(session_start))']]
```


## Changing Target Entity
```python
feature_matrix, feature_defs = ft.dfs(entityset=es,
    target_entity="sessions",
    agg_primitives=["mean", "sum", "mode"],
    trans_primitives=["month", "hour"],
    max_depth=2)

feature_matrix.head(5)
feature_matrix[['customers.MEAN(transactions.amount)']].head(5)
```


