
# setting CORS

[cors - Get or set a CORS JSON document for one or more buckets  |  Cloud Storage  |  Google Cloud](https://cloud.google.com/storage/docs/gsutil/commands/cors)

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
$ cat updateCORS.json
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

$ gsutil cors set updateCORS.json gs://<bucket name>
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
