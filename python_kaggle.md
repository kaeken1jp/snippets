# python_kaggle snippets

## install kaggle api

```bash
$ pip install kaggle
```

## download api key

https://github.com/Kaggle/kaggle-api
```
To use the Kaggle API, sign up for a Kaggle account at https://www.kaggle.com. Then go to the 'Account' tab of your user profile (https://www.kaggle.com/<username>/account) and select 'Create API Token'. This will trigger the download of kaggle.json, a file containing your API credentials. Place this file in the location ~/.kaggle/kaggle.json (on Windows in the location C:\Users\<Windows-username>\.kaggle\kaggle.json).
```

```bash
chmod 600 ~/.kaggle/kaggle.json
```

## all command
```bash
kaggle competitions {list, files, download, submit, submissions}
kaggle datasets {list, files, download, create, version, init}
kaggle config {view, set, unset}
```

## check kaggle config
```bash
$ kaggle config view
Configuration values from /Users/user1/.kaggle
- username: USERNAME
- path: None
- proxy: None
- competition: None
```

