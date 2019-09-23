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

# 特定の要素（もっと見るボタンなど）　を延々クリック
```py
elem = driver.find_element_by_id(elem_name)
actions = webdriver.ActionChains(driver)
actions.move_to_element(elem)
elem.click()

#要素が無くなったら、try ... except で 例外処理
```

# 無限コンテンツ表示
```py
# 自動的にページ末尾にスクロールする処理を追加
driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
```

## sample
```py
import time
from selenium import webdriver

driver_path = './chromedriver75'
options = webdriver.ChromeOptions()
options.add_argument('--headless')
driver = webdriver.Chrome(driver_path, options=options)

url = 'https://infinite-scroll.com/demo/full-page/page4.html'
print(url);time.sleep(1)
driver.get(url)
print(driver.title);time.sleep(1)

max_num = 5
for e in range(1,max_num + 1):
  try:
    print('try:')
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
  except:
    print('except:')
    import traceback
    traceback.print_exc()
    break

driver.save_screenshot('screenshot.png')
driver.quit()
```




