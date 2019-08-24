# linux snippets

## Switch back to the last working directory
```bash
$ cd -
```

```bash
$ pwd
/root

$ cd /

$ pwd
/

$ cd -
/root

$ pwd
/root
```

## how to file or directory count
```bash
$ rsync --stats --dry-run -ax DIR_NAME/ /DUMMY

e.g.
$ rsync --stats --dry-run -ax python_scikit-learn_example/ /DUMMY

Number of files: 11
Number of files transferred: 10
Total file size: 28232 bytes
Total transferred file size: 28232 bytes
Literal data: 0 bytes
Matched data: 0 bytes
File list size: 368
File list generation time: 0.001 seconds
File list transfer time: 0.000 seconds
Total bytes sent: 410
Total bytes received: 45

sent 410 bytes  received 45 bytes  910.00 bytes/sec
total size is 28232  speedup is 62.05 (DRY RUN)
````

## Recursively list all hidden files and directories on Linux/Unix
```bash
# The basic syntax is as follows:
find /dir/to/search/ -name ".*" -print
find /dir/to/search/ -name ".*" -ls

# Search only hidden files:
find /dir/to/search/ -type f -iname ".*" -ls

# Search only hidden directories:
find /dir/to/search/ -type d -iname ".*" -ls

# Use find command as follows:
find /dir/to/search -path '*/.*' -print
find /dir/to/search -path '*/.*' -ls
```
