[Cloud Object Storage | Store & Retrieve Data Anywhere | Amazon Simple Storage Service (S3)](https://aws.amazon.com/s3/)

# cli

## s3

[s3 — AWS CLI 1.18.179 Command Reference](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html)

```sh

# ls
# https://docs.aws.amazon.com/cli/latest/reference/s3/ls.html
aws s3 ls s3://bucket/folder/
aws s3 ls s3://bucket/folder/ --recursive
aws s3 ls s3://bucket/ --recursive | grep file_name
aws s3 ls s3://bucket/folder/ --summarize --human-readable --recursive

# rm
# https://docs.aws.amazon.com/cli/latest/reference/s3/rm.html
aws s3 rm s3://bucket/folder/file_name
aws s3 rm s3://bucket/folder/ --recursive

# cp
aws s3 cp s3://bucket/folder/file_name .
aws s3 cp s3://stapi-us/production/ s3://stapi-us/development/ --recursive --acl public-read-write

# sync
# https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html
aws s3 sync <bucket> <target_folder> <options>
aws s3 sync s3://mybucket . --acl public-read
aws s3 sync <target_folder> <bucket>


```
