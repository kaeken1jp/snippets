# django snippets

## check Django installed
```bash
$ python -m django --version
```

## creating a project

```bash
$ django-admin startproject mysite
```

## view a project dir

```bash
$ ls -R mysite/
mysite/:
manage.py  mysite

mysite/mysite:
__init__.py  settings.py  urls.py  wsgi.py
```

## check the development server
```bash
$ cd mysite
$ python manage.py runserver

(Go to http://localhost:8000/)
(Quit the server with CONTROL-C)
```

## Creating the Polls app

```bash
$ ls manage.py
manage.py
$ python manage.py startapp polls
$ ls polls
__init__.py  apps.py    models.py  views.py
admin.py  migrations  tests.py

```

## Write your first view

```bash
$ vi polls/views.py
```

```python
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
```

```bash
$ touch polls/urls.py
$ vi polls/urls.py
```

```python
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
]
```

```bash
$ vi mysite/urls.py
```

```python
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
]
```

```bash
$ python manage.py runserver

(Go to http://localhost:8000/polls)
```


## templates / escape off
```python
{% autoescape off %}
    {{ body }}
{% endautoescape %}
```



