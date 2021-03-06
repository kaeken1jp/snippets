[Kivy: Cross-platform Python Framework for NUI Development](https://kivy.org/#home)

```
Kivy - Open source Python library for rapid development of applications
that make use of innovative user interfaces, such as multi-touch apps.
```

# install

```sh
$ python -m pip install kivy
```

# version

```py
import kivy
print(kivy.__version__)
```

```
[INFO   ] [Logger      ] Record log in /path/.kivy/logs/kivy_20-10-18_1.txt
[INFO   ] [Kivy        ] v1.11.1
[INFO   ] [Kivy        ] Installed at "/opt/anaconda3/lib/python3.7/site-packages/kivy/__init__.py"
[INFO   ] [Python      ] v3.7.6 (default, Jan  8 2020, 13:42:34)
[Clang 4.0.1 (tags/RELEASE_401/final)]
[INFO   ] [Python      ] Interpreter at "/opt/anaconda3/bin/python3"
1.11.1
```

# minimal application

```py
import kivy
kivy.require('1.0.6') # replace with your current kivy version !

from kivy.app import App
from kivy.uix.label import Label


class MyApp(App):

    def build(self):
        return Label(text='Hello world')


if __name__ == '__main__':
    MyApp().run()
```

```sh
python main.py
```

- result

![](https://i.gyazo.com/4618c0e6e4ca4bfea6961292c1225d77.png)



