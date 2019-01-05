# DS

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
