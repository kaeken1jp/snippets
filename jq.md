[jq Manual \(development version\)](https://stedolan.github.io/jq/manual/)

# install(mac)
```bash
brew install jq
```

# how to use
```bash
curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.'
```
```jq
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
