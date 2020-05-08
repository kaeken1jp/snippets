# minimum syntax list
```py
# Comments
# This is a one-line Python comment - code blocks are so useful!
"""This type of comment is used to document the purpose of functions and classes."""
"""
Comment
Comment
Comment
"""

# Declaration/Initialization
# Remember values, not variables, have data types.
# A variable can be reassigned to contain a different data type.
answer = 42
answer = "The answer is 42."

print("answer: %s" %answer)
print("answer:  %s again!" %answer)

# Data Types
boolean = True

number = 1.1

string = "Strings can be declared with single or double quotes."

s = "he\nllo wor\tld"

html = """<html>
<body></body>
</html>"""

list = ["Lists can have", 1, 2, 3, 4, "or more types together!"]

tuple = ("Tuples", "can have", "more than", 2, "elements!")

dictionary = {'one': 1, 'two': 2, 'three': 3}

variable_with_zero_data = None


scores = [40, 50, 70, 90, 60]
print(scores[1:4]) # [50, 70, 90]
print(scores[:2]) # [40, 50]
print(scores[3:]) # [90, 60]
print(scores[-3:]) # [70, 90, 60]

s = "hello"
print(s[1:4]) # ell

# regex
import re
s = 'http://example.com/?123'
m = re.match(r'http://example.com/\?\d+', s)
print(m)
#<_sre.SRE_Match object; span=(0, 23), match='http://example.com/?123'> 


# Simple Logging
print("Printed!")

# Conditionals
if cake == "delicious":
    return "Yes please!"
elif cake == "okay":
    return "I'll have a small piece."
else:
    return "No, thank you."

# Loops
for item in list:
    print item

## break
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  if x == "banana":
    break
  print(x) 
# => apple

## continue
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  if x == "banana":
    continue
  print(x)
# => apple
# => cherry


for i, score in enumerate(scores):
    print("{0}: {1}".format(i, score))


while (total < max_val):
    total += values[i]
    i += 2

## break
i = 1
while i < 6:
    print(i)
    if i == 3:
        break
    i += 1

## while else
i = 0
while i < 10:
    if i == 5:
        break
    print(i)
    i += 1
else:
    print("end")

# Functions
def divide(dividend, divisor):
    quotient = dividend / divisor
    remainder = dividend % divisor
    return quotient, remainder

def calculate_stuff(x, y):
    (q, r) = divide(x,y)
    print q, r

# Classes
class Person(object):
    def __init__(self, name, age):
        self.name = name
        self.age = age 

    def birthday(self):
        self.age += 1
```

# constant

```py
""" $ cat constant.py """
PI = 3.14
GRAVITY = 9.8
```

```py
""" $ cat main.py """
import constant

print(constant.PI)
print(constant.GRAVITY)
```

# global

```py
x = "awesome"

def myfunc():
  global x
  x = "fantastic"

myfunc()

print("Python is " + x) #=> Python is fantastic
```

# operator

```py
# + - * / // % **

x = 10
print(x / 3) # 3.33...
print(x // 3) # 3
print(x % 3) # 1
print(x ** 2) # 100

y = 4
# y = y + 12
y += 12
print(y) # 16

# and or not
print(True and False) # False
print(True or False) # True
print(not True) # False

# + *
print("hello " + "world")
print("hello " * 3) # hello hello hello
```

# print, format

```py
name = "foo"
score = 52.8

print("name: %s, score: %f" % (name, score)) # name: foo, score: 52.800000
print("name: %-10s, score: %10.2f" % (name, score)) # name: foo       , score:      52.80

print("name: {0}, score: {1}".format(name, score)) # name: foo, score: 52.8
print("name: {0:>10s}, score: {1:<10.2f}".format(name, score)) # name:        foo, score: 52.80

#named indexes:
txt1 = "My name is {fname}, I'm {age}".format(fname = "John", age = 36)
#numbered indexes:
txt2 = "My name is {0}, I'm {1}".format("John",36)
#empty placeholders:
txt3 = "My name is {}, I'm {}".format("John",36)

print(txt1) # => My name is John, I'm 36
print(txt2) # => My name is John, I'm 36
print(txt3) # => My name is John, I'm 36
```

# pass, None

```py
def myfunction():
  pass

# having an empty function definition like this, would raise an error without the pass statement

res = myfunction()
print(res) #=> None
```


# check python version in code
```python
import sys
sys.version_info
#=> sys.version_info(major=3, minor=5, micro=2, releaselevel='final', serial=0)
```

