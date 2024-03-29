# git snippets

## man
```bash
$ man git-log
$ git help log
```

## alias

```sh
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
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

## how to set config (.gitconfig)
```sh
$ cat ~/.gitconfig
[user]
	email = xxx
	name = xxx
[filter "lfs"]
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
[credential]
	helper = osxkeychain
[url "git@github.com:"]
	pushinsteadof = https://github.com/
[core]
  excludesfile = /Users/xxx/.gitignore_global
```


## how to delete config
```bash
$ git config --global --unset KEY_NAME
```

## How to check a repository's status in Git:

- This command will show the status of the current repository including staged, unstaged, and untracked files.

```bash
$ git status
```


## how to set ignore

- set

```sh
$ cat ~/.gitconfig
...
[core]
  excludesfile = /Users/xxx/.gitignore_global
```

- check -> dot_gitignore_global file

- reflect

```sh
git config --global core.excludesfile ~/.gitignore_global
```


## how to skip password

```bash
$ mkdir ~/.ssh

$ cd ~/.ssh

# generate rsa key
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/(username)/.ssh/id_rsa):id_git_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:

# copy pub file
$ cat ~/.ssh/id_git_rsa.pub
```
paste in GitHub
[SSH and GPG keys](https://github.com/settings/keys)

```bash
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

## How to list all the files in a commit?
```bash
$ git diff-tree --no-commit-id --name-only -r bd61ad98
index.html
javascript/application.js
javascript/ie6.js

or

$ git show --pretty="" --name-only bd61ad98    
index.html
javascript/application.js
javascript/ie6.js
```

## Changing a commit message
https://help.github.com/articles/changing-a-commit-message/
```bash
git commit --amend
```

# branch

## show branch
```bash
git branch # To see local branches

git branch -r # To see remote branches

git branch -a # To see all local and remote branches
```

## create new local branch
```bash
git checkout -b BRANCH_NAME
# from remote branch
git checkout -b BRANCH_NAME origin/REMOTE_BRANCH_NAME

git branch
```

# Symbolic links in Git

```
シンボリックリンクの実体ファイルも
コミット対象に含める必要あり

#The reference path of the source file should be relative to the repository
# Not good for Git repositories
ln -s /Users/gio/repo/foo.md ./bar/foo.md

# Good for Git repositories
cd ./bar && ln -s ../foo.md foo.md
```

## delete branch

```sh
git branch -D BRANCH_NAME
```




## How to see your commit history in Git:

- This command shows the commit history for the current repository:

```sh
git log
```

## default

```sh
commit xxxxxxxxxxxxxxxxxxx (HEAD -> main)
Author: xxxxxxxxxxxxxx
Date:   xxxxxxxxxxxx

    4th commit

commit xxxxxxxxxxx
Author: xxxxxxxxx
Date:   xxxxxx

    3rd commit

commit xxxxxxxxxxx
Author: xxxxxxxxx
Date:   xxxxxx

    2nd commit

commit xxxxxxxxxxx
Author: xxxxxxxxx
Date:   xxxxxx

    1st commit
```


# git reset

```sh

$ git log # check the hash
commit abcdef**********

$ git reset --hard abcdef**********
```
