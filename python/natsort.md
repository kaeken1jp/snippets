natsort · PyPI
https://pypi.org/project/natsort/


```
pip install natsort
```

```py
>>> from natsort import natsorted
>>> a = ["v1.1", "v21.4", "v10.1", "v2.9"]
>>> a
['v1.1', 'v21.4', 'v10.1', 'v2.9']
>>> sorted(a)
['v1.1', 'v10.1', 'v2.9', 'v21.4']
>>> natsorted(a)
['v1.1', 'v2.9', 'v10.1', 'v21.4']
```
