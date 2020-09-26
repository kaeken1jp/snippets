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

```
; ラベルのアドレスを読み込む
MAIN    START
        LD      GR0, A
        LAD     GR2, A    ; ここにアドレスを読み込むコードを書く
        RET
A       DC      #FF
        END
```


# アドレスの指定方法

![](https://i.gyazo.com/50f612293433034a5b8adeaf637b6b6b.png)

# インデックス修飾

![](https://i.gyazo.com/87cfd665db450463243b2a7daae0cdc4.jpg)

![](https://i.gyazo.com/37d829a062dbb937210554cd5a728989.png)

- 「x」には、GR1 ~ GR7のどれかを指定します。指定すると、adrで指定したラベルに、指定したレジスタの値を足し算して、その計算結果のアドレスから、値をレジスタに読み込みます。

## LDでインデックス修飾

```
MAIN    START
        LAD     GR1, 1
        LD      GR0, A, GR1
        RET
A       DC      05
        DC      03
        END
```

## LADでインデックス修飾

```
MAIN    START
        LAD     GR1, 1
        LD      GR0, A, GR1
        LAD     GR2, A, GR1
        RET
A       DC      05
        DC      03
        END
```

## ラベルAの次にあるアドレスの値をGR2に読み込む

```
; インデックス修飾
MAIN    START
        LD      GR0, A
        LD      GR2, A, GR1 ; ここに、データを読み込むコードを書く
        RET
A       DC      01
        DC      04
        END
```

# ストア(ST)命令

- ST命令は、レジスタの値をメモリに格納する命令です。

![](https://i.gyazo.com/a2c10aac490a505ffb0b82b5f8469e0f.png)

## メモリに値を保存する

```
; レジスタの値をメモリに格納する
MAIN    START
        LAD     GR0, 1
        ST      GR0, A
        LAD     GR1, A
        RET
A       DS      01
        END
```

## インデックス修飾する

```
; レジスタの値をメモリに格納する
MAIN    START
        LAD     GR0, 1
        LAD     GR2, 1
        ST      GR0, A, GR2
        LAD     GR1, A, GR2
        RET
A       DS      02
        END
```

## GR0の値を、ラベルBに格納する

```

; メモリに格納する
MAIN    START
        LD      GR0, A
        ST      GR0, B
        ; ここに、メモリに格納するコードを書く
        RET
A       DC      03
B       DS      01
        END

```

# フラグレジスタ(FR)

- フラグレジスタは、汎用レジスタの値に合わせて、状態が変化する3ビットのレジスタです。このあと学習する比較命令や分岐命令と組み合わせて、処理を分岐します。

![](https://i.gyazo.com/cb2a6dd857f89b2bf35a4f636879941b.jpg)

## 種類

```
・OF(Overflow Flag)：オーバーフローフラグ：計算結果がオーバーフローする
・SF(Sign Flag)：サインフラグ：計算結果がマイナスにする
・ZF(Zero Flag)：ゼロフラグ：計算結果がゼロになる
```

### ZF(Zero Flag)：ゼロフラグ

```
・演算結果がゼロ（全部のビットが0）のとき1、それ以外のとき0になる
・算術演算、論理演算、LD命令などで変化する
```


#### ZF sample

```
$ cat flag_test.cas
; フラグレジスタ
FLAG    START
        LD      GR0, A
        ADDA    GR0, B  ;10000000 00000000
        RET
A       DC      #7FFF   ;01111111 11111111
B       DC      01
        END

```

```
$ pycasl flag_test.cas
$ pycomet flag_test.com
load flag_test.com ... done.
PR  #0000 [ LD      GR0, #0005             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0002 [ ADDA    GR0, #0006             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #7fff(  32767) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0004 [ RET                            ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  110  (      6)
GR0 #8000( -32768) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
```




### SF(Sign Flag)：サインフラグ


```
符号付き2進数の符号フラグをあらわす
演算結果の最上位ビットがゼロのとき「0」、それ以外のとき「1」になる

算術演算、論理演算、LD命令などで変化する
```

- 符号付き2進数

```
2進数で、マイナスをあらわす方法

・＋/ー符号ではなく、最上位の1ビット(符号ビット)で正負をあらわす
・正数：最上位ビットが「0」
・負数：最上位ビットが「1」
```

![](https://i.gyazo.com/6db011df73c9b08a8e693242c62aadf2.png)

- 2進数で負数を作るには

```
マイナスの値は、2の補数であらわす
2の補数は、正の数の「0」「1」を反転して、「1」を足す

10進数： (+1) + (-1) = 0
2進数 ： (0001) + (1111) = 10000 4ビットの範囲がゼロになる
```

- 2進数であらわせる範囲

![](https://i.gyazo.com/8a82354b4b1dddb08644f0d6b02d9d38.png)

#### SF sample

```
$ cat flag_test.cas
; フラグレジスタ
FLAG    START
        LD      GR0, A
        SUBA    GR0, B
        RET
A       DC      00
B       DC      01
        END
```

```
k$ pycasl flag_test.cas
$ pycomet flag_test.com
load flag_test.com ... done.
PR  #0000 [ LD      GR0, #0005             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0002 [ SUBA    GR0, #0006             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```

```
pycomet2> s
PR  #0004 [ RET                            ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #ffff(     -1) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s

```


### OF(Overflow Flag)：オーバーフローフラグ


```
演算結果の桁あふれをあらわす
演算結果が、16ビットの範囲をこえたとき「1」、それ以外は「0」

算術演算命令(ADDA、SUBA)
・符号付き2進数として計算
・演算結果が-32768 ~ 32767を超えた場合に「1」、それ以外は「0」

論理演算命令(ADDL、SUBL)
・符号なし2進数として計算
・演算結果が0 ~ 65535を超えた場合に「1」、それ以外は「0」
```

#### OF sample

```
$ cat flag_test.cas
; フラグレジスタ
FLAG    START
        LD      GR0, A
        SUBA    GR0, B
        RET
A       DC      00
B       DC      01
        END

$ pycasl flag_test.cas
$ pycomet flag_test.com
load flag_test.com ... done.
PR  #0000 [ LD      GR0, #0005             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ ADDL    GR0, #0006             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #ffff(     -1) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ RET                            ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  100  (      4)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```

# 分岐命令

![](https://i.gyazo.com/fc656c2533803b36878887970e7c4ec2.jpg)

![](https://i.gyazo.com/bd52005b5d97f93fbcba5e7a2804dc2f.png)

## sample1

```
$ cat jump_test.cas
; ジャンプ
JUMP    START
        LD      GR0, A
        JPL     SKIP
        ADDA    GR0, B
SKIP    RET
A       DC      01
B       DC      02
        END

```

```
$ pycasl jump_test.cas
$ pycomet jump_test.com
load jump_test.com ... done.
PR  #0000 [ LD      GR0, #0007             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ JPL     #0006                  ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0001(      1) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ RET                            ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0001(      1) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```

## sample2

```
$ cat jump_test.cas
; ジャンプ
JUMP    START
        LD      GR0, A
        JPL     SKIP
        ADDA    GR0, B
SKIP    RET
A       DC      00
B       DC      02
        END

```

```
$ pycasl jump_test.cas
~/mywork$ pycomet jump_test.com
load jump_test.com ... done.
PR  #0000 [ LD      GR0, #0007             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ JPL     #0006                  ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ ADDA    GR0, #0008             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0002(      2) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


## sample3: 論理加算(ADDL)命令の結果がオーバーフローしている場合、次のLAD命令を実行せず、SKIPに分岐する

```
; ジャンプ03
JUMP    START
        LD      GR0, A
        ADDL    GR0, B
        JOV     SKIP    ; Overflow Flagが「1」だったらSKIPに分岐する
        LAD     GR1, 10
SKIP    RET
A       DC      #FFFF
B       DC      01
COND    DC      00
        END
```


```
$ pycasl calc.cas
$ pycomet -d calc.com
load calc.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ ADDL    GR0, #000a             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #ffff(     -1) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ JOV     #0008                  ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  100  (      4)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  100  (      4)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
```


# 比較命令

![](https://i.gyazo.com/7de1ad4ab6cd8d954008178a3a0c916f.jpg)

```
$ cat jump_test.cas
; ジャンプ
JUMP    START
        LD      GR0, A
        CPA     GR0, COND
        JPL     SKIP
        ADDA    GR0, B
SKIP    RET
A       DC      05
B       DC      02
COND    DC      03
        END
```

```
$ pycasl jump_test.cas
$ pycomet jump_test.com
load jump_test.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ CPA     GR0, #000b             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ JPL     #0008                  ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```

- GR0の値と、CONDラベルの値が一致したら、足し算しないで、SKIPに分岐する

```

; ジャンプ01
JUMP    START
        LD      GR0, A
        CPA     GR0, COND
        JZE     SKIP    ; 一致したらSKIPに分岐する
        ADDA    GR0, B
SKIP    RET
A       DC      00
B       DC      02
COND    DC      00
        END

```

```
$ pycasl calc.cas
$ pycomet calc.com
load calc.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ CPA     GR0, #000b             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ JZE     #0008                  ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


- GR0の値が、CONDラベルの実行アドレスの値より大きかったら、足し算しないで、SKIPに分岐する

```
; ジャンプ02
JUMP    START
        LD      GR0, A
        CPA     GR0, COND
        JPL     SKIP    ; GR0 > COND だったらSKIPに分岐する
        ADDA    GR0, B
SKIP    RET
A       DC      10
B       DC      02
COND    DC      00
        END
```


```
~$ pycasl calc.cas
~$ pycomet -d calc.com
load calc.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ CPA     GR0, #000b             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #000a(     10) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ JPL     #0008                  ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #000a(     10) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #000a(     10) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# ループで、1から3まで合計するプログラム

```
; 1から3まで合計する
MAIN    START
        LAD     GR0, 0      ; 計算結果
        LAD     GR1, 3      ; 足し算する数(カウンタ)
        LAD     GR2, 1      ; 減算分
;
LOOP    ADDA    GR0, GR1    ; 足し算
        SUBA    GR1, GR2    ; カウンタを減算
        JNZ     LOOP
        RET
        END
```

```
$ pycasl loop_test.cas
$ pycomet loop_test.com
load loop_test.com ... done.
PR  #0000 [ LAD     GR0, #0000             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0002 [ LAD     GR1, #0003             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0004 [ LAD     GR2, #0001             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0003(      3) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ ADDA    GR0, GR1               ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0003(      3) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0007 [ SUBA    GR1, GR2               ]  STEP 4
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0003(      3) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0008 [ JNZ     #0006                  ]  STEP 5
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0002(      2) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0006 [ ADDA    GR0, GR1               ]  STEP 6
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0003(      3) GR1 #0002(      2) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0007 [ SUBA    GR1, GR2               ]  STEP 7
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0002(      2) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ JNZ     #0006                  ]  STEP 8
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0001(      1) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0006 [ ADDA    GR0, GR1               ]  STEP 9
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0005(      5) GR1 #0001(      1) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0007 [ SUBA    GR1, GR2               ]  STEP 10
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #0006(      6) GR1 #0001(      1) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0008 [ JNZ     #0006                  ]  STEP 11
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0006(      6) GR1 #0000(      0) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #000a [ RET                            ]  STEP 12
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0006(      6) GR1 #0000(      0) GR2 #0001(      1) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# 10以下の偶数を足し算する。足し算の結果をGR0に格納する

```
; 偶数を足し算
MAIN    START
        LAD     GR0, 0      ; 計算結果
        LAD     GR1, 10     ; 足し算する数(カウンタ)
        LAD     GR2, 2      ; 減算分
;
LOOP    ADDA    GR0, GR1    ; 足し算
        SUBA    GR1, GR2    ; カウンタを減算
        JNZ     LOOP
        RET
        END
```

# データ領域の値を合計するプログラム

![](https://i.gyazo.com/de455f1cf105a7f75745cde7843ccb60.jpg)

```
; データ領域の値を合計する
MAIN    START
        LAD     GR0, 0      ; 計算結果
        LAD     GR1, 0      ; データ領域の現在位置
        LAD     GR2, 1      ; 増加分
;
LOOP    ADDA    GR0, DATA, GR1     ; 足し算
        ADDA    GR1, GR2           ; インデックスを加算
        CPA     GR1, NUMBER    
        JNZ     LOOP
        RET
NUMBER  DC      3
DATA    DC      1
        DC      2
        DC      3
        END
```


# データ領域の「1」から「9」までを合計する

```
; データ領域の値を合計する
MAIN    START
        LAD     GR0, 0      ; 計算結果
        LAD     GR1, 0      ; データ領域の現在位置
        LAD     GR2, 1      ; 増加分
;
LOOP    ADDA    GR0, DATA, GR1     ; 足し算
        ADDA    GR1, GR2           ; インデックスを加算
        CPA     GR1, NUMBER    
        JNZ     LOOP
        RET
NUMBER  DC      9
DATA    DC      1
        DC      2
        DC      3
        DC      4
        DC      5
        DC      6
        DC      7
        DC      8
        DC      9
        END
```