# variable declaration


```py
var_name :var_type = value
```

```py
num :int = 100
name :str= "Alisa"
is_ok :bool = True
```

# fizzbuzz

```py
for i in range(1, 101):
    if i % 15 == 0:
        print("Fizz Buzz!")
    elif i % 3 == 0:
        print("Fizz!")
    elif i % 5 == 0:
        print("Buzz!")
    else:
        print(i)
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

## set 
```py
>>> s1 = {1,2,3}
>>> s2 = {1,3,6}

>>> type(s1)
<class 'set'>
>>> type(s2)
<class 'set'>

>>> s1 & s2
{1, 3}
>>> s1 ^ s2
{2, 6}
```

## tab join
```py
'\t'.join([data1, data2, data3])
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

## array append / extend
```py
a = [1,2,3]
b = [4, 5]

# append list & number(str)
a1 = a
a1.append(4)
print(a1) # [1, 2, 3, 4]

# append list & list
a1 = a
a1.append(b)
print(a1) # [1, 2, 3, [4, 5]] 

# extend list & list
a1 = a
a1.extend(b)
print(a1) # [1, 2, 3, 4, 5]
```

## write csv
```py
import csv

with open(output_filename, 'w') as f:
  writer = csv.writer(f, lineterminator='\n')
  writer.writerow(array1d)     # one list
  writer.writerows(array2d)    # multi list
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



## string replace
```python
some_string = 'foo bar'
some_string.replace(" ", "_")
#=> 'foo_bar'
```

## string delete newline 
```py
re.sub('[\r\n]+$', '', text)
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
for k, v in dict_data.items():
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

## multiline
```py
import re
string = "LINE0\nLINE1\nLINE2\nLINE3"
print(string)
"""
LINE0
LINE1
LINE2
LINE3
"""

pattern = r'LINE1.*$'
res = re.sub(pattern, ' ', string, flags=(re.MULTILINE | re.DOTALL))
print(res)
"""
LINE0

"""
```


## get key / value from dict

```py
l = [{'Name': 'Alice', 'Age': 40, 'Point': 80}, 
     {'Name': 'Bob', 'Age': 20},
     {'Name': 'Charlie', 'Age': 30, 'Point': 70}]

l_name = [d.get('Name') for d in l]
print(l_name)
# ['Alice', 'Bob', 'Charlie']
```

## input()

```py
print("Your name? ", end="")
name = input()

print("hello %s" %name)
print("hello %s again!" %name)
```

```
Your name? abc
hello abc
hello abc again!
```

## cast

```py
x = int(1)   # x will be 1
y = int(2.8) # y will be 2
z = int("3") # z will be 3

x = float(1)     # x will be 1.0
y = float(2.8)   # y will be 2.8
z = float("3")   # z will be 3.0
w = float("4.2") # w will be 4.2

x = str("s1") # x will be 's1'
y = str(2)    # y will be '2'
z = str(3.0)  # z will be '3.0'
```

## Class variables

```py
class User:
    count = 0 # <- class variable
    def __init__(self, name):
        User.count += 1
        self.name = name # <- Instance variable

print(User.count) # 0
tom = User("tom")
bob = User("bob")
print(User.count) # 2

print(tom.count) # 2
```

## instance method, class method

```py
class User:
    count = 0
    def __init__(self, name):
        User.count += 1
        self.name = name
    # instance method
    def say_hi(self):
        print("hi {0}".format(self.name))
    # class method
    @classmethod
    def show_info(cls):
        print("{0} instances".format(cls.count))

tom = User("tom")
bob = User("bob")

# tom.say_hi()
# bob.say_hi()

User.show_info()
```

## private variable, private class, private method

```py
_internal_name = 'one_nodule' # private variable
_internal_version = '1.0' # private variable

class _Base: # private class
    _hidden_factor = 2 # private variable
    
    def __init__(self, price):
        self._price = price
        
    def _double_price(self): # private method
        return self._price * self._hidden_factor
        
```


## Inheritance

```py
class User:
    def __init__(self, name):
        self.name = name
    def say_hi(self):
        print("hi {0}".format(self.name))

class AdminUser(User):
    def __init__(self, name, age):
        super().__init__(name)
        self.age = age
    def say_hello(self):
        print("hello {0} ({1})".format(self.name, self.age))
    # override
    def say_hi(self):
        print("[admin] hi {0}".format(self.name))

bob = AdminUser("bob", 23)
print(bob.name)
bob.say_hi()
bob.say_hello()
```

