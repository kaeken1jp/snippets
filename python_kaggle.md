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

## List competitions
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

```bash
$ cat kaggle_competitions_list.sh
#!/bin/bash

kaggle competitions list --csv > kaggle_competitions_list.csv
kaggle competitions list > kaggle_competitions_list.txt
```


## List competitions files
```
usage: kaggle competitions files [-h] [-c COMPETITION] [-v] [-q]

optional arguments:
  -h, --help            show this help message and exit
  -c COMPETITION, --competition COMPETITION
                        Competition URL suffix (use "kaggle competitions list" to show options)
                        If empty, the default competition will be used (use "kaggle config set competition")
  -v, --csv             Print results in CSV format (if not set print in table format)
  -q, --quiet           Suppress printing information about download progress
```

```bash
$ kaggle competitions files -c titanic
name                   size  creationDate
---------------------  ----  -------------------
train.csv              60KB  2013-06-28 13:40:25
test.csv               28KB  2013-06-28 13:40:24
gender_submission.csv   3KB  2017-02-01 01:49:18
```


## download competition files
```
usage: kaggle competitions download [-h] [-c COMPETITION] [-f FILE] [-p PATH]
                                    [-w] [-o] [-q]

optional arguments:
  -h, --help            show this help message and exit
  -c COMPETITION, --competition COMPETITION
                        Competition URL suffix (use "kaggle competitions list" to show options)
                        If empty, the default competition will be used (use "kaggle config set competition")
  -f FILE, --file FILE  File name, all files downloaded if not provided
                        (use "kaggle competitions files -c <competition>" to show options)
  -p PATH, --path PATH  Folder where file(s) will be downloaded, defaults to  ~/.kaggle
  -w, --wp              Download files to current working path
  -o, --force           Skip check whether local version of file is up to date, force file download
  -q, --quiet           Suppress printing information about download progress
```

```bash
$ kaggle competitions download -c titanic -p .
train.csv: Downloaded 60KB of 60KB to .
test.csv: Downloaded 28KB of 28KB to .
gender_submission.csv: Downloaded 3KB of 3KB to .

$ ls -l
total 184
-rw-r--r--  1 user1  staff   3258  6  4 17:55 gender_submission.csv
-rw-r--r--  1 user1  staff  28629  6  4 17:55 test.csv
-rw-r--r--  1 user1  staff  61194  6  4 17:55 train.csv
```


## Submit to a competition

```
usage: kaggle competitions submit [-h] [-c COMPETITION] -f FILE -m MESSAGE
                                  [-q]

required arguments:
  -f FILE, --file FILE  File for upload (full path)
  -m MESSAGE, --message MESSAGE
                        Message describing this submission

optional arguments:
  -h, --help            show this help message and exit
  -c COMPETITION, --competition COMPETITION
                        Competition URL suffix (use "kaggle competitions list" to show options)
                        If empty, the default competition will be used (use "kaggle config set competition")
  -q, --quiet           Suppress printing information about download progress
```

```bash
kaggle competitions submit -c titanic -f titanic-submission.csv -m "submission"
Successfully submitted to Titanic: Machine Learning from Disaster
```

```bash
$ cat kaggle_submission.sh
#!/bin/bash

compe_name=$1
if [ "$compe_name" = "" ] ;then
   echo "compe_name error"
   exit
fi
echo $compe_name
echo kaggle competitions submit \
  -c $compe_name \
  -f ${compe_name}-submission.csv \
  -m \"submission\"
sleep 5

kaggle competitions submit \
  -c $compe_name \
  -f ${compe_name}-submission.csv \
  -m "submission"
```

