# CLI

## dry run
```sh
bq --dry_run ...
```

## query
```sh
bq query 'select * from dataset.table'
```

## project list
```sh
bq ls
```

## dataset list
```sh
bq ls <project_id>:
```

## table list
```sh
bq ls <project_id>:<dataset>
```


## job list
```sh
bq ls -j
```

```
                         jobId                           Job Type    State      Start Time      Duration
 ------------------------------------------------------ ---------- --------- ----------------- ----------
  bquxjob_xxxxxxxx                                       query      SUCCESS   24 Apr 12:06:48   0:00:03
  scheduled_query_xxxxxxxx                               query      SUCCESS   24 Apr 12:02:13   0:00:06
  bqjob_xxxxxxxx                                         query      SUCCESS   24 Apr 11:01:46   0:00:00
  job_xxxxxxxx                                           query      SUCCESS   24 Apr 08:02:37   0:00:07
```


## all job list
```sh
bq ls -j -a
```

## show job
```sh
bq show -j bquxjob_xxxxxxxxxxxxxx
```

```
Job project_name:bquxjob_xxxxxxxxxxxxxx

  Job Type    State      Start Time      Duration              User Email               Bytes Processed   Bytes Billed   Billing Tier   Labels
 ---------- --------- ----------------- ---------- ----------------------------------- ----------------- -------------- -------------- --------
  query      SUCCESS   24 Apr 12:06:48   0:00:03    user@email.com                       18179402405       18180210688    1
```

## show detail job
```sh
bq --format prettyjson show -j bquxjob_xxxxxxxxxxxxxx
```

```
{
  "configuration": {
    "jobType": "QUERY",
    "query": {
      "allowLargeResults": false,
      "createDisposition": "CREATE_IF_NEEDED",
      "destinationTable": {
        "datasetId": "_2d481df0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "projectId": "pjt_id",
        "tableId": "xxxxxxxxxx_xxxxxxxxxx_xxxxxxxx"
      },
...
```

## set project
```sh
gcloud config set project <projectid>
```

## Displays rows in a table
```sh
bq head ddataset.table
```



