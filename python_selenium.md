# python_selenium snippets

## install
```bash
pip install selenium
```

## firefox sample
```python
from selenium import webdriver

browser = webdriver.Firefox()
browser.get('http://seleniumhq.org/')
```

## check chrome version & download chrome driver 

```bash
$ /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version
```

https://sites.google.com/a/chromium.org/chromedriver/downloads

```bash
# if you dl 75
$ cp ~/Download/chromedriver chromedriver75
```

## chrome sample

```py
from selenium import webdriver

driver_path = './chromedriver75'
options = webdriver.ChromeOptions()
options.add_argument('--headless')
driver = webdriver.Chrome(driver_path, options=options)

url = 'https://google.co.jp/'
driver.get(url)
print(driver.title)

search_box = driver.find_element_by_name("q")
search_box.send_keys('ChromeDriver')
search_box.submit()
print(driver.title)
```


