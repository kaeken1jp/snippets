[unittest — Unit testing framework — Python 3.8.3 documentation](https://docs.python.org/3/library/unittest.html)

```py
import unittest

class TestStringMethods(unittest.TestCase):

    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')

    def test_isupper(self):
        self.assertTrue('FOO'.isupper())
        self.assertFalse('Foo'.isupper())

    def test_split(self):
        s = 'hello world'
        self.assertEqual(s.split(), ['hello', 'world'])
        # check that s.split fails when the separator is not a string
        with self.assertRaises(TypeError):
            s.split(2)

if __name__ == '__main__':
    unittest.main()
```

```sh
$ python -m unittest tests/test_something.py

...
----------------------------------------------------------------------
Ran 3 tests in 0.000s

OK
```


