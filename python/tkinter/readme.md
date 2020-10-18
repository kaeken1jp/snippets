[tkinter — Python interface to Tcl/Tk — Python 3.9.0 documentation](https://docs.python.org/3/library/tkinter.html)

```
The tkinter package (“Tk interface”) is the standard Python interface to the Tk GUI toolkit.

Both Tk and tkinter are available on most Unix platforms, as well as on Windows systems.

(Tk itself is not part of Python; it is maintained at ActiveState.)
```


# install

installed

# version

```sh
$ python -m tkinter # view a popup window
```

```py
>>> import tkinter
>>> tkinter._test() # view a popup window
```

```py
>>> tkinter.Tcl().eval('info patchlevel')
'8.6.8'
```

# sample

[Which tkinter modules were renamed in Python 3? - Stack Overflow](https://stackoverflow.com/questions/673174/which-tkinter-modules-were-renamed-in-python-3)

```py
from tkinter import *
import tkinter.messagebox

class Application(Frame):
    def say_hi(self):
        tkinter.messagebox.showinfo('info', 'hi there, everyone!')

    def createWidgets(self):
        self.QUIT = Button(self)
        self.QUIT["text"] = "QUIT"
        self.QUIT["fg"]   = "red"
        self.QUIT["command"] =  self.quit

        self.QUIT.pack({"side": "left"})

        self.hi_there = Button(self)
        self.hi_there["text"] = "Hello",
        self.hi_there["command"] = self.say_hi

        self.hi_there.pack({"side": "left"})

    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.pack()
        self.createWidgets()

root = Tk()
app = Application(master=root)
app.mainloop()
root.destroy()
```

- result

![](https://i.gyazo.com/faa3b28b226a6d04b80e9ba189f95eb4.png)

![](https://i.gyazo.com/e08787ad3ec27affd2501ce7c735e47c.png)


