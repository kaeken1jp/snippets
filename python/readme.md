# python snippets

## check python version in code
```python
import sys
sys.version_info
#=> sys.version_info(major=3, minor=5, micro=2, releaselevel='final', serial=0)
```

## variable declaration


```py
var_name :var_type = value
```

```py
num :int = 100
name :str= "Alisa"
is_ok :bool = True
```

## Falsy data
```py

if 0:
    print('True')
else:
    print('False') # False
     
if 0.0:
    print('True')
else:
    print('False') # False
     
if 0.1:
    print('True') # True
else:
    print('False')
 
if []:
    print('True')
else:
    print('False') # False
 
if ():
    print('True')
else:
    print('False') # False
 
if None:
    print('True')
else:
    print('False') # False
 
if "":
     print('True')
else:
    print('False') # False

```


## list size
```python
lst = [1, 2, 3]
len(lst) #=> 3
```

## delete list dup
```python
l = [1,2,3,4,5,3,2,1,3,4,4]
list(set(l))
#=> [1, 2, 3, 4, 5]
```

## make dir
```python
import os
os.makedirs("sample/example/test")
```

## upgrade pip
```bash
$ pip install --upgrade pip
```

## pip install & ignore SSL errors
```
$ pip install google-cloud
...
... There was a problem confirming the ssl certificate ...
...

$ pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org google-cloud
```


## read json url
```py
import urllib.request
import json

url = 'http://ip.jsontest.com/'
response = urllib.request.urlopen(url)
content = json.loads(response.read().decode('utf8'))
#=> json str

str = 'string'

for e in content:
  for key,val in e.items():
    if val in str:
      print(key, "=>", val)

for e in content:
  if e['key1'] in str:
    print(e['key2'])
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

## datetime & timezone
```python
from datetime import date, datetime, timedelta, timezone
JST = timezone(timedelta(hours=+9), 'JST')

# now
now = datetime.now(JST)

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
from datetime import date, datetime, timedelta, timezone
JST = timezone(timedelta(hours=+9), 'JST')
"{:%Y-%m-%d}".format(datetime.now(JST))
```




## str
```python
post_str = pre_str.replace('pre', 'post')
```

## split newline
```python
s = """some
multi line
string"""

s.splitlines()
#=> ['some', 'multi line', 'string']

s.split('\n')
#=> ['some', 'multi line', 'string']

' '.join(s.splitlines())
#=> some multi line string
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

## random value
```python
import random

marks = ['club', 'diamond', 'heart', 'spade']
numbers = range(1, 14)
cards = [(m, n) for m in marks for n in numbers]
print(cards)

res = random.choice(cards)
print(res)
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

## dict to json
```python
>>> dict_sample = {"k1":"v1","k2":"v2"}
>>> dict_sample
{'k1': 'v1', 'k2': 'v2'}
>>> type(dict_sample)
<class 'dict'>
```

```python
import json
json_str = json.dumps(di) #=> '{"k1":"v1","k2":"v2"}'
```

## json to dict

```python
>>> json_str = '{"k1":"v1","k2":"v2"}'
>>> type(json_str)
<class 'str'>
```

```python
import json
dict_sample = json.loads(json_str) #=> {'k1': 'v1', 'k2': 'v2'}
type(dict_sample) #=> <class 'dict'>
```

## str to bytes

```python
>>> res = 'あいう'.encode('utf-8')
>>> res
b'\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86'
>>> type(res)
<class 'bytes'>
```

## bytes to str

```python
>>> res = b'\xe3\x81\x82\xe3\x81\x84\xe3\x81\x86'.decode('utf-8')
>>> res
'あいう'
>>> type(res)
<class 'str'>
```

## dict loop
```python
for k, v in dict.items():
  print(k,v)
```

## Error Message "DeprecationWarning: invalid escape sequence"
```py
# those strings should be r'...' raw strings to avoid exactly such warnings

# NG
re.split('[\[\]]+', str)

# OK
re.split(r'[\[\]]+', str)
```


## Reserved Keywords List
```py
import keyword
import pprint

print(type(keyword.kwlist))
# <class 'list'>

print(len(keyword.kwlist))
# 35

pprint.pprint(keyword.kwlist, compact=True)
# ['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break',
#  'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for',
#  'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not',
#  'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
```
