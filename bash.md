
# bash snippets

## date format
```bash
ts=$(date "+%Y%m%d-%H%M%S") #=> 20180606-132421

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
