# python_mecab snippets

## install on Google Colab
```sh
!apt install aptitude swig
!aptitude install mecab libmecab-dev mecab-ipadic-utf8 git make curl xz-utils file -y
!pip install mecab-python3

!git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
!echo yes | mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -a
```

## sample code on Google Colab
```
import MeCab
import subprocess
import re

cmd='echo `mecab-config --dicdir`"/mecab-ipadic-neologd"'
path = (subprocess.Popen(cmd, stdout=subprocess.PIPE,
                           shell=True).communicate()[0]).decode('utf-8')
m=MeCab.Tagger("-d {0}".format(path))

text = """
mecab-ipadic-NEologd は形態素解析エンジン MeCab と共に使う単語分かち書き辞書で、
週2回以上更新更新され、新語・固有表現に強く、語彙数が多く、しかもオープンソース・ソフトウェアである という特徴があります。
"""

line = re.sub('[\r\n]+$', '', text)

print(m.parse(line))
```


## how to install MeCab (Mac)

```bash
brew install mecab
brew install mecab-ipadic

brew install git curl xz
git clone --depth 1 git@github.com:neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n

pip install mecab-python3

# check path
echo `mecab-config --dicdir`"/mecab-ipadic-neologd"
```

## sample code
```python
import MeCab

mecab = MeCab.Tagger ('-d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')

text = 'text'
mecab.parse('')
node = mecab.parseToNode(text)
while node:
    word = node.surface
    pos = node.feature.split(",")[1]
    print('{0} , {1}'.format(word, pos))
    node = node.next
```

## make user-dict.csv
```
import json
import jaconv
import csv

def readJson(path_r):
  data = ''
  with open(path_r) as json_file:
    data = json.load(json_file)
  return data

f = "file.json"
data = readJson(f)

mecab_csv_data = []
# コストは「1」を設定した単語が最優先
# 登録したい名詞,ID,ID,重み,品詞,品詞の説明,*,*,*,*,登録したい名詞,カタカナ表示,カタカナ表記

for e in data:
  data_buffer = []
  data_buffer.append(e['title'])
  data_buffer.append('99999999')
  data_buffer.append('99999999')
  data_buffer.append('1')
  data_buffer.append('名詞')
  data_buffer.append('固有名詞')
  data_buffer.append('*')
  data_buffer.append('*')
  data_buffer.append('*')
  data_buffer.append('*')
  data_buffer.append(e['title'])
  kata = jaconv.hira2kata(e['title_kana'])
  data_buffer.append(kata)
  data_buffer.append(kata)
  mecab_csv_data.append(data_buffer)

with open(output_csv_file, 'w') as f:
  writer = csv.writer(f, lineterminator='\n')
  writer.writerows(mecab_csv_data)
```