```py
class A:
    def say_a(self):
        print("A!")
    def say_hi(self):
        print("hi! from A!")
class B:
    def say_b(self):
        print("B!")
    def say_hi(self):
        print("hi! from B!")

# class C(A, B):
class C(B, A):
    pass

c = C()
# c.say_a()
# c.say_b()
c.say_hi()
```

## module, import

```py
""" user.py """
class User:
    def __init__(self, name):
        self.name = name
    def say_hi(self):
        print("hi {0}".format(self.name))

class AdminUser(User):
    def __init__(self, name, age):
        super().__init__(name)
        self.age = age
    def say_hello(self):
        print("hello {0} ({1})".format(self.name, self.age))
    def say_hi(self):
        print("[admin] hi {0}".format(self.name))

# print("hello")
```

```py
# import user
# from user import AdminUser
from user import AdminUser, User

# bob = user.AdminUser("bob", 23)
bob = AdminUser("bob", 23)

tom = User("tom")

print(bob.name)
bob.say_hi()
bob.say_hello()
```

## package

```sh
$ ls mypackage/
__init__.py	user.py

$ ls
myapp.py	mypackage
```

```py
""" mypackage/user.py """
class User:
    def __init__(self, name):
        self.name = name
    def say_hi(self):
        print("hi {0}".format(self.name))

class AdminUser(User):
    def __init__(self, name, age):
        super().__init__(name)
        self.age = age
    def say_hello(self):
        print("hello {0} ({1})".format(self.name, self.age))
    def say_hi(self):
        print("[admin] hi {0}".format(self.name))

# print("hello")
```

```py
""" myapp.py """
# package

# import mypackage.user
# import mypackage.user as mymodule
from mypackage.user import AdminUser

# bob = mypackage.user.AdminUser("bob", 23)
# bob = mymodule.AdminUser("bob", 23)
bob = AdminUser("bob", 23)

print(bob.name)
bob.say_hi()
bob.say_hello()
```

```sh
$ py myapp.py
bob
[admin] hi bob
hello bob (23)
```

## Exception

```py
class MyException(Exception):
    pass

def div(a, b):
    try:
        if (b < 0):
            raise MyException("not minus")
        print(a / b)
    except ZeroDivisionError:
        print("not by zero!")
    except MyException as e:
        print(e)
    else:
        print("no exception!")
    finally:
        print("-- end --")

div(10, -3)
# div(10, 3)
# div(10, 0)
```

## set

```py
a = set([5, 4, 8, 5]) # OR a = {5, 4, 8, 5}
print(a) # {8, 4, 5}
print(5 in a) # True
a.add(2)
a.remove(8)
print(a) # {2, 4, 5}
print(len(a)) # 3

a = {1, 3, 5, 8}
b = {3, 5, 8, 9}
print(a | b) # {1, 3, 5, 8, 9}
print(a & b) # {8, 3, 5}
print(a - b) # {1}
```

## Iterators & Generators

```py
scores = [40, 50, 70, 90, 60]
it = iter(scores) # iterator
print(next(it)) # 40
print(next(it)) # 50
print("hello")
print(next(it)) # 70

for score in scores:
    print(score) # 40 50 70 90 60

def get_infinite(): # generator
    i = 0
    while True:
        yield i * 2
        i += 1

g = get_infinite()
print(next(g)) # 0
print(next(g)) # 2
print(next(g)) # 4
```

## map, lambda

```py
def triple(n):
     return n * 3

print(list(map(triple, [1, 2, 3]))) # [3, 6, 9]

# lambda 引数: 処理
print(list(map(lambda n: n * 3, [1, 2, 3]))) # [3, 6, 9]
```

## filter

```py
def is_even(n):
     return n % 2 == 0

print(list(filter(is_even, range(10)))) # [0, 2, 4, 6, 8]

print(list(filter(lambda n: n % 2 == 0, range(10)))) # [0, 2, 4, 6, 8]
```

## List Comprehensions

```py
squares = []
for x in range(10):
    squares.append(x**2)

print(squares) # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

print([i for i in range(10)]) # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print([i * 3 for i in range(10)]) # [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
print([i * 3 for i in range(10) if i % 2 == 0]) # [0, 6, 12, 18, 24]
print({i * 3 for i in range(10) if i % 2 == 0}) # {0, 6, 12, 18, 24}


```
