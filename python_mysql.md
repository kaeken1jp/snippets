# python_mysql snippets

## pip install
```bash
pip install PyMySQL
pip install SQLAlchemy
```

## init
```python
import pymysql
pymysql.install_as_MySQLdb()
from sqlalchemy import create_engine

def get_mysql_engine():

    db_settings = {"host":     <DB_HOST>,
                   "database": <DB_NAME>,
                   "user":     <DB_USER>,
                   "password": <DB_PASS>,
                   "port":     <DB_PORT>,
                   "charset":  "utf8"}

    conn_str = 'mysql://{user}:{password}@{host}:{port}/{database}?charset={charset}'
    mysql_engine = create_engine(conn_str.format(**db_settings))
    return mysql_engine
```

## def insert_table from pandas
```python
def insert_table(df, table_name):
    mysql_engine = get_mysql_engine()
    df.to_sql(table_name, mysql_engine, if_exists = 'append', index=False)
    mysql_engine.dispose()

    return
```

## insert 
```python
import pandas as pd
columns = ['col1', 'col2']
record = [["value1", "value2"]]
df = pd.DataFrame(record, columns=columns)
table_name = '<TBL_NAME>'
res = insert_table(df, table_name)
```


