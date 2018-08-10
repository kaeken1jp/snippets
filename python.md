# python snippets

## check python version in code
```python
>>> import sys
>>> sys.version_info
sys.version_info(major=3, minor=5, micro=2, releaselevel='final', serial=0)
```

## upgrade pip
```bash
$ pip install --upgrade pip
```

## how to install from file
```bash
$ cat requirements.txt
requests==2.18.4
requests-cache==0.4.13
requests-oauthlib==0.8.0
...

$ pip install -r requirements.txt
```

## load original module
```bash
# make file
$ cat <original_module>.py
...
def fnc():
    ...
...

```

```python
import <original_module> as om
res = om.fnc()
```

## MKL FATAL ERROR
```
Intel MKL FATAL ERROR: Cannot load libmkl_avx.so or libmkl_def.so.
```

```python
$ conda install nomkl
```

## "Cannot uninstall 'PyYAML'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall."
```bash
pip install PyYAML --ignore-installed
```

## file glob
```python
import glob
file_list = glob.glob("./*.html")
file_list = sorted(file_list)
```

## num padding
```python
num = 12
num_zero_padding = str(num).zfill(4)
#=>0012
```

## string replace
```python
some_string = 'foo bar'
some_string.replace(" ", "_")
#=> 'foo_bar'
```

## url parse
```python
from urllib.parse import urlparse
o = urlparse('http://www.cwi.nl:80/%7Eguido/Python.html')
print(o)
#ParseResult(scheme='http', netloc='www.cwi.nl:80', path='/%7Eguido/Python.html',
#            params='', query='', fragment='')

print(o.scheme)
#'http'

print(o.port)
#80

print(o.geturl())
#'http://www.cwi.nl:80/%7Eguido/Python.html'
```

## sleep
```python
import time

time.sleep(10)

```

## datetime
```python
from datetime import date, datetime, timedelta

# now
now = datetime.now()

# format
now.strftime("%Y%m%d")

# diff
now - timedelta(weeks=3)

# str to date
date_str = 'Jun 16, 2018'
dt = datetime.strptime(data_str, '%b %d, %Y')
dt_formatted = str(dt.year) + '-' + str(dt.month) + '-' + str(dt.day)
#=> 2018-6-16
```

```python
from datetime import datetime
"{:%Y-%m-%d}".format(datetime.now())
```




## str
```python
post_str = pre_str.replace('pre', 'post')
```

## split newline
```python
"""some
multi line
string""".splitlines()
#=> ['some', 'multi line', 'string']

"""some
multi line
string""".split('\n')
#=> ['some', 'multi line', 'string']
```


## random number
https://docs.python.org/3/library/random.html#random.randint
```python
from random import randint
print(randint(0, 9)) #=> 0..9
```

```python
import random
nums = [x for x in range(10)]
random.shuffle(nums)
print(nums) #=>[6, 3, 5, 4, 0, 1, 2, 9, 8, 7]
```


## dict sort by value
```python
import operator

dic_list = [{'k1':3, 'k2':2}, {'k1':1, 'k2':1}, {'k1':2, 'k2':3}]

dic_list.sort(key=operator.itemgetter('k1'), reverse=True)
print(dic_list)
[{'k1': 3, 'k2': 2}, {'k1': 2, 'k2': 3}, {'k1': 1, 'k2': 1}]

dic_list.sort(key=operator.itemgetter('k2'), reverse=True)
print(dic_list)
[{'k1': 2, 'k2': 3}, {'k1': 3, 'k2': 2}, {'k1': 1, 'k2': 1}]
```

