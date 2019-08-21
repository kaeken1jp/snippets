# python_mecab snippets

## how to install MeCab

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


