# set PS
```bash
echo "$PS1"
[\u@\h \W]\$
```

```
\u : ユーザー名
\h : ホスト名
\W : 今いるディレクトリ名
$ : 一般ユーザーの時$,rootの時#を表示
```
[Bashプロンプトの変更 - Qiita](https://qiita.com/zaburo/items/9194cd9eb841dea897a0)


```sh
$ vi ~/.bashrc
##
export PS1="[\u@TEST_SERVER \w]$"
##
$ source ~/.bashrc
```


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

$ yyyymmdd=$(date '+%Y%m%d')
$ echo $yyyymmdd
20190813
```

### convert '%Y-%m-%dT%H:%M:%S' to '%s'
```bash
date -j -f "%Y-%m-%dT%H:%M:%S" "2018-04-02T12:52:37" "+%s" #=> 1522641157

$ head hoge.txt
2018-04-02T08:10:52
2018-04-02T11:02:00
2018-04-02T12:52:37
2018-04-02T14:02:19
2018-04-02T15:31:23

$ for i in $(cat hoge.txt); do date -j -f "%Y-%m-%dT%H:%M:%S" "$i" "+%s" >> fuga.txt ; done

$ head fuga.txt
1522624252
1522634520
1522641157
1522645339
1522650683
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
$ cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1
3tasR7LWwBcLyE05
$ cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1
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

```bash
#!/bin/bash

src_dir="$1"
dst_dir="$2"
cp -rp "$src_dir" "$dst_dir"
```

## oneliner mkdir
```bash
n=1; for l in $(cat file);do echo $n$l; mkdir "$n$l" ; n=$(($n+1)) ;done
```


## (mac) watch command alternative
```bash
while : ; do date; COMMAND1 ; COMMAND2 ; ... ; COMMANDn ; sleep 1 ; done
```

## how to delete a file whose name begins with “-” (hyphen a.k.a. dash or minus)
```
$ ls -l
---hyphen-file

# Use "--" to make rm stop parsing command line options, like this:
$ rm -- ---hyphen-file
remove ---hyphen-file ?  y
```


# curl

## set user-agent
```bash
curl -H 'User-Agent: USER_AGENT_STRING' URL

ex)
curl -H 'User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1' http://mysys-check.com/
```


## check redirect
```bash
curl -s -I -L "$URL" | grep ^Location

ex)
$ URL=http://yahoo.jp/ ; curl -s -I -L "$URL" | grep ^Location | cut -d" " -f2-
http://www.yahoo.co.jp
https://www.yahoo.co.jp:443/

```

## UNIX create a symbolic link command
```bash
$ ln -s {source-filename} {symbolic-filename}
$ ln -s file1 link1

To verify new soft link run:
$ ls -l file1 link1

Sample outputs:

-rw-r--r--  1 veryv  wheel  0 Mar  7 22:01 file1
lrwxr-xr-x  1 veryv  wheel  5 Mar  7 22:01 link1 -> file1

```

## delete a symbolic link
```bash
rm {link-name}

ex)
rm symlinkname
```


## to read random line from a file
```sh
shuf -n 1 $FILE
```

```sh
$ cat file_line_sampling.sh 
#!/bin/bash

basefile=file.csv
outfile=100k_${basefile}
head -n 1 ${basefile} > ${outfile} 
shuf -n 100000 ${basefile} >> ${outfile}
```

