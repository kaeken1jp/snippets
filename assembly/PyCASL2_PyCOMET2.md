[CASLIIアセンブラ & シミュレータ PyCASL2 & PyCOMET2 — PyCASL2/PyCOMET2 1.1.6 documentation](http://www.image.med.osaka-u.ac.jp/member/nakamoto/pycasl2/index.html)

```
PyCASL2, PyCOMET2は CASLII のアセンブラおよびシミュレータです。
```

# hello world

```cas
;comment area
;output text
MAIN    START
        OUT    BUF,LEN
        RET
BUF     DC     'Hello World'
LEN     DC     11
        END
```

```sh
$ pycasl hello.cas

$ pycomet -r hello.com
Hello World

$ pycomet hello.com
load hello.com ... done.
PR  #0000 [ OUT     #0004, #000f           ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

# CASLII コーディング書式

```
3つのエリアに分けて記述

・ラベル欄：その行のアドレスをあらわす。
長さ1-8文字、先頭は英大文字、2文字目以降は、英大文字か数字

・命令コード欄：マシン語の命令やアセンブラへの指示を記述
機械語命令、アセンブラ命令、マクロ命令

・オペランド：命令コードの処理対象を記述
```