## bq help
```sh
$ bq help


Python script for interacting with BigQuery.


USAGE: bq [--global_flags] <command> [--command_flags] [args]


Any of the following commands:
  cancel, cp, extract, head, help, init, insert, load, ls, mk, mkdef, partition,
  query, rm, shell, show, update, version, wait


cancel     Request a cancel and waits for the job to be cancelled.

           Requests a cancel and then either: a) waits until the job is done if
           the sync flag is set [default], or b) returns immediately if the sync
           flag is not set. Not all job types support a cancel, an error is
           returned if it cannot be cancelled. Even for jobs that support a
           cancel, success is not guaranteed, the job may have completed by the
           time the cancel request is noticed, or the job may be in a stage
           where it cannot be cancelled.

           Examples:
           bq cancel job_id # Requests a cancel and waits until the job is done.
           bq --nosync cancel job_id # Requests a cancel and returns
           immediately.

           Arguments:
           job_id: Job ID to cancel.

cp         Copies one table to another.

           Examples:
           bq cp dataset.old_table dataset2.new_table
           bq cp --destination_kms_key=kms_key dataset.old_table
           dataset2.new_table

extract    Perform an extract operation of source_table into destination_uris.

           Usage:
           extract <source_table> <destination_uris>

           Examples:
           bq extract ds.summary gs://mybucket/summary.csv

           Arguments:
           source_table: Source table to extract.
           destination_uris: One or more Google Cloud Storage URIs, separated by
           commas.

head       Displays rows in a table.

           Examples:
           bq head dataset.table
           bq head -j job
           bq head -n 10 dataset.table
           bq head -s 5 -n 10 dataset.table

help       Help for all or selected command:
               bq help [<command>]

           To retrieve help with global flags:
               bq --help

           To retrieve help with flags only from the main module:
               bq --helpshort [<command>]

init       Authenticate and create a default .bigqueryrc file.

insert     Inserts rows in a table.

           Inserts the records formatted as newline delimited JSON from file
           into the specified table. If file is not specified, reads from stdin.
           If there were any insert errors it prints the errors to stdout.

           Examples:
           bq insert dataset.table /tmp/mydata.json
           echo '{"a":1, "b":2}' | bq insert dataset.table

           Template table examples: Insert to dataset.template_suffix table
           using dataset.template table as its template.
           bq insert -x=_suffix dataset.table /tmp/mydata.json

load       Perform a load operation of source into destination_table.

           Usage:
           load <destination_table> <source> [<schema>]

           The <destination_table> is the fully-qualified table name of table to
           create, or append to if the table already exists.

           The <source> argument can be a path to a single local file, or a
           comma-separated list of URIs.

           The <schema> argument should be either the name of a JSON file or a
           text schema. This schema should be omitted if the table already has
           one.

           In the case that the schema is provided in text form, it should be a
           comma-separated list of entries of the form name[:type], where type
           will default to string if not specified.

           In the case that <schema> is a filename, it should contain a single
           array object, each entry of which should be an object with properties
           'name', 'type', and (optionally) 'mode'. See the online documentation
           for more detail:
           https://developers.google.com/bigquery/preparing-data-for-bigquery

           Note: the case of a single-entry schema with no type specified is
           ambiguous; one can use name:string to force interpretation as a
           text schema.

           Examples:
           bq load ds.new_tbl ./info.csv ./info_schema.json
           bq load ds.new_tbl gs://mybucket/info.csv ./info_schema.json
           bq load ds.small gs://mybucket/small.csv name:integer,value:string
           bq load ds.small gs://mybucket/small.csv field1,field2,field3

           Arguments:
           destination_table: Destination table name.
           source: Name of local file to import, or a comma-separated list of
           URI paths to data to import.
           schema: Either a text schema or JSON file, as above.

ls         List the objects contained in the named collection.

           List the objects in the named project or dataset. A trailing : or .
           can be used to signify a project or dataset.
           * With -j, show the jobs in the named project.
           * With -p, show all projects.

           Examples:
           bq ls
           bq ls -j proj
           bq ls -p -n 1000
           bq ls mydataset
           bq ls -a
           bq ls -m mydataset
           bq ls --routines mydataset (requires whitelisting)
           bq ls --filter labels.color:red
           bq ls --filter 'labels.color:red labels.size:*'
           bq ls --transfer_config --transfer_location='us'
           --filter='dataSourceIds:play,adwords'
           bq ls --transfer_run --filter='states:SUCCESSED,PENDING'
           --run_attempt='LATEST' projects/p/locations/l/transferConfigs/c
           bq ls --transfer_log --message_type='messageTypes:INFO,ERROR'
           projects/p/locations/l/transferConfigs/c/runs/r
           bq ls --reservation_grant --project_id=proj --location='us'
           bq ls --reservation_grant --project_id=proj --location='us'
           --reservation
           <reservation_ref>
           bq ls --connection --project_id=proj --location=us

mk         Create a dataset, table, view, or transfer configuration with this
           name.

           See 'bq help load' for more information on specifying the schema.

           Examples:
           bq mk new_dataset
           bq mk new_dataset.new_table
           bq --dataset_id=new_dataset mk table
           bq mk -t new_dataset.newtable name:integer,value:string
           bq mk --view='select 1 as num' new_dataset.newview
           (--view_udf_resource=path/to/file.js)
           bq mk --materialized_view='select sum(x) as sum_x from dataset.table'
           new_dataset.newview
           bq mk -d --data_location=EU new_dataset
           bq mk --transfer_config --target_dataset=dataset --display_name=name
           -p='{"param":"value"}' --data_source=source
           --schedule_start_time={schedule_start_time}
           --schedule_end_time={schedule_end_time}
           bq mk --transfer_run --start_time={start_time} --end_time={end_time}
           projects/p/locations/l/transferConfigs/c
           bq mk ---reservation_grant -project_id=proj --location=us
           --reservation_id=project:us.dev --job_type=QUERY
           bq mk --connection --connection_type='CLOUD_SQL'
           --properties='{"instanceId" : "instance",
           "database" : "db", "type" : "MYSQL" }'
           --connection_credential='{"username":"u", "password":"p"}'
           --project_id=proj --location=us new_connection

mkdef      Emits a definition in JSON for a GCS backed table.

           The output of this command can be redirected to a file and used for
           the external_table_definition flag with the "bq query" and "bq mk"
           commands. It produces a definition with the most commonly used values
           for options. You can modify the output to override option values.

           Usage:
           mkdef <source_uris> [<schema>]

           Examples:
           bq mkdef 'gs://bucket/file.csv' field1:integer,field2:string

           Arguments:
           source_uris: a comma-separated list of uris.
           schema: The <schema> argument should be either the name of a JSON
           file or
           a text schema.

           In the case that the schema is provided in text form, it should be a
           comma-separated list of entries of the form name[:type], where type
           will
           default to string if not specified.

           In the case that <schema> is a filename, it should contain a
           single array object, each entry of which should be an object with
           properties 'name', 'type', and (optionally) 'mode'. See the online
           documentation for more detail:
           https://developers.google.com/bigquery/preparing-data-for-bigquery

           Note: the case of a single-entry schema with no type specified is
           ambiguous; one can use name:string to force interpretation as a
           text schema.

partition  Copies source tables into partitioned tables.

           Usage: bq partition <source_table_prefix>
           <destination_partitioned_table>

           Copies tables of the format <source_table_prefix><YYYYmmdd> to a
           destination partitioned table, with the date suffix of the source
           tables becoming the partition date of the destination table
           partitions.

           If the destination table does not exist, one will be created with a
           schema and that matches the last table that matches the supplied
           prefix.

           Examples:
           bq partition dataset1.sharded_ dataset2.partitioned_table

query      Execute a query.

           Query should be specifed on command line, or passed on stdin.

           Examples:
           bq query 'select count(*) from publicdata:samples.shakespeare'
           echo 'select count(*) from publicdata:samples.shakespeare' | bq query

           Usage:
           query [<sql_query>]

rm         Delete the dataset, table, or transfer config described by
           identifier.

           Always requires an identifier, unlike the show and ls commands. By
           default, also requires confirmation before deleting. Supports the -d
           -t flags to signify that the identifier is a dataset or table.
           * With -f, don't ask for confirmation before deleting.
           * With -r, remove all tables in the named dataset.

           Examples:
           bq rm ds.table
           bq rm -m ds.model
           bq rm --routine ds.routine (requires whitelisting)
           bq rm -r -f old_dataset
           bq rm --transfer_config=projects/p/locations/l/transferConfigs/c
           bq rm --reservation_grant --project_id=proj --location=us
           query_proj_dev
           bq rm --connection --project_id=proj --location=us con

shell      Start an interactive bq session.

show       Show all information about an object.

           Examples:
           bq show -j <job_id>
           bq show dataset
           bq show [--schema] dataset.table
           bq show [--view] dataset.view
           bq show [--materialized_view] dataset.materialized_view
           bq show -m ds.model
           bq show --routine ds.routine (requires whitelisting)
           bq show --transfer_config projects/p/locations/l/transferConfigs/c
           bq show --transfer_run
           projects/p/locations/l/transferConfigs/c/runs/r
           bq show --encryption_service_account
           bq show --connection --project_id=project --location=us connection

update     Updates a dataset, table, view or transfer configuration with this
           name.

           See 'bq help load' for more information on specifying the schema.

           Examples:
           bq update --description "Dataset description" existing_dataset
           bq update --description "My table" existing_dataset.existing_table
           bq update --description "My model" -m existing_dataset.existing_model
           bq update -t existing_dataset.existing_table
           name:integer,value:string
           bq update --destination_kms_key
           projects/p/locations/l/keyRings/r/cryptoKeys/k
           existing_dataset.existing_table
           bq update --view='select 1 as num' existing_dataset.existing_view
           (--view_udf_resource=path/to/file.js)
           bq update --transfer_config --display_name=name
           -p='{"param":"value"}'
           projects/p/locations/l/transferConfigs/c
           bq update --transfer_config --target_dataset=dataset
           --refresh_window_days=5 --update_credentials
           projects/p/locations/l/transferConfigs/c
           bq update --reservation --location=US --project_id=my-project
           --reservation_size=2G
           bq update --connection_credential='{"username":"u", "password":"p"}'
           --location=US --project_id=my-project existing_connection

version    Return the version of bq.

wait       Wait some number of seconds for a job to finish.

           Poll job_id until either (1) the job is DONE or (2) the specified
           number of seconds have elapsed. Waits forever if unspecified. If no
           job_id is specified, and there is only one running job, we poll that
           job.

           Examples:
           bq wait # Waits forever for the currently running job.
           bq wait job_id # Waits forever
           bq wait job_id 100 # Waits 100 seconds
           bq wait job_id 0 # Polls if a job is done, then returns immediately.
           # These may exit with a non-zero status code to indicate "failure":
           bq wait --fail_on_error job_id # Succeeds if job succeeds.
           bq wait --fail_on_error job_id 100 # Succeeds if job succeeds in 100
           sec.

           Arguments:
           job_id: Job ID to wait on.
           secs: Number of seconds to wait (must be >= 0).


Run 'bq --help' to get help for global flags.
Run 'bq help <command>' to get help for <command>.

```



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



