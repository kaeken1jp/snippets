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

pycomet2> h
b ADDR        Set a breakpoint at specified address.
d NUM         Delete breakpoints.
di ADDR       Disassemble 32 words from specified address.
du ADDR       Dump 128 words of memory.
h             Print help.
i             Print breakpoints.
j ADDR        Set PR to ADDR.
m ADDR VAL    Change the memory at ADDR to VAL.
p             Print register status.
q             Quit.
r             Strat execution of program.
s             Step execution
st            Dump 128 words of stack image.
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

## 命令の種類

### 機械語命令

![](https://i.gyazo.com/1b49684ea813c1efb95c6b71705a7617.jpg)

### アセンブラ命令

![](https://i.gyazo.com/82067d845df6c06d29a393312559f087.jpg)

### マクロ命令

![](https://i.gyazo.com/603fe7795b22ffd283d8eaa6a35cdd68.jpg)

## 命令の調べ方

![](https://i.gyazo.com/ab63ea6947013b3e7a5ca2513668033f.jpg)



# 仕様書の読み方

- アセンブリ言語の書き方は、アセンブラであるCASLⅡの仕様書に書いてあります。
- また、アセンブラ命令やマクロ命令についても載っています。

```
アセンブラ言語CASLⅡの仕様

言語の仕様

1. CASLⅡは、COMETⅡのためのアセンブラ言語である。
2. プログラムは、命令行および注釈行からなる。
3. 1命令は1命令行で記述し、次の行へ継続できない。
4. 命令行およびコメント行は、次に示す記述の形式で、行の1文字目から記述する。
```

```
LD命令は、2つの機能があるのでオペランドの書き方が2つあります。
```

![](https://i.gyazo.com/c4ae4d91be639e5f28854b3086a81cc7.png)

```
r,r1,r2:     いずれもGRを示す｡指定できるGRは、GR0~GR7
adr:         アドレスを示す｡指定できる値の範囲は0~65535
x:           指標として用いるGRを示す｡指定できるGRはGR1~GR7
[ ]:         [ ]内の指定は省略できることを示す｡

( ):         ( )内のレジスタ又はアドレスに格納されている内容を示す｡
実効アドレス:  adrとxの内容との論理加算値又はその値が示す番地｡
￩:           演算結果を､左辺のレジスタまたはアドレスに格納することを示す｡
```




# CPU動作

![](https://i.gyazo.com/bcb761e81cdfe123820340b3f15b4698.jpg)

## COMET2 レジスタ構成

![](https://i.gyazo.com/5ff66553c72400c6a7f59b5c54a7d4f4.jpg)

```
プログラムレジスタ(PR)：次に実行すべき命令のアドレスを指定

汎用レジスタ(GR0 - GR7)：演算やアドレス指定のために一時的にデータを格納

スタックポインタ(SP)：メモリにデータを一時的に退避したり、一時的に別のコードを呼び出したりする、スタック領域のアドレスを指定する

フラグレジスタ(FR)：演算結果に合わせて設定される
　オーバーフローフラグ(OF)：演算結果が16ビットを超えた時に1、それ以外では0
　サインフラグ(SF)：演算結果がマイナスになったとき1、それ以外では0
　ゼロフラグ(ZF)：演算結果がゼロのときに1、それ以外では0
```

## プログラムのメモリ配置

![](https://i.gyazo.com/501534f083391b85803b75eba09e832f.jpg)

![](https://i.gyazo.com/4249e95b2deabd12a3e315fd1dd48e23.png)

```
Hello Worldプログラムをマシン語に変換して、メモリに配置すると、このようになります。
COMET2では、マシン語のコードがどのような2進数になるか規定していませんが、PyCASL2では、このように変換されます。

左側がメモリのアドレスです。先頭が「0000」で、その次が「0001」「0002」というように、16ビットの2進数を16進数であらわしています。
そのとなりは、メモリにかきこまれた内容です。アドレスが「0000」のメモリに「9100」というコードが書き込まれています。ここが「OUT」命令に相当します。
・COMET2：1ワード 16ビットのCPU
・ひとつのアドレスにメモリを16ビットずつ割り当て
・1アドレスのメモリ：1ワード、1語
```


## プログラムレジスタの動き

![](https://i.gyazo.com/4048731da83db88b26e7f0231498ea38.jpg)

## CPUの状態とメモリの内容を出力

- 「d」オプションで、プログラムの終了時に、CPUの状態とメモリの内容を出力します。
- 出力結果は、「last_state.txt」に格納されます。
- PyCOMET2をステップ実行するには、次のように操作します。
- 1. 「r」オプションなしでプログラムを実行する
- 2. 対話モードで「s」コマンドを実行する

```sh
$ pycomet -d hello.com
load hello.com ... done.
PR  #0000 [ OUT     #0004, #000f           ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
Hello World
PR  #0003 [ RET                            ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
dump last status to last_state.txt
```

```sh
$ wc -l last_state.txt
8206 last_state.txt
```

```sh
$ head -20 last_state.txt
Step count: 2
PR: #0003
SP: #ff00
OF: 0
SF: 0
ZF: 1
GR0: #0000
GR1: #0000
GR2: #0000
GR3: #0000
GR4: #0000
GR5: #0000
GR6: #0000
GR7: #0000
Memory:
0000: 9100 0004 000f 8100 0048 0065 006c 006c ....Hell
0008: 006f 0020 0057 006f 0072 006c 0064 000b o World.
0010: 0000 0000 0000 0000 0000 0000 0000 0000 ........
0018: 0000 0000 0000 0000 0000 0000 0000 0000 ........
0020: 0000 0000 0000 0000 0000 0000 0000 0000 ........
```


## マシン語で足し算

```sh
$ cat calc.cas
; 足し算する
CALC    START
        LD      GR0, A
        ADDA    GR0, B ; ADDAで足し算
        ST      GR0, ANS
        RET
A       DC      03
B       DC      02
ANS     DS      01
        END
```

```sh
$ pycasl calc.cas

$ pycomet -d calc.com
```

```
load calc.com ... done.
PR  #0000 [ LD      GR0, #0007             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0002 [ ADDA    GR0, #0008             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0004 [ ST      GR0, #0009             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0006 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
dump last status to last_state.txt
```



## マシン語で引き算

```sh
$ cat calc2.cas
; 引き算する
CAL2    START
        LD      GR0, A
        SUBA    GR0, B ; SUBAで引き算
        ST      GR0, ANS
        RET
A       DC      05
B       DC      02
ANS     DS      01
        END
```

```sh
$ pycomet -d calc2.com
load calc2.com ... done.
PR  #0000 [ LD      GR0, #0007             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0002 [ SUBA    GR0, #0008             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0004 [ ST      GR0, #0009             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0006 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
dump last status to last_state.txt
```

```sh
$ head -20 last_state.txt
Step count: 4
PR: #0006
SP: #ff00
OF: 0
SF: 0
ZF: 0
GR0: #0003
GR1: #0000
GR2: #0000
GR3: #0000
GR4: #0000
GR5: #0000
GR6: #0000
GR7: #0000
Memory:
0000: 1000 0007 2100 0008 1100 0009 8100 0005 ........
0008: 0002 0003 0000 0000 0000 0000 0000 0000 ........
0010: 0000 0000 0000 0000 0000 0000 0000 0000 ........
0018: 0000 0000 0000 0000 0000 0000 0000 0000 ........
0020: 0000 0000 0000 0000 0000 0000 0000 0000 ........
```


## レジスタ間で転送

```
;  レジスタ間で転送
CALC    START
        LD      GR0, A
        LD      GR1, GR0 ; GR0をGR1に転送
        RET
A       DC      03
B       DC      02
ANS     DS      01
        END
```


```sh
$ pycasl calc.cas
$ pycomet -d calc.com
load calc.com ... done.
PR  #0000 [ LD      GR0, #0004             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0002 [ LD      GR1, GR0               ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0003 [ RET                            ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0003(      3) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
dump last status to last_state.txt
```


# LAD命令

- LAD命令は、オペランドに記述したアドレス自体を読み込む命令です。この機能で、オペランドの値を直接レジスタに読み込めます。

![](https://i.gyazo.com/78d95c3525b690b554c411a0d590e90c.jpg)


## レジスタに値を読み込む

```
; レジスタに値を読み込む
MAIN    START
        LAD      GR0, 10
        RET
A       DC       05
        END
```

- CASLⅡでは、数値の前に「#」をつけると、16進数表記になります。

```
; レジスタに値を読み込む
MAIN    START
        LAD      GR0, #10 ; #10 = 16のこと
        RET
A       DC       05
        END
```

## アドレスを読み込む

```
; レジスタにアドレスを読み込む
MAIN    START
        LAD      GR0, A
        RET
A       DC       05
        END
```




