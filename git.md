# git snippets

## man
```bash
$ man git-log
$ git help log
```

## how to show config

```bash
# show all
$ git config --list
$ git config -l

# show key only
$ git config KEY_NAME
```

## how to set config
```bash
$ git config KEY_NAME VALUE # set local repo
$ git config --global KEY_NAME VALUE # set global repo

$ git config --global user.name "Your Name Comes Here"
$ git config --global user.email you@yourdomain.example.com
```

## how to delete config
```bash
$ git config --global --unset KEY_NAME
```

## how to skip password

```bash

$ cd ~/.ssh

# generate rsa key
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/(username)/.ssh/id_rsa):id_git_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:

# copy pub file
$ cat ~/.ssh/id_git_rsa.pub

# paste to GitHub
# https://github.com/settings/ssh

# set ssh config
$ vi ~/.ssh/config
Host github github.com
  HostName github.com
  IdentityFile ~/.ssh/id_git_rsa
  User git

# check connection
ssh -T github

# set git config
$ git config --global "url.git@github.com:.pushinsteadof" "https://github.com/"

```



## Importing a new project
```bash
$ tar xzf project.tar.gz
$ cd project
$ git init

$ git add .
$ git commit
```


## remove file

```bash
git rm FILE_NAME
```

## remove dir

```bash
git rm -r DIR_NAME
```


## Changing a commit message
https://help.github.com/articles/changing-a-commit-message/
```bash
git commit --amend
```

# branch

## show branch
```bash
git branch
```

## create branch
```bash
git checkout -b BRANCH_NAME

git branch
```