# SAFE_CAST
```
CAST を使用したときに、BigQuery がキャストできない場合はクエリが失敗します。たとえば、次のクエリはエラーとなります。

SELECT CAST("apple" AS INT64) AS not_a_number;
このタイプのエラーからクエリを守るには、SAFE_CAST を使用します。SAFE_CAST は CAST と同じですが、エラーの代わりに NULL を返します。

SELECT SAFE_CAST("apple" AS INT64) AS not_a_number;

+--------------+
| not_a_number |
+--------------+
| NULL         |
+--------------+
```


# partitioned-tables

[取り込み時間パーティション分割テーブルの作成と使用  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/creating-partitioned-tables?hl=ja)

```

```

## check partition infomation

```bash
bq query --nouse_legacy_sql '
SELECT
  FORMAT_TIMESTAMP("%Y%m%d", _PARTITIONTIME) as partition_id
FROM `project.dataset.table`
GROUP BY _PARTITIONTIME
ORDER BY _PARTITIONTIME'
```


# DML

[Data Manipulation Language Syntax  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#delete_statement)

## INSERT

[Data Manipulation Language Syntax  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#insert_statement)

## DELETE

[Data Manipulation Language Syntax  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#delete_statement)


### DELETE all with WHERE clause

```
Each time you construct a DELETE statement, you must use the WHERE keyword, followed by a condition.

The WHERE keyword is mandatory for any DELETE statement.

To delete all rows in a table, set the WHERE keyword condition to true:
```

```sql
DELETE FROM dataset.table WHERE true
```

### DELETE with WHERE clause

```sql
DELETE FROM dataset.table WHERE col = 'value'
```

### DELETE with subquery

```sql
DELETE dataset.table1 t1
WHERE t1.col NOT IN (SELECT col from dataset.table2)
```


## UPDATE

[Data Manipulation Language Syntax  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#update_statement)

## MERGE

[Data Manipulation Language Syntax  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/dml-syntax#merge_statement)

# REGEX_REPLACE()

[標準 SQL 関数と演算子  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators?hl=ja#regexp_replace)

```sql
WITH markdown AS
  (SELECT "# Heading" as heading
  UNION ALL
  SELECT "# Another heading" as heading)

SELECT
  REGEXP_REPLACE(heading, r"^# ([a-zA-Z0-9\s]+$)", "<h1>\\1</h1>")
  AS html
FROM markdown;
```

# CASE

[Conditional Expressions in Standard SQL  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/conditional_expressions)

```sql
CASE expr
  WHEN value THEN result
  [WHEN ...]
  [ELSE else_result]
  END
```

```sql
SELECT
  CASE value
    WHEN 'foo' THEN 'Value is foo.'
    WHEN 'bar' THEN 'Value is bar.'
    ELSE 'other value'
  END AS col
```



# limit of range_partitioning

```sh
bq mk --range_partitioning=partition_id,0,100000,1 DATASET.TABLE  ./schema.json
BigQuery error in mk operation: The number of possible partitions for range partitioning is 100000, exceeding
the limit of 10000.
```



# Compute Rank

[Analytic function concepts in Standard SQL  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/reference/standard-sql/analytic-function-concepts#compute_rank)

```
This example calculates the rank of each employee within their department, 
based on their start date. 
The window specification is defined directly in the OVER clause. 
The Employees table is referenced.

department 1
(Jacob, Anthony, Andrew) = Assign rank 1 to Jacob
(Jacob, Anthony, Andrew) = Assign rank 2 to Anthony
(Jacob, Anthony, Andrew) = Assign rank 3 to Andrew
department 2
(Isabella, Daniel, Jose) = Assign rank 1 to Isabella
(Isabella, Daniel, Jose) = Assign rank 2 to Daniel
(Isabella, Daniel, Jose) = Assign rank 3 to Jose
```

```sql
SELECT name, department, start_date,
  RANK() OVER (PARTITION BY department ORDER BY start_date) AS rank_
FROM Employees;
```

```
+--------------------------------------------+
| name      | department | start_date | rank_|
+--------------------------------------------+
| Jacob     | 1          | 1990-07-11 | 1    |
| Anthony   | 1          | 1995-11-29 | 2    |
| Andrew    | 1          | 1999-01-23 | 3    |
| Isabella  | 2          | 1997-09-28 | 1    |
| Daniel    | 2          | 2004-06-24 | 2    |
| Jose      | 2          | 2013-03-17 | 3    |
+--------------------------------------------+
```



# how to download a bigdata via bigquery

- step1: to save a table from query result
- step2: to save a csv file on GCS from bq table
- step3: to download from GCS




# LAG (value_expression[, offset [, default_expression]])



```

LAG (value_expression[, offset [, default_expression]])


Description

Returns the value of the value_expression on a preceding row. Changing the offset value changes which preceding row is returned; the default value is 1, indicating the previous row in the window frame. An error occurs if offset is NULL or a negative value.

The optional default_expression is used if there isn't a row in the window frame at the specified offset. This expression must be a constant expression and its type must be implicitly coercible to the type of value_expression. If left unspecified, default_expression defaults to NULL.

Supported Argument Types

value_expression can be any data type that can be returned from an expression.
offset must be a non-negative integer literal or parameter.
default_expression must be compatible with the value expression type.
Return Data Type

Same type as value_expression.

Examples

The following example illustrates a basic use of the LAG function.

```



```sql
WITH finishers AS
 (SELECT 'Sophia Liu' as name,
  TIMESTAMP '2016-10-18 2:51:45' as finish_time,
  'F30-34' as division
  UNION ALL SELECT 'Lisa Stelzner', TIMESTAMP '2016-10-18 2:54:11', 'F35-39'
  UNION ALL SELECT 'Nikki Leith', TIMESTAMP '2016-10-18 2:59:01', 'F30-34'
  UNION ALL SELECT 'Lauren Matthews', TIMESTAMP '2016-10-18 3:01:17', 'F35-39'
  UNION ALL SELECT 'Desiree Berry', TIMESTAMP '2016-10-18 3:05:42', 'F35-39'
  UNION ALL SELECT 'Suzy Slane', TIMESTAMP '2016-10-18 3:06:24', 'F35-39'
  UNION ALL SELECT 'Jen Edwards', TIMESTAMP '2016-10-18 3:06:36', 'F30-34'
  UNION ALL SELECT 'Meghan Lederer', TIMESTAMP '2016-10-18 3:07:41', 'F30-34'
  UNION ALL SELECT 'Carly Forte', TIMESTAMP '2016-10-18 3:08:58', 'F25-29'
  UNION ALL SELECT 'Lauren Reasoner', TIMESTAMP '2016-10-18 3:10:14', 'F30-34')
SELECT name,
  finish_time,
  division,
  LAG(name)
    OVER (PARTITION BY division ORDER BY finish_time ASC) AS preceding_runner
FROM finishers;
```

```
+-----------------+-------------+----------+------------------+
| name            | finish_time | division | preceding_runner |
+-----------------+-------------+----------+------------------+
| Carly Forte     | 03:08:58    | F25-29   | NULL             |
| Sophia Liu      | 02:51:45    | F30-34   | NULL             |
| Nikki Leith     | 02:59:01    | F30-34   | Sophia Liu       |
| Jen Edwards     | 03:06:36    | F30-34   | Nikki Leith      |
| Meghan Lederer  | 03:07:41    | F30-34   | Jen Edwards      |
| Lauren Reasoner | 03:10:14    | F30-34   | Meghan Lederer   |
| Lisa Stelzner   | 02:54:11    | F35-39   | NULL             |
| Lauren Matthews | 03:01:17    | F35-39   | Lisa Stelzner    |
| Desiree Berry   | 03:05:42    | F35-39   | Lauren Matthews  |
| Suzy Slane      | 03:06:24    | F35-39   | Desiree Berry    |
+-----------------+-------------+----------+------------------+
```



# ROUND

```sql
ROUND(123.45, 1) #=> 123.4
```




# sampling

[Table sampling  |  BigQuery  |  Google Cloud](https://cloud.google.com/bigquery/docs/table-sampling)

```sql
SELECT uuid
FROM `table`

record: 20,384,512
```

- sampling

```sql
SELECT uuid
FROM `table`
TABLESAMPLE SYSTEM (10 PERCENT)

first time: 1,457,001
second time: 1,457,645
```

- The following example reads approximately 20% of the data blocks from storage and then randomly selects 10% of the rows in those blocks:

```sql
SELECT * FROM dataset.my_table TABLESAMPLE SYSTEM (20 PERCENT)
WHERE rand() < 0.1
```
