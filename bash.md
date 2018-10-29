
# bash snippets

## set locale
```bash
# JP
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
```

## .bash_profile
```bash

# add
test -r ~/.bashrc && . ~/.bashrc
```

## .bashrc
```bash
# export
export PATH=/usr/local:$PATH
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH=~/bin:$PATH

# alias
alias rm='rm -i'
alias ..='cd ..'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -la'
alias la='ls -a'
alias vi='vim'
alias c='clear'

alias py='python'

# alias / git
alias gs='git status'
```


## how to make local bin file
```bash
$ mkdir ~/bin
$ export PATH=~/bin:$PATH
$ vi ~/bin/somecode
$ chmod +x ~/bin/somecode
$ somecode
```

## date format
```bash
ts=$(date "+%Y%m%d-%H%M%S") #=> 20180606-132421

SEC=$(date +"%S") #=> 31

```

## basename
```bash
# shellscript name = 'file.sh'
CMDNAME=`basename $0` #=> file.sh
```

## expr
```bash
num=1
res=`expr $num + 5`
echo $res #=> 6
```

## random num
```bash
$ cat sample.sh
#!/bin/bash

RND=$(echo $((RANDOM % 500)))
echo $RND

$ sh sample.sh
172
$ sh sample.sh
218
```

## Bash History: Display Date And Time For Each Command

```bash
$ cat ~/.bashrc
HISTTIMEFORMAT="%F %T: "

$ history
    1  2018-05-28 19:26:42: python
    2  2018-05-28 19:26:53: ls ~/bin
    3  2018-05-28 19:31:51: history
```

## nkf oneliner
```bash
for f in $(ls ./*.html); do echo $f; nkf -w --overwrite $f; done
```

## sort & count oneliner
```bash
sort file.txt | uniq -c | sort -u
```

## random string generator
```bash
$ cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1
3tasR7LWwBcLyE05
$ cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1
WWfrTpjVFaDroLyL
```

## parameter
```bash
$ cat param.sh
#!/bin/bash
echo $#

$ sh param.sh a b c
3

$ sh param.sh a b c d e
5
```

```bash
if [ $# -ne 3 ]; then
    echo "Usage: $CMDNAME a b c" 1>&2
    exit 1
fi
```


## copy shellscript
#!/bin/bash

src_dir="$1"
dst_dir="$2"
cp -rp "$src_dir" "$dst_dir"
```

## oneliner mkdir
```bash
n=1; for l in $(cat file);do echo $n$l; mkdir "$n$l" ; n=$(($n+1)) ;done
```
