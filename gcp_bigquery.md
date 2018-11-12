
# timezone

```sql
#standardSQL
SELECT
  FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', CURRENT_TIMESTAMP()) AS UTC,
  CURRENT_DATETIME('Asia/Tokyo') AS JST,
  STRING(CURRENT_TIMESTAMP(), 'Asia/Tokyo') AS JST2, -- 日本(+9H)
  STRING(CURRENT_TIMESTAMP(), '-8') AS PST  -- Pacific Standard Time
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
