[Amazon Personalize Documentation](https://docs.aws.amazon.com/personalize/index.html)

# tutorial

[Amazon Personalize – Real-Time Personalization and Recommendation for Everyone | AWS News Blog](https://aws.amazon.com/jp/blogs/aws/amazon-personalize-real-time-personalization-and-recommendation-for-everyone/)

## step1: download

[MovieLens 20M Dataset | GroupLens](https://grouplens.org/datasets/movielens/20m/)

```sh
curl -o ml-20m.zip http://files.grouplens.org/datasets/movielens/ml-20m.zip
unzip ml-20m.zip
rm ml-20m.zip
```

## step2: Data pre-processing

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


