# google_docs snippets

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
