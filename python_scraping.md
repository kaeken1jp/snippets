# python_scraping snippets

## amazon scraping

```python
import urllib.request
from pyquery import PyQuery
import re
import csv

input_url = 'https://www.amazon.co.jp/gp/bestsellers/books/ref=sv_b_3'
process_file = 'amazon_ranking_process.html'
output_file = 'output_amazon_ranking.csv'

asin_list = []
process_html = urllib.request.urlopen(input_url).read().decode('utf-8')

with open(process_file, 'w', encoding='UTF-8') as f:
    f.write(process_html)

pq = PyQuery(process_html)
tag = 'div#zg_critical > div.zg_itemRow > div > div'
tag += ', div#zg_nonCritical > div.zg_itemRow > div > div'

for elem in pq.find(tag):
    q = PyQuery(elem)

    buffer1 = q.text()
    if re.search('発売日|出版日|Amazon\.co\.jp', buffer1):
        continue

    buffer2 = q.html()
    print(buffer2)
    pattern = r"dp\/(\w+)[\?\/].+"
    matches = re.findall(pattern,buffer2)

    print(matches[0])
    asin_list.append(matches[0])

with open(output_file, 'w', encoding='UTF-8') as f:
    writer = csv.writer(f, lineterminator='\n')
    writer.writerow(asin_list)

```
