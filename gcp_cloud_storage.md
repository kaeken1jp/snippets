
# setting CORS

[cors - Get or set a CORS JSON document for one or more buckets  |  Cloud Storage  |  Google Cloud](https://cloud.google.com/storage/docs/gsutil/commands/cors)

Gets or sets the Cross-Origin Resource Sharing (CORS) configuration on one or more buckets. This command is supported for buckets only, not objects. An example CORS JSON document looks like the following:

```bash
# initialize
$ cat blank.json
[]

$ gsutil cors set blank.json gs://<bucket name>
Setting CORS on gs://<bucket name>/...

# check
$ gsutil cors get gs://<bucket name>
gs://<bucket name>/ has no CORS configuration.

# update
$ cat CORS.json
[
  {
    "maxAgeSeconds": 3600,
    "method": [
      "GET",
      "HEAD"
    ],
    "origin": [
      "https://domain.com"
    ],
    "responseHeader": [
      "Content-Type"
    ]
  }
]

$ gsutil cors set CORS.json gs://<bucket name>
Setting CORS on gs://<bucket name>/...

# check
$ gsutil cors get gs://<bucket name> | jq
[
  {
    "maxAgeSeconds": 3600,
    "method": [
      "GET",
      "HEAD"
    ],
    "origin": [
      "https://domain.com"
    ],
    "responseHeader": [
      "Content-Type"
    ]
  }
]
```
