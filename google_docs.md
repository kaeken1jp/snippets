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
