# データサイエンス(以下DS)

## 1 統計数理基礎

### DS/1-1統計数理基礎(統計数理基礎)Lv1「1+4+9+16+25+36をΣを用いて表せる」*



- python
```py
sum(map(lambda x: x**2, range(1, 6+1) ))
#=> 91
```

- R
```r
追加
#=> 91
```

### DS/2-2統計数理基礎(統計数理基礎)Lv1「loga（x） の逆関数を説明できる」*

```py
import math

print(math.log(25, 5))
#=> 2

print(math.pow(5, 2))
#=> 25
```

### DS/3-3統計数理基礎(統計数理基礎)Lv1「順列や組合せを式 nPr, nCr を用いて計算できる」*

```py
import itertools

seq = ('a', 'b', 'c', 'd')

# 4P4
list(itertools.permutations(seq))
#=> [('a', 'b', 'c', 'd'), ('a', 'b', 'd', 'c'), ('a', 'c', 'b', 'd'), ('a', 'c', 'd', 'b'), ('a', 'd', 'b', 'c'), ('a', 'd', 'c', 'b'), ('b', 'a', 'c', 'd'), ('b', 'a', 'd', 'c'), ('b', 'c', 'a', 'd'), ('b', 'c', 'd', 'a'), ('b', 'd', 'a', 'c'), ('b', 'd', 'c', 'a'), ('c', 'a', 'b', 'd'), ('c', 'a', 'd', 'b'), ('c', 'b', 'a', 'd'), ('c', 'b', 'd', 'a'), ('c', 'd', 'a', 'b'), ('c', 'd', 'b', 'a'), ('d', 'a', 'b', 'c'), ('d', 'a', 'c', 'b'), ('d', 'b', 'a', 'c'), ('d', 'b', 'c', 'a'), ('d', 'c', 'a', 'b'), ('d', 'c', 'b', 'a')]

len(list(itertools.permutations(seq)))
#=> 24

# 4P2
list(itertools.permutations(seq, 2))
#=> [('a', 'b'), ('a', 'c'), ('a', 'd'), ('b', 'a'), ('b', 'c'), ('b', 'd'), ('c', 'a'), ('c', 'b'), ('c', 'd'), ('d', 'a'), ('d', 'b'), ('d', 'c')]

len(list(itertools.permutations(seq, 2)))
#=> 12

# 4C2
list(itertools.combinations(seq,2))
#=> [('a', 'b'), ('a', 'c'), ('a', 'd'), ('b', 'c'), ('b', 'd'), ('c', 'd')]

len(list(itertools.combinations(seq,2)))
#=> 6

```


### DS/4-4統計数理基礎(統計数理基礎)Lv1「条件付き確率の意味を説明できる」*

```
条件付き確率 (conditional porbability) とは:
ある事象Aが起こるという条件下での別の事象Bの確率
```

<img src=https://latex.codecogs.com/gif.latex?P%28B%20%7C%20A%29%20%3D%20%5Cfrac%7BP%28A%20%5Ccap%20B%29%7D%7BP%28A%29%7D>

```
例題:
事象A「さいころを2回投げて1回目に出た目が4」の条件下で、
事象B「さいころを2回投げて出た目の和が8以上」となる確率は?
```

- 事象Aの確率
<img src=https://latex.codecogs.com/gif.latex?P%28A%29%20%3D%20%5Cfrac%7B1%7D%7B6%7D>

- 事象Bの確率(目の組み合わせは（4, 4）（4, 5）（4, 6）の3通り)
<img src=https://latex.codecogs.com/gif.latex?P%28A%5Ccap%20B%29%20%3D%20%5Cfrac%7B3%7D%7B36%7D>

- 答え
<img src=https://latex.codecogs.com/gif.latex?P%28B%20%7C%20A%29%20%3D%20%5Cfrac%7B%5Cfrac%7B3%7D%7B36%7D%7D%7B%5Cfrac%7B1%7D%7B6%7D%7D%20%3D%20%5Cfrac%7B1%7D%7B2%7D>

```py
import sympy as sym
P_AandB = sym.Rational(3, 36)
P_A = sym.Rational(1, 6)
P_BcondA = P_AandB / P_A
#=> 1/2
```


### DS/5-5統計数理基礎(統計数理基礎)Lv1「平均（相加平均）、中央値、最頻値の算出方法の違いを説明できる」*
### DS/6-6統計数理基礎(統計数理基礎)Lv1「⺟集団データ（3,4,5,5,7,8）の分散と標準偏差を電卓を用いて計算できる」*
### DS/7-7統計数理基礎(統計数理基礎)Lv1「⺟（集団）平均が標本平均とは異なることを説明できる」*

```py
from statistics import mean,median,variance,stdev,mode

data = [100,200,300,400,500,500,600,700,800,800,800]

m = mean(data)
median = median(data)
variance = variance(data)
stdev = stdev(data)
mode_res = mode(data)

print('平均: {0:.2f}'.format(m))
#=> 平均: 518.18

print('中央値: {0:.2f}'.format(median))
#=> 中央値: 500.00

print('分散: {0:.2f}'.format(variance))
#=> 分散: 61636.36

print('標準偏差: {0:.2f}'.format(stdev))
#=> 標準偏差: 248.27

print('最頻値: {0:.2f}'.format(mode_res))
#=> 最頻値: 800.00

import random

# dataを母集団とすると、サンプルサイズ5の標本data_sampleを抽出
data_sample = random.sample(data, 5)
#=> [600, 800, 400, 200, 500]

# mを母平均とすると、標本平均m_sampleを標本から算出
m_sample = mean(data_sample);
#=> 500
```


### DS/8-8統計数理基礎(統計数理基礎)Lv1「標準正規分布の分散と平均がいくつかわかる」*

平均0, 標準偏差1の正規分布

```py
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import norm

# ベクトルxを [-5.0, ..., 5.0] の区間で作成
n = np.linspace(-5.0, 5.0, 10000)

# 平均0, 標準偏差1の正規分布における、xの確率を求める
p = []
for i in range(len(n)):
    p.append(norm.pdf(x=n[i], loc=0, scale=1))

# 乱数－確率 の特性を散布図で表し、標準正規分布のグラフを作成
plt.scatter(n, p)
plt.show()
```
<img src=https://i.gyazo.com/e9f75370a5b645f808afec194df4e97c.png>




### DS/9-9統計数理基礎(統計数理基礎)Lv1「相関関係と因果関係の違いを説明できる」*
### DS/10-10統計数理基礎(統計数理基礎)Lv1「名義尺度、順序尺度、間隔尺度、⽐例尺度の違いを説明できる」*
### DS/11-11統計数理基礎(統計数理基礎)Lv1「⼀般的な相関係数（ピアソン）の分⺟と分⼦を説明できる」*
### DS/12-12統計数理基礎(統計数理基礎)Lv1「５つ以上の代表的な確率分布を説明できる」*
### DS/13-13統計数理基礎(統計数理基礎)Lv1「⼆項分布の事象もサンプル数が増えていくと中⼼極限定理により正規分布に近似されることを知っている」*
### DS/14-14統計数理基礎(統計数理基礎)Lv1「変数が量的、質的どちらの場合の関係の強さも算出できる」*
### DS/15-15統計数理基礎(統計数理基礎)Lv1「ベイズの定理を説明できる」*




