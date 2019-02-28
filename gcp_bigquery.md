# Enabling Standard SQL
# Standard SQL Data Types
# Standard SQL Query Syntax
# Standard SQL Functions & Operators
# Standard SQL Lexical Structure
# Standard SQL User-Defined Functions
# Wildcard Tables in Standard SQL
# Data Manipulation Language in Standard SQL
# DML Syntax in Standard SQL




# basic SQL format
```sql
#standardSQL
WITH

table1 AS (
)

SELECT
  *
FROM
  table1
ORDER BY
  time
```

# without using table
```sql
SELECT
  id,
  position,
  ['a', 'b', 'c'][OFFSET(position)] AS name
FROM
 UNNEST([1, 2, 3]) AS id WITH OFFSET AS position
```

```
[
  {
    "id": "1",
    "position": "0",
    "name": "a"
  },
  {
    "id": "2",
    "position": "1",
    "name": "b"
  },
  {
    "id": "3",
    "position": "2",
    "name": "c"
  }
]
```


# time

## now
```sql
SELECT CURRENT_DATETIME("Asia/Tokyo") as now;
```
## time format
```sql
# FORMAT_DATE(format, 日付)
# 指定したフォーマットに、日付の形式を変更する
# %a:省略した曜日名
# %b:省略した月名
# %F:YYYY-MM-DD
# %Y:西暦４桁
# %m:月
# %d:日

SELECT 
  FORMAT_DATE("%A", DATE "2017-12-22"), 
  FORMAT_DATE("%a", DATE "2017-12-22"),
  FORMAT_DATE("%B", DATE "2017-12-22"),
  FORMAT_DATE("%b", DATE "2017-12-22"),
  FORMAT_DATE("%F", DATE "2017-12-22"),
  FORMAT_DATE("%Y", DATE "2017-12-22"),
  FORMAT_DATE("%d", DATE "2017-12-22")

/*
=>
  Friday
  Fri
  December
  Dec
  2017-12-22
  2017
  12
  22
  */
```

## timezone
```sql
#standardSQL
SELECT
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', CURRENT_TIMESTAMP()) AS UTC,
  FORMAT_TIMESTAMP('%Y/%m/%d %a', TIMESTAMP_SECONDS(time), 'Asia/Tokyo') AS date,
  CURRENT_DATETIME('Asia/Tokyo') AS JST,
  STRING(CURRENT_TIMESTAMP(), 'Asia/Tokyo') AS JST2, -- 日本(+9H)
  STRING(CURRENT_TIMESTAMP(), '-8') AS PST  -- Pacific Standard Time
```

## time diff
```sql
#standardSQL
SELECT
  -- 曜日を取得
  EXTRACT(DAYOFWEEK FROM CURRENT_DATE('Asia/Tokyo')),
 
  -- 日を取得
  EXTRACT(DAY FROM CURRENT_DATE('Asia/Tokyo')),
  
  -- 通日を取得
  EXTRACT(DAYOFYEAR FROM CURRENT_DATE('Asia/Tokyo')),
  
  -- 月を取得
  EXTRACT(MONTH FROM CURRENT_DATE('Asia/Tokyo')),
  
  -- クオーターを取得(１月から数えて)を取得
  EXTRACT(QUARTER FROM CURRENT_DATE('Asia/Tokyo')),
  
  -- 年を取得
  EXTRACT(YEAR FROM CURRENT_DATE('Asia/Tokyo')),

  -- 過去 7 日前
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE('Asia/Tokyo'), INTERVAL 7 DAY)) AS SEVEN_DAYS_AGO,
  
  -- 過去 1 日前
  FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE('Asia/Tokyo'), INTERVAL 1 DAY)) AS YESTERDAY,
  
  -- 先週 月曜日
  FORMAT_DATE("%Y%m%d", DATE_ADD(DATE_TRUNC(DATE_SUB(CURRENT_DATE('Asia/Tokyo'), INTERVAL 1 WEEK), WEEK), INTERVAL 1 DAY)) AS LAST_WEEK_FIRST_DAY,
  
  -- 先週 日曜日
  FORMAT_DATE("%Y%m%d", DATE_TRUNC(CURRENT_DATE('Asia/Tokyo'), WEEK)) AS LAST_WEEK_LAST_DAY,
  
  -- 先月 1 日
  FORMAT_DATE("%Y%m%d", DATE_TRUNC(DATE_SUB(CURRENT_DATE('Asia/Tokyo'), INTERVAL 1 MONTH), MONTH)) AS LAST_MONTH_FIRST_DAY,
  
  -- 先月 末 日
  FORMAT_DATE("%Y%m%d", DATE_SUB(DATE_TRUNC(CURRENT_DATE('Asia/Tokyo'), MONTH), INTERVAL 1 DAY)) AS LAST_MONTH_LAST_DAY 
```


