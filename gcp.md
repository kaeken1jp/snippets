# link
https://cloud.google.com/sdk/docs/

# install client(mac)
```bash
# install
curl https://sdk.cloud.google.com | bash

# restart
exec -l $SHELL

# check version
gcloud version
```

# auth
```bash
gcloud auth login

gcloud auth list

gcloud auth application-default login
```

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

