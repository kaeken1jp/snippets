# mysql snippets

## db login
```bash
mysql -u <DB_USER> -D <DB_NAME>
```

## Select

```sql
SELECT column1, column2, ...
FROM table_name;

SELECT * FROM table_name;
```

## Insert

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

## Update

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

## Delete

```sql
DELETE FROM table_name
WHERE condition;
```

## (TODO:check) dump shellscript

```bash
#!/bin/bash

PATH_OUTPUT=/var/tmp/data
DB_HOST=host
DB_USER=user
DB_PASS=pass
STR_CHK_TBL=string

for DATABASE in $(mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -N -s -e"show databases;"); do
  if [[ ! $DATABASE =~ $STR_CHK_TBL.* ]]; then
    continue
  fi
  echo "[$DATABASE table]"
  for TABLE in $(mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -N -s -e"show tables in $DATABASE ;"); do
    mysqldump -u$DB_USER -p$DB_PASS -h$DB_HOST -d $DATABASE $TABLE\
      | grep -v '^$'\
      | grep -v '^--'\
      | grep -v '^/'\
      > $PATH_OUTPUT/$DATABASE.$TABLE.sql
  done
done
```