# GROUP BY

https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax?hl=ja#group-by-clause

## GROUP BY ROLLUP
```sql

WITH Sales AS (
  SELECT 123 AS sku, 1 AS day, 9.99 AS price UNION ALL
  SELECT 123, 1, 8.99 UNION ALL
  SELECT 456, 1, 4.56 UNION ALL
  SELECT 123, 2, 9.99 UNION ALL
  SELECT 789, 3, 1.00 UNION ALL
  SELECT 456, 3, 4.25 UNION ALL
  SELECT 789, 3, 0.99
)
SELECT
  sku,
  day,
  SUM(price) AS total
FROM Sales
GROUP BY ROLLUP(sku, day)
ORDER BY sku, day;


+------+------+-------+
| sku  | day  | total |
+------+------+-------+
| NULL | NULL | 39.77 |
|  123 | NULL | 28.97 |
|  123 |    1 | 18.98 |
|  123 |    2 |  9.99 |
|  456 | NULL |  8.81 |
|  456 |    1 |  4.56 |
|  456 |    3 |  4.25 |
|  789 |    3 |  1.99 |
|  789 | NULL |  1.99 |
+------+------+-------+
```





# CAST UNNEST
```sql
SELECT SUM(CAST(number_string AS INT64))
FROM UNNEST(['1', '2', NULL, '4'])
  AS number_string
```

# aggregate-functions
## link
[標準 SQL 関数と演算子  \|  BigQuery  \|  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#array_agg)

## ARRAY_AGG
```sql
SELECT FORMAT("%T", ARRAY_AGG(x)) AS array_agg
FROM UNNEST([NULL, 1, -2, 3, -2, 1, NULL]) AS x
UNION ALL
SELECT FORMAT("%T", ARRAY_AGG(DISTINCT x)) AS array_agg
FROM UNNEST([NULL, 1, -2, 3, -2, 1, NULL]) AS x
UNION ALL
SELECT FORMAT("%T", ARRAY_AGG(x IGNORE NULLS)) AS array_agg
FROM UNNEST([NULL, 1, -2, 3, -2, 1, NULL]) AS x
```
```
行	array_agg	
1	
[NULL, 1, -2, 3, -2, 1, NULL]
2	
[1, -2, 3, NULL]
3	
[1, -2, 3, -2, 1]
```


# Window function

## first_value

https://cloud.google.com/bigquery/query-reference?hl=ja#first_value

```sql
# ウィンドウ内の <field_name> の最初の値を返します
FIRST_VALUE(value) OVER (PARTITION BY key_col ORDER BY value DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS first_value
```

# UDF
https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions?hl=ja


## urlDecode

```sql
CREATE TEMPORARY FUNCTION urlDecode(url STRING)
RETURNS STRING
LANGUAGE js AS """
  return decodeURI(url);
""";
```

# const tips
```
#standardSQL
----------
-- 定数定義
----------
WITH
sdt_tbl AS (SELECT '20190201' AS sdt) -- データ期間の開始日
,edt_tbl AS (SELECT '20190207' AS edt) -- データ期間の終了日

----------
-- 処理
----------
SELECT FORMAT_TIMESTAMP('%Y/%m/%d %a', TIMESTAMP_SECONDS(time), 'Asia/Tokyo') AS date,COUNT(*)
FROM ...
WHERE _TABLE_SUFFIX BETWEEN (SELECT * FROM sdt_tbl) AND (SELECT * FROM edt_tbl)
GROUP BY date
ORDER BY date
```



