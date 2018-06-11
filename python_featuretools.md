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

cf.
https://docs.featuretools.com/

```python
import featuretools as ft
import pandas as pd
#data = ft.demo.load_mock_customer(return_entityset=True)
data = ft.demo.load_mock_customer()
print(data)
customers_df = data["customers"]
print(customers_df)
sessions_df = data["sessions"]
sessions_df_sample = sessions_df.sample(5)
print(sessions_df_sample)
transactions_df = data["transactions"]
transactions_df_sample = transactions_df.sample(5)
print(transactions_df_sample)
entities = {
  "customers" : (customers_df, "customer_id"),
  "sessions" : (sessions_df, "session_id", "session_start"),
  "transactions" : (transactions_df, "transaction_id", "transaction_time")
}

relationships = [("sessions", "session_id", "transactions", "session_id"),
                ("customers", "customer_id", "sessions", "customer_id")]

feature_matrix_customers, features_defs = ft.dfs(entities=entities,
                                                 relationships=relationships,
                                                 target_entity="customers")
print(feature_matrix_customers)
print(type(feature_matrix_customers))
feature_matrix_customers.to_csv('demo_feature_matrix_customers.csv')
```




