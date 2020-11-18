[AWS Command Line Interface](https://aws.amazon.com/cli/?nc1=h_ls)

[aws/aws-cli: Universal Command Line Interface for Amazon Web Services](https://github.com/aws/aws-cli)

[Search · aws cli](https://gist.github.com/search?q=aws+cli)

# common

```sh
$ aws <command> <subcommand> [options and parameters]
```

# create a new configuration (default)

```sh
# To create a new configuration:
$ aws configure
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]: # https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-region
Default output format [None]: # https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-format
```


# create a new configuration (profile)

```sh
$ aws configure --profile PROFILE_NAME
AWS Access Key ID [None]: accesskey
AWS Secret Access Key [None]: secretkey
Default region name [None]:
Default output format [None]:
```

# show configuration

```sh
$ aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile             PROFILE_NAME             manual    --profile
access_key     ****************aaaa shared-credentials-file
secret_key     ****************bbbb shared-credentials-file
    region                <not set>             None    None
```

