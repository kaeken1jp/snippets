# link
https://cloud.google.com/sdk/docs/

[Compare AWS and Azure services to Google Cloud](https://cloud.google.com/free/docs/aws-azure-gcp-service-comparison)


[GoogleCloudPlatform/python-docs-samples: Code samples used on cloud.google.com](https://github.com/GoogleCloudPlatform/python-docs-samples)

[Technical Guides  |  Solutions  |  Google Cloud](https://cloud.google.com/docs/tutorials)



# install client(mac)
```bash
# install
curl https://sdk.cloud.google.com | bash

# restart
exec -l $SHELL

# check version
gcloud version
```

# pip install & ignore SSL errors
```bash
$ pip install google-cloud
//...
//... There was a problem confirming the ssl certificate ...
//...

$ pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org google-cloud

$ pip freeze | grep google-cloud
google-cloud==0.34.0
```


# auth
```bash
gcloud auth login

gcloud auth list

gcloud auth application-default login
```

[gcloud auth application-default login  |  Cloud SDK  |  Google Cloud](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)


# config
```bash
gcloud config list
```

# set project
```bash
gcloud config set project <project name>
```

# show components list
```bash
$ gcloud components list
```

# install components
```bash
$ gcloud components install <name>
$ gcloud components install kubectl
```

# update components
```bash
$ gcloud components update

```

