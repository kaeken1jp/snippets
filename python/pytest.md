[Full pytest documentation — pytest documentation](https://docs.pytest.org/en/latest/contents.html)

# install

```bash
$ pip install pytest 

$ pytest --version
```

# getting started

```
# content of test_sample.py
def func(x):
    return x + 1


def test_answer():
    assert func(3) == 5
```

```
$ pytest
========================================== test session starts ==========================================
platform darwin -- Python 3.6.8, pytest-4.1.1, py-1.7.0, pluggy-0.8.1
rootdir: .../pytest, inifile:
plugins: remotedata-0.3.1, openfiles-0.3.2
collected 1 item

test_sample.py F                                                                                  [100%]

=============================================== FAILURES ================================================
______________________________________________ test_answer ______________________________________________

    def test_answer():
>       assert func(3) == 5
E       assert 4 == 5
E        +  where 4 = func(3)

test_sample.py:7: AssertionError
======================================= 1 failed in 0.08 seconds ========================================

```




