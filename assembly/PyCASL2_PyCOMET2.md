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




# START命令

![](https://i.gyazo.com/d3f0727a80328821f1f0bc06414a1465.jpg)

```
START 	［実行開始番地］
```

- 実行開始番地で、プログラムの実行を開始するアドレスを指定できる
- 実行開始番地を省略した場合は、STARTの次の命令から実行を開始する
- START命令の前のラベルは、このプログラムを他から呼び出す場合に指定する

```
;テキスト出力
MAIN    START  BIGIN
        LAD    GR0, 10  ; ダミー
BIGIN   OUT    BUF,LEN
        RET
BUF     DC     'Hello World'
LEN     DC     11
        END
```


# END命令


![](https://i.gyazo.com/d9342e1098b1f706733f16e263a99c3a.png)

```
プログラム全体の終わりを定義


END


- コードの末尾をあらわす
- RETの次からENDまでがデータ領域
```


# DC命令

![](https://i.gyazo.com/c24486da3fbb7a3184d34f00cb8da20e.jpg)

```
データ領域に値を格納する


DC      定数


- データ領域を確保し、そこに値を配置する
- 定数には、10進数・16進数・文字定数・ラベルを指定
- 10進数：符号付き2進数 −32768 〜 32767
- 16進数：4桁の16進数、先頭に「#」を付ける
- 文字定数：文字数分の領域を確保し、文字データを格納する。アポストロフィで囲む
- アドレス：ラベルに対応するアドレスを格納する
- 格納した値を読み込むには、ラベルを利用する

;テキスト出力
MAIN    START
        OUT    BUF,LEN
        RET
BUF     DC     'Hello World'
LEN     DC     11
        END
```

# DS命令

![](https://i.gyazo.com/960c85a5cb016039d22bccddd2d65d83.jpg)

```
データ領域を確保する


DS      語数


- 語数は、10進数で記述する。指定した語数のメモリ領域を確保
- 値のアクセスは、ラベルを利用する

; 足し算する
CALC    START
        LD      GR0, A
        ADDA    GR0, B
        ST      GR0, ANS
        RET
A       DC      03
B       DC      02
ANS     DS      01
        END
```



# OUT命令

![](https://i.gyazo.com/3d2e91117b15fbfea2a9928c82852728.jpg)

```
テキストを出力する


OUT     出力領域, 出力文字長領域


- 割り当てられた出力装置に、文字データを書き出す
- 出力領域：文字定数が格納された領域のラベルを指定する
- 出力文字長領域：出力する文字数を格納する領域のラベルを指定

; テキスト出力
MAIN    START
        OUT    BUF,LEN
        RET
BUF     DC     'Hello World'
LEN     DC     11
        END
```



# IN命令

![](https://i.gyazo.com/28eaf288add967ed83da440980d71b5b.jpg)

```
テキストを入力する


IN      入力領域, 入力文字長領域


- 割り当てられた入力装置から、文字データを入力する
- paizaラーニングでは、キーボードから文字を入力
- 入力領域：入力文字を格納する領域のラベルを指定
- 入力文字長領域：入力した文字数を格納する領域のラベルを指定


; テキスト入力
MAIN    START
        IN     BUF, LEN
        OUT    BUF, LEN
        RET
BUF     DS     256
LEN     DS     1
        END
```




# ADDA命令

![](https://i.gyazo.com/ee12785e9767dd80a10c170e9380dffc.jpg)

```
算術加算：16ビットの符号付き2進数として加算をおこなう

- 演算範囲は、-32768(#8000) ~ 32767(#7FFF)
- 演算結果がこの範囲を超えると、OFが「1」になる
- レジスタ間の加算と、レジスタ・メモリ間の加算ができる


ADD Arithmetic  ADDA    r1, r2          r1 ← (r1) + (r2)
                        r, adr [, x]    r ← (r) + (実効アドレス)
```



# ADDL命令


![](https://i.gyazo.com/879f314065b5127af08a8daa99b16f84.jpg)

```
論理加算：16ビットの符号なし2進数として加算をおこなう

- 演算範囲は、0 ~ 65535(#FFFF)
- 演算結果がこの範囲を超えると、OFが「1」になる
- レジスタ間の加算と、レジスタ・メモリ間の加算ができる


ADD Logical  ADDL   r1, r2          r1 ← (r1) +L (r2)
                    r, adr [, x]    r ← (r) +L (実効アドレス)
```


# 算術加算と論理加算

![](https://i.gyazo.com/7be1f23903d641f3240bbf76d6a8f1b8.jpg)

```
  7FFF + 01 = 8000

  32767 :   0111 1111 1111 1111
+     1 :   0000 0000 0000 0001
--------------------------------
            1000 0000 0000 0000



符号付き2進数 -32768 > OF = 1
符号なし2進数 32768 > OF = 0
```

```
$ cat calc.cas
; 足し算
CALC    START
        LD      GR0, A
        ADDA    GR0, B  ; 算術加算
        LD      GR0, A
        ADDL    GR0, B  ; 論理加算
        RET
A       DC      #7fff
B       DC      01
        END
```


```
$ pycomet -d calc.com
load calc.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ ADDA    GR0, #000a             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #7fff(  32767) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)
pycomet2> s
PR  #0004 [ LD      GR0, #0009             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  110  (      6)
GR0 #8000( -32768) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ ADDL    GR0, #000a             ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #7fff(  32767) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 4
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #8000( -32768) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# SUBA命令

![](https://i.gyazo.com/00d2467237093010969139ca6566c2c5.jpg)

```
算術減算：符号付き2進数として減算をおこなう

- 演算範囲は、-32768 ~ 32767
- 演算結果がこの範囲を超えると、OFが「1」になる
- レジスタ間の減算と、レジスタ・メモリ間の減算ができる

SUBtract Arithmetic  SUBA   r1, r2          r1 ← (r1) - (r2)
                            r, adr [, x]    r ← (r) + (実効アドレス)
```


# SUBL命令

![](https://i.gyazo.com/22eb83d68f0be5661afbd4a077027095.jpg)

```
論理減算：符号なし2進数として減算をおこなう

- 演算範囲は、0 ~ 65535
- 演算結果がこの範囲を超えると、OFが「1」になる
- レジスタ間の減算と、レジスタ・メモリ間の減算ができる

SUBtract Logical  SUBL  r1, r2          r1 ← (r1) +L (r2)
                        r, adr [, x]    r ← (r) +L (実効アドレス)
```


# 算術減算と論理減算

![](https://i.gyazo.com/f66c7fc178f00c77c14c88ec9a9b7b07.jpg)

```
8000 - 01 = 7FFF

  1000 0000 0000 0000
- 0000 0000 0000 0001
-----------------------------
  0111 1111 1111 1111


算術減算 -32768 - 1 = 32767 > OF = 1
論理減算 32768 - 1 = 32767 > OF = 0
```


```
$ cat calc.cas
; 引き算
CALC    START
        LD      GR0, A
        SUBA    GR0, B  ; 算術減算
        LD      GR0, A
        SUBL    GR0, B  ; 論理減算
        RET
A       DC      #8000
B       DC      01
        END
```


```
$ pycomet calc.com
load calc.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ SUBA    GR0, #000a             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #8000( -32768) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ LD      GR0, #0009             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  100  (      4)
GR0 #7fff(  32767) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ SUBL    GR0, #000a             ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #8000( -32768) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 4
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #7fff(  32767) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# AND命令

![](https://i.gyazo.com/6ca25a590102409fdcc329994984ef9a.jpg)

```
- 16ビットのAND演算
- 演算結果に合わせてサインフラグとゼロフラグが変化する
オーバーフローフラグは「0」になる
- レジスタ間と、レジスタ・メモリ間で演算できる


AND     AND r1, r2          r1 ← (r1) AND (r2)
            r, adr [, x]    r ← (r) AND (実効アドレス)
```


# OR命令

![](https://i.gyazo.com/efc3cf875098b7690ae14d649885add3.png)

```
- 16ビットのOR演算
- 演算結果に合わせてサインフラグとゼロフラグが変化する
オーバーフローフラグは「0」になる
- レジスタ間と、レジスタ・メモリ間で演算できる


OR      OR  r1, r2          r1 ← (r1) OR (r2)
            r, adr [, x]    r ← (r) OR (実効アドレス)
```


# 特定ビットの0/1を判別

![](https://i.gyazo.com/60dc44e6a20e2e24b55f09c9a27713df.jpg)

```
- 組み込み機器で、特定のメモリアドレスに、スイッチやセンサーを接続
- そのオン(1)／オフ(0)を判別したい
- 判別したいビットだけ「1」、残りを「0」にして、ANDで演算する

4ビット目のオン／オフを判別したい

     ---- ---- ---X ----
AND  0000 0000 0001 0000
------------------------
     0000 0000 000X 0000

4ビット目は、そのまま。残りのビットは、すべて「0」になる。
ゼロフラグで分岐する
```


# 特定ビットを「0」に設定

![](https://i.gyazo.com/2dec6916ad0f1d833671edcea400f6b7.jpg)

```
- 組み込み機器で、特定のメモリアドレスに、LEDや出力装置を接続
- そのビットをオフ(0)に設定したい
- 設定したいビットだけ「0」、残りを「1」にして、ANDで演算する

4ビット目のオン／オフを判別したい

     XXXX XXXX XXX- XXXX
AND  1111 1111 1110 1111
------------------------
     XXXX XXXX XXX0 XXXX

4ビット目は「0」になり、残りのビット「X」はそのまま
```




# 特定ビットを「1」に設定

![](https://i.gyazo.com/dfb42bf6753ce279d96a1297a54698fa.jpg)

```
- 組み込み機器で、特定のメモリアドレスに、LEDや出力装置を接続
- そのビットをオン(1)に設定したい
- 設定したいビットだけ「1」、残りを「0」にして、ORで演算する

4ビット目のオン／オフを判別したい

     XXXX XXXX XXX- XXXX
OR   0000 0000 0001 0000
------------------------
     XXXX XXXX XXX1 XXXX

4ビット目は「1」になり、残りのビット「X」はそのまま
```

# AND命令とOR命令

![](https://i.gyazo.com/2865c5c29392cc4138d2186a208b15e4.jpg)


```
$ cat logic.cas
; 論理演算
CALC    START
        LD      GR0, A
        AND     GR0, B
        LD      GR0, A
        OR      GR0, B
        RET
A       DC      #5555
B       DC      #FF00
        END

```

```
$ pycomet logic.com
load logic.com ... done.
PR  #0000 [ LD      GR0, #0009             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ AND     GR0, #000a             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #5555(  21845) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ LD      GR0, #0009             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #5500(  21760) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ OR      GR0, #000a             ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #5555(  21845) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0008 [ RET                            ]  STEP 4
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #ff55(   -171) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# XOR命令

![](https://i.gyazo.com/35f46486b2e55ef1d7c212e695ab0800.jpg)
![](https://i.gyazo.com/b4e8e4054b4d1427d7a4cb40da249b32.jpg)
![](https://i.gyazo.com/ec61f157244aa2a8ee08e00439e73a04.jpg)


```
- 16ビットのExclusive OR演算(排他的論理和)
- 演算結果に合わせてサインフラグとゼロフラグが変化する
オーバーフローフラグは「0」になる
- レジスタ間と、レジスタ・メモリ間で演算できる

XOR     XOR r1, r2          r1 ← (r1) XOR (r2)
            r, adr [, x]    r ← (r) XOR (実効アドレス)
```

```
5555 XOR FF00 = AA55

        5555    0101 0101 0101 0101
        FF00    1111 1111 0000 0000
-----------------------------------
XOR     AA55    1010 1010 0101 0101
```


```
- 特定のビットを反転、つまり「0」→「1」、「1」→「0」に設定したい
- 設定したいビットだけ「1」、残りを「0」にして、XORで演算する
- 組み込み機器で、特定のメモリアドレスに、LEDや出力装置を接続

4ビット目・5ビット目を反転したい

      XXXX XXXX XX01 XXXX
XOR   0000 0000 0011 0000
------------------------
      XXXX XXXX XX10 XXXX

4ビット目・5ビット目を反転して、残りのビット「X」はそのまま
```

```
$ cat logic.cas
; 論理演算
CALC    START
        LD      GR0, A
        XOR     GR0, B
        RET
A       DC      #5555
B       DC      #FF00
        END
```

```
$ pycomet logic.com
load logic.com ... done.
PR  #0000 [ LD      GR0, #0005             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ XOR     GR0, #0006             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #5555(  21845) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ RET                            ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #aa55( -21931) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```





# シフト演算命令

![](https://i.gyazo.com/e78e93e65add6f3b1cee36cb8bb95939.jpg)
![](https://i.gyazo.com/e9f878ad0199ef78a819026841682b9b.jpg)
![](https://i.gyazo.com/0443492d501147dabf18ce35294c5917.jpg)

```
レジスタの値を指定ビット分、移動させる

- 算術シフト：符号ビットを含まずにシフトする
- SLA命令：左方向に算術シフト
- SRA命令：右方向に算術シフト

- 論理シフト：符号ビットを含めてシフトする
- SLL命令：左方向に論理シフト
- SRL命令：右方向に論理シフト
```


# SLA命令

![](https://i.gyazo.com/7bf1b3115bbf0d1dc87c3a8fed31c1be.jpg)

```
SLA     SLA r, adr [, x]


- 符号ビットを含まずに、ビットパターンを左方向に移動
- 右側の空いたビットは「0」になる
- 左側のはみ出したビットは削除される
- 最後にはみ出したビットをOFにセット
- シフトする量を、実効アドレスで指定する
SLA GR0, 1 ; 1ビット左に算術シフト
SLA GR0, 2 ; 2ビット左に算術シフト
```


# SRA命令

![](https://i.gyazo.com/debe95eb7ff91790f8baf7a44568afd2.jpg)


```
SRA     SRA r, adr [, x]


- 符号ビットを含まずに、ビットパターンを右方向に移動
- 左側の空いたビットは、符号ビットと同じ値になる
- 右側のはみ出したビットは削除される
- 最後にはみ出したビットをOFにセット
- シフトする量を、実効アドレスで指定する
SRA GR0, 1 ; 1ビット右に算術シフト
SRA GR0, 2 ; 2ビット右に算術シフト
```


# 算術シフト

![](https://i.gyazo.com/6aed8174fcbb4e5e326fd77acc33b5b4.jpg)

```
        AAAA    1010 1010 1010 1010
SRA     D555    1101 0101 0101 0101
SLA     AAAA    1010 1010 1010 1010
```


```
$ cat logic.cas
; シフト演算
CALC    START
        LD      GR0, A
        SRA     GR0, 1
        SLA     GR0, 1
        RET
A       DC      #AAAA
B       DC      01
        END
```

```
$ pycomet logic.com
load logic.com ... done.
PR  #0000 [ LD      GR0, #0007             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ SRA     GR0, #0001             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #aaaa( -21846) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ SLA     GR0, #0001             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #d555( -10923) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ RET                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  110  (      6)
GR0 #aaaa( -21846) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# SLL命令

![](https://i.gyazo.com/f621b582e388234800f4334f3fd8c814.jpg)

```
SLL SLL r, adr [, x]

- 符号ビットを含めて、ビットパターンを左方向に移動
- 右側の空いたビットは「0」になる
- 左側のはみ出したビットは削除される
- 最後にはみ出したビットをOFにセット
- シフトする量を、実効アドレスで指定する
SLL GR0, 1 ; 1ビット左に論理シフト
SLL GR0, 2 ; 2ビット左に論理シフト
```

# SRL命令

![](https://i.gyazo.com/9eca57e4ddc8447c76765a05a7f8704f.jpg)

```
SRL SRL r, adr [, x]

- 符号ビットを含めて、ビットパターンを右方向に移動
- 左側の空いたビットは「0」になる
- 右側のはみ出したビットは削除される
- 最後にはみ出したビットをOFにセット
- シフトする量を、実効アドレスで指定する
SRL GR0, 1 ; 1ビット右に論理シフト
SRL GR0, 2 ; 2ビット右に論理シフト
```


# 論理シフト

![](https://i.gyazo.com/e21e1001215bcc401cc5feed67fd054b.jpg)


```
        AAAA    1010 1010 1010 1010
SLL     5554    0101 0101 0101 0100
SRL     2AAA    0010 1010 1010 1010
```

```
$ cat logic.cas
; シフト演算
CALC    START
        LD      GR0, A
        SLL     GR0, 1
        SRL     GR0, 1
        NOP
        RET
A       DC      #AAAA
B       DC      01
        END

```



```
$ pycomet logic.com
load logic.com ... done.
PR  #0000 [ LD      GR0, #0008             ]  STEP 0
SP  #ff00(  65280) FR(OF, SF, ZF)  001  (      1)
GR0 #0000(      0) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0002 [ SLL     GR0, #0001             ]  STEP 1
SP  #ff00(  65280) FR(OF, SF, ZF)  010  (      2)
GR0 #aaaa( -21846) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0004 [ SRL     GR0, #0001             ]  STEP 2
SP  #ff00(  65280) FR(OF, SF, ZF)  100  (      4)
GR0 #5554(  21844) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0006 [ NOP                            ]  STEP 3
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #2aaa(  10922) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

pycomet2> s
PR  #0007 [ RET                            ]  STEP 4
SP  #ff00(  65280) FR(OF, SF, ZF)  000  (      0)
GR0 #2aaa(  10922) GR1 #0000(      0) GR2 #0000(      0) GR3: #0000(      0)
GR4 #0000(      0) GR5 #0000(      0) GR6 #0000(      0) GR7: #0000(      0)

```


# NOP命令

![](https://i.gyazo.com/eee8c5204a4a7e31db88a881d654bb55.jpg)

```
何もしない

- 実際のCPUでは、命令1個分の時間を消費する
- 実行時のタイミング調整や、ダミー命令に利用する
```





# LD命令

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




# 文字コード

```
コンピュータで文字を扱うため、1文字ごとにあたえた識別番号

「1」 ⇒ 0011 0001、#31
「A」 ⇒ 0100 0001、#41
```

![](https://i.gyazo.com/84322a827459b5311b0969f5017d90fe.jpg)

```
- ASCII：英数字や記号、改行などの制御文字、7ビットであらわす
- JIS X 0201：ASCIIを8ビットに拡張
- 「\」(バックスラッシュ)を「￥」(エンマーク)に、
- 「~」(チルダ)を、「‾」(オーバーライン)に置き換え
- 8ビット領域にカタカナと句読点や濁点・半濁点を追加
- CASLⅡとCOMETⅡで利用

1バイト文字 > 最大8ビット = 1バイトで表現できる文字コード
マルチバイト文字 > 漢字や多言語をあつかう(UTF-8、UTF-16)
```


```
数字の「1」：列 = 03、行 = 1 ⇒ #31
数字の「A」：列 = 04、行 = 1 ⇒ #41

CASLⅡでテキストを指定
- アセンブルして文字コードに置き換える
- 上位ビットはゼロになる
```

![](https://i.gyazo.com/a111476e5ebddd3faf2a7b4f31da5c65.jpg)

```
「#0048」⇒ H 「#48」
「#0065」⇒ e 「#65」
「#006c」⇒ l 「#6c」
「#006c」⇒ l 「#6c」
「#006f」⇒ o 「#6f」
```



# stack, SP(stack pointer)

![](https://i.gyazo.com/fb82ca6731f44b68b75815eeaf6de213.jpg)

```
スタック(Stack)：データを一時的に退避させる仕組み

- 入ってきた順番に、積み重ねる
- 取り出すときは、最後に入れたものから取り出す
- 後から入れたものを先に出す(LIFO: Last In First Out)、
先に入れたものを後から出す(FILO: First In Last Out)
```

![](https://i.gyazo.com/d79176eb145e6194a868fc624cce9227.jpg)
![](https://i.gyazo.com/eb8cb6a1e1424c77f593d95495a7a8c8.jpg)
![](https://i.gyazo.com/90c7faae3785e12c1ef0be0fb036ec44.jpg)

```
基本動作
- Push：スタックにデータを入れる
- Pop ：スタックからデータを取り出す
```

```
用途
- レジスタ値の一時保存
- サブルーチンの呼び出し
```


```
SP stack pointer スタックポインタ: スタックを実現するためのレジスタ
- 16ビットで、メモリアドレスを保持する
- メモリに、スタック領域を確保しておく
```

```
SP動作
最初に、スタックポインタは、スタック領域の最終アドレスの「+1」を保持
- データをPush：
スタックポインタの値を「-1」
現在のスタックポインタのアドレスにデータを格納

- データをPop：
現在のスタックポインタのアドレスからデータを取り出す
スタックポインタの値を「+1」
```


```
スタック命令
- PUSH／POP：スタックに値を出し入れする機械語命令。
- CALL／RET：サブルーチンを呼び出す、サブルーチンから戻るための機械語命令
- RPUSH／RPOP：GR1 - GR7の値をスタックに出し入れするマクロ命令。GR0は格納できない。
```






