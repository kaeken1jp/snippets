# google docs



# google sheets

## cell link
```
URL末尾にrangeパラメータを付加してセル番地を指定する

# セル番地D10を選択状態にする
  __URL__#gid=0123456789&range=D10

# 12行目を選択状態にする
  __URL__#gid=0123456789&range=12:12

# B列目を選択状態にする
  __URL__#gid=0123456789&range=B:B
```

## AND / OR / NOT
```
AND(TRUE,FALSE,TRUE)

AND(A1:A10,B1:B10)

AND(0,1,2,3)

OR(TRUE,FALSE,TRUE)

OR(A1:A10,B1:B10)

OR(0,1,2,3)

NOT(A2)

NOT(ISERR(A2))
```


## JOIN
```
A1=a
B1=b
C1=c

=JOIN(",", A1:C1) #=> a,b,c

="AND col IN ('"&JOIN("','", A1, B1, C1)&"')"
#=> AND col IN ('a','b','c')

A1=a1
A2=a2
A3=a3

="AND col IN ('"&JOIN("','", A1:A3)&"')"
#=> AND col IN ('a1','a2','a3')
```



## double quote
```
// ""
="""id"": 100"

// CHAR(34)
=CHAR(34)&"id"&CHAR(34)&": 100"
=CONCATENATE(CHAR(34), "id", CHAR(34), ": ", 100)
// => "id": 100

// delete double quote
// A1 "hoge" => hoge
=REGEXREPLACE(A1, CHAR(34), "")
```


## regexreplace
```
=REGEXREPLACE(A1, "^[0-9]+? (.+)$", "$1")

before: "123 foo"
after: "foo"
```

```
=SPLIT(REGEXREPLACE(A1, "^[0-9]+ ([a-zA-Z¥-]+) (.+)$", "$1|$2"), "|")

before: "123 foo bar baz"
after: "foo" "bar baz"
```


## scraping with IMPORTXML & xpath
```
# A1: word
# at weblio.jp

# meaning
=IMPORTXML("https://ejje.weblio.jp/content/"&$A1,"//*[@id='summary']/div[2]/table/tbody/tr/td[2]")

# syllable


# pronouncation
=IMPORTXML("https://ejje.weblio.jp/content/"&$A1,"//*[@id='phoneticEjjeNavi']")
```

## convert UNIX TIME to date
```
// A2:1539183683
// A3:1539183693

// B2
=ARRAYFORMULA(A2:A/86400+date(1970,1,1))

// B2:2018年10月10日水曜日 15時01分23秒
// C3:2018年10月10日水曜日 15時01分33秒
```

## SUBTOTAL

https://support.google.com/docs/answer/3093649

```
SUBTOTAL
指定した集計関数を使用して、セルの垂直範囲の小計を返します。

使用例
SUBTOTAL(1,A2:A5,B2:B8)

構文
SUBTOTAL(関数コード, 範囲1, [範囲2, ...])

関数コード - 小計の集計で使用する関数です。

1 - AVERAGE

2 - COUNT

3 - COUNTA

4 - MAX

5 - MIN

6 - PRODUCT

7 - STDEV

8 - STDEVP

9 - SUM

10 - VAR

11 - VARP

1 桁のコードの先頭に 10 を追加するか、2 桁のコードの先頭に 1 を追加すると、これらのコードのいずれにおいても非表示の値を無視することができます。たとえば、COUNT 関数として 102 を指定すると非表示セルが無視され、VAR 関数として 110 を指定すると非表示セルが無視されます。

範囲1 - 小計を求める最初の範囲です。

範囲2, ... - 小計を求める追加の範囲です。

メモ
SUBTOTAL 関数では、自動フィルタ条件により非表示となっているセルは関数コードにかかわらず、一切集計されません。

指定した範囲内のセルで SUBTOTAL 関数を含むセルはすべて、二重集計を防ぐために無視されます。

SUBTOTAL 関数は、関数コードの引数で別のセルを参照することにより、動的なダッシュボードを作成するのに使用できます。リストベースのデータ検証と組み合わせると、このセルはダッシュボード全体を瞬時に更新するプルダウン リストにできます。

SUBTOTAL 関数は、フィルタ領域の上に小計ダッシュボードを作成することにより、さまざまなデータのサブセットをすばやく解析するのに使用できます。フィルタ条件を変更するたびに、ダッシュボードは自動的に新しい集計で更新されます。

SUBTOTAL 関数を使用すると、単純な SUM 数式による二重集計を防ぐことができます。
```



