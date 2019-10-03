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

cmd='echo `mecab-config --dicdir`"/mecab-ipadic-neologd"'
path = (subprocess.Popen(cmd, stdout=subprocess.PIPE,
                           shell=True).communicate()[0]).decode('utf-8')
m=MeCab.Tagger("-d {0}".format(path))

print(m.parse("すもももももももものうち"))
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


