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

## search competition
```bash
$ kaggle competitions list
ref                                             deadline             category            reward  teamCount  userHasEntered
----------------------------------------------  -------------------  ---------------  ---------  ---------  --------------
imagenet-object-detection-challenge             2029-12-31 07:00:00  Research         Knowledge          0           False
imagenet-object-detection-from-video-challenge  2029-12-31 07:00:00  Research         Knowledge          0           False
imagenet-object-localization-challenge          2029-12-31 07:00:00  Research         Knowledge         15           False
titanic                                         2020-04-07 00:00:00  Getting Started  Knowledge      11241            True
house-prices-advanced-regression-techniques     2020-03-01 23:59:00  Getting Started  Knowledge       5427           False
digit-recognizer                                2020-01-07 00:00:00  Getting Started  Knowledge       2477           False
competitive-data-science-predict-future-sales   2019-01-01 23:59:00  Playground           Kudos        646           False
home-credit-default-risk                        2018-08-29 23:59:00  Featured           $70,000       1625           False
trackml-particle-identification                 2018-08-13 23:59:00  Featured           $25,000        361           False
youtube8m-2018                                  2018-08-06 23:59:00  Featured           $25,000        144           False
freesound-audio-tagging                         2018-07-31 23:59:00  Research         Knowledge        232           False
whale-categorization-playground                 2018-07-09 23:59:00  Playground           Kudos        348           False
avito-demand-prediction                         2018-06-27 23:59:00  Featured           $25,000       1514           False
cvpr-2018-autonomous-driving                    2018-06-11 23:59:00  Research            $2,500        133           False
inaturalist-2018                                2018-06-04 23:59:00  Research             Kudos         59           False
imaterialist-challenge-fashion-2018             2018-05-30 23:59:00  Research            $2,500        212           False
imaterialist-challenge-furniture-2018           2018-05-30 23:59:00  Research            $2,500        436           False
landmark-retrieval-challenge                    2018-05-29 23:59:00  Research            $2,500        218           False
landmark-recognition-challenge                  2018-05-29 23:59:00  Research            $2,500        483           False
talkingdata-adtracking-fraud-detection          2018-05-07 23:59:00  Featured           $25,000       3967           False
```

```bash
$ kaggle competitions list -s twitter
ref                             deadline             category    reward  teamCount  userHasEntered
------------------------------  -------------------  ----------  ------  ---------  --------------
twitter-personality-prediction  2012-06-29 23:59:59  Research      $500         89           False
twitter-psychopathy-prediction  2012-06-29 23:59:59  Research    $1,000        111           False
crowdflower-weather-twitter     2013-12-01 23:59:00  Playground    $500        259           False
```
