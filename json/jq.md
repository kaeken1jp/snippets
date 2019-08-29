# def

```
jq is a lightweight and flexible command-line JSON processor.
```

[jq Manual \(development version\)](https://stedolan.github.io/jq/manual/)

# install(mac)

```bash
brew install jq
```

# how to use

```bash
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.'
```

```json
[
  {
    "sha": "d25341478381063d1c76e81b3a52e0592a7c997f",
    "commit": {
      "author": {
        "name": "Stephen Dolan",
        "email": "mu@netsoc.tcd.ie",
        "date": "2013-06-22T16:30:59Z"
      },
      "committer": {
        "name": "Stephen Dolan",
        "email": "mu@netsoc.tcd.ie",
        "date": "2013-06-22T16:30:59Z"
      },
      "message": "Merge pull request #162 from stedolan/utf8-fixes\n\nUtf8 fixes. Closes #161",
      "tree": {
        "sha": "6ab697a8dfb5a96e124666bf6d6213822599fb40",
        "url": "https://api.github.com/repos/stedolan/jq/git/trees/6ab697a8dfb5a96e124666bf6d6213822599fb40"
      },
      ...
```



# how to replace escape sign

```bash
$ echo '"foo\nbar\nbaz"' | jq '.'
"foo\nbar\nbaz"

$ echo '"foo\nbar\nbaz"' | jq -r '.'
foo
bar
baz
```

# merge files
```bash
f=''; for i in `seq 1 100`; do f=${f}" ./*_output$i.json"; done; jq -s add $f > merged.json
```

# Object Identifier-Index
```
$ curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq .[] | jq .url

"https://api.github.com/repos/stedolan/jq/commits/37b2d2129e5ff5d79c0f4ef08b031fa257b0bf28"
"https://api.github.com/repos/stedolan/jq/commits/78774647e10414bcff2e1ea52074003dec024dfc"
"https://api.github.com/repos/stedolan/jq/commits/a97638713ad30653d424f136018098c4b0e5c71b"
"https://api.github.com/repos/stedolan/jq/commits/8d9817d2f7349b6db758783ace4c0c644d5dd7c0"
"https://api.github.com/repos/stedolan/jq/commits/e944fe843651b3044e5387c69b28b28f4999e9ea"
```
