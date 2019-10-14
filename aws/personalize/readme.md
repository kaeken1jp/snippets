[Amazon Personalize Documentation](https://docs.aws.amazon.com/personalize/index.html)

# tutorial

[Amazon Personalize – Real-Time Personalization and Recommendation for Everyone | AWS News Blog](https://aws.amazon.com/jp/blogs/aws/amazon-personalize-real-time-personalization-and-recommendation-for-everyone/)

## step0: select AMI
```
AMI 
Anaconda with Python 3
 (1)| Anaconda3 2019.07 20190724 Previous versions | By Anaconda
```

```sh
$ pip install boto3
$ pip show boto3
Name: boto3
Version: 1.9.248
Summary: The AWS SDK for Python
Home-page: https://github.com/boto/boto3
Author: Amazon Web Services
Author-email: UNKNOWN
License: Apache License 2.0
Location: /opt/conda/lib/python3.7/site-packages
Requires: jmespath, botocore, s3transfer
Required-by: 

$ pip show pandas
Name: pandas
Version: 0.24.2
Summary: Powerful data structures for data analysis, time series, and statistics
Home-page: http://pandas.pydata.org
Author: None
Author-email: None
License: BSD
Location: /opt/conda/lib/python3.7/site-packages
Requires: numpy, python-dateutil, pytz
Required-by: statsmodels, seaborn
```


## step1: download

[MovieLens 20M Dataset | GroupLens](https://grouplens.org/datasets/movielens/20m/)

```sh
mkdir personalize_tutorial
cd personalize_tutorial
curl -o ml-20m.zip http://files.grouplens.org/datasets/movielens/ml-20m.zip
unzip ml-20m.zip
rm ml-20m.zip
```

```sh
$ head ml-20m/ratings.csv
userId,movieId,rating,timestamp
1,2,3.5,1112486027
1,29,3.5,1112484676
1,32,3.5,1112484819
1,47,3.5,1112484727
1,50,3.5,1112484580
1,112,3.5,1094785740
1,151,4.0,1094785734
1,223,4.0,1112485573
1,253,4.0,1112484940
```

## step2: Data pre-processing

```sh
cd personalize_tutorial/ml-20m
vi pre_processing.py
cat pre_processing.py
```

```py
import pandas, boto3 
from sklearn.utils import shuffle
ratings = pandas.read_csv('ratings.csv')
ratings = shuffle(ratings)
ratings = ratings[ratings['rating']>3.6]
ratings = ratings.drop(columns='rating')
ratings.columns = ['USER_ID','ITEM_ID','TIMESTAMP']
ratings = ratings[:100000]
ratings.to_csv('ratings.processed.csv',index=False)
s3 = boto3.client('s3')
s3.upload_file('ratings.processed.csv','jsimon-ml20m','ratings.processed.csv')
```


```sh
$ python pre_processing.py
```
