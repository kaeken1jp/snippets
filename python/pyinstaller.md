[PyInstaller](https://pyinstaller.org/en/stable/)

- PyInstaller bundles a Python application and all its dependencies into a single package. The user can run the packaged app without installing a Python interpreter or any modules. PyInstaller supports Python 3.7 and newer, and correctly bundles many major Python packages such as numpy, matplotlib, PyQt, wxPython, and others.


# install

```sh
pip install -U pyinstaller
```

# prepare

```py
# sample.py
from tkinter import messagebox
messagebox.showinfo('exe file', 'exe file')
```


# exec

```sh
pyinstaller sample.py --onefile
```
