# macos snippets

## Show/Hide Hidden Files on macOS
```bash
# Show
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# Hide
defaults write com.apple.finder AppleShowAllFiles FALSE
killall Finder
```

## how to install homebrew

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
cf.https://brew.sh/

## how to convert image format

```bash
$ brew install imagemagick
$ convert file.jpeg file.png

```

## how to install nkf

```bash
$ brew install nkf

$ which nkf
/usr/local/bin/nkf

$ nkf --version
Network Kanji Filter Version 2.1.4 (2015-12-12)
Copyright (C) 1987, FUJITSU LTD. (I.Ichikawa).
Copyright (C) 1996-2015, The nkf Project.
```


## iCloud Drive location
```bash
ls ~/Library/Mobile\ Documents/com~apple~CloudDocs
```

## change default save location of screenshots
```bash
defaults write com.apple.screencapture location "<PATH>"
killall SystemUIServer

# example
defaults write com.apple.screencapture location "~/Library/Mobile\ Documents/com~apple~CloudDocs"
killall SystemUIServer
```
