# project site

https://www.r-project.org/

# desktop env

https://cran.ism.ac.jp/

# online env

https://rstudio.cloud/

Execute R Online http://www.compileonline.com/execute_r_online.php

Run R code online https://rdrr.io/snippets/

Repl.it - TragicWelcomeEvent https://repl.it/repls/TragicWelcomeEvent

R Online Editor - R Online IDE - R Coding Online https://www.jdoodle.com/execute-r-online



# syntax

## prompt
```r
x <- something()

something() -> y
```

## comment out
```r
# single line1
# single line2

# multi lines tips
if(0){
multi
lines
}
```

## combine
```r
x <- c("a", "b", "c")
x # [1] "a" "b" "c"
```

## table()
```r
x <- c("a", "b", "c", "d", "b", "c", "d", "d", "c")
table(x)

# x
# a b c d 
# 1 2 3 3 
```

## length()
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
length(x)
# [1] 20
```

## hist()
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
hist(x)
```
![result](https://i.gyazo.com/757c7fe79e03169699be18249ec1cf5a.png)

## sum
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
sum(x) #[1] 95
```

## mean
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
mean(x) #[1] 4.75
```

## median
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
median(x) #[1] 4
```

## min
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
min(x) #[1] 1
```

## max
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
max(x) #[1] 9
```

## summary
```r
x <- c(1, 9, 2, 3, 4, 9, 2, 8, 5, 4, 3, 8, 4, 5, 1, 9, 5, 6, 3, 4)
summary(x)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   1.00    3.00    4.00    4.75    6.50    9.00 
```

## period
```r
data.train <- 'train'
data.test <- 'test'

data # error
data.train # 'train'
data.test # 'test'
```


## %%
```r
res = 9 / 2
res # 4.5

res = 9 %% 2
res # 1
```

## matrix

```r
res = matrix(c(11,12,13,14,15,21,22,23,24,25,31,32,33,34,35),5,3)
res
#     [,1] [,2] [,3]
#[1,]   11   21   31
#[2,]   12   22   32
#[3,]   13   23   33
#[4,]   14   24   34
#[5,]   15   25   35
```

## sample
```r
# replace=F
> sample(1:10, 6, replace=F)
[1] 6 4 7 5 1 8
> sample(1:10, 6, replace=F)
[1] 10  9  7  6  4  8
> sample(1:10, 6, replace=F)
[1] 3 6 8 1 2 4
> sample(1:10, 6, replace=F)
[1]  9  6  4  3 10  1
> sample(1:10, 6, replace=F)
[1]  4  8  9  6 10  3

# replace=T
> sample(1:10, 6, replace=T)
[1] 10  5  7  5 10  7
> sample(1:10, 6, replace=T)
[1]  8 10  6  5  2  8
> sample(1:10, 6, replace=T)
[1] 2 8 9 2 3 4
> sample(1:10, 6, replace=T)
[1] 3 7 2 7 6 3
> sample(1:10, 6, replace=T)
[1] 10  1  7  2 10 10
```

## read csv
```r
contents <- read.csv("file.csv")
```

## function
```r
fnc_name <- function(x) {
  ret <- something()
}
```

```r
# 標本分散を算出する関数
varp <- function(x) {
  ret <- var(x) * ( length(x) - 1 ) / length(x)
  ret
}

x <- c(10, 13, 8, 15, 8)
x
# [1] 10 13  8 15  8

# 不偏分散
var(x)
# [1] 9.7

# 標本分散
varp(x)
# [1] 7.76
```

## external file
```r
# external_file.R
var <- c(1,2,3,4,5)
print(var)
```

```r
# include file
source("external_file.R")

var

```

## install package

```r
# install package by GUI
# TODO: command line installation

# use package
library(sem)
```
