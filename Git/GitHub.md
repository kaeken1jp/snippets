# github tips

## search filename

[Introducing the File Finder - The GitHub Blog](https://github.blog/2011-02-10-introducing-the-file-finder/)


## public URL for the Github public keys
```sh
curl https://github.com/<username>.keys
```
cf. https://stackoverflow.com/questions/16158158/what-is-the-public-url-for-the-github-public-keys

# command


# UI

## 複数行ハイライト
```
Shift押しながら、開始行と終了行をクリック
アドレスバーのURL末尾に「#L(開始行数)-L(終了行数)」が付与される
```

# api

[GitHub Developer | GitHub Developer Guide](https://developer.github.com/)


# error

## Failed to Push Some Refs | Git Error

- To fix this issue, run:

```
git pull origin <your-branch>
git push origin <your-branch>
```
