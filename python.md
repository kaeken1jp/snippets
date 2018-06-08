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
