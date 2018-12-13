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


# time
## timezone
```sql
#standardSQL
SELECT
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', CURRENT_TIMESTAMP()) AS UTC,
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

## CAST UNNEST
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
