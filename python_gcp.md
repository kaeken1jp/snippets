## pip install & ignore SSL errors
```bash
$ pip install google-cloud
//...
//... There was a problem confirming the ssl certificate ...
//...

$ pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org google-cloud

$ pip freeze | grep google-cloud
google-cloud==0.34.0
```




