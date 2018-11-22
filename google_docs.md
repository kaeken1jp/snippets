# google_docs snippets

## double quote
```
// ""
="""id"": 100"

// CHAR(34)
=CHAR(34)&"id"&CHAR(34)&": 100"
=CONCATENATE(CHAR(34), "id", CHAR(34), ": ", 100)

// => "id": 100
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


