# linux snippets

## Switch back to the last working directory
```bash
cd -
```

```bash
# pwd
/root
# cd /
# pwd
/
# cd -
/root
# pwd
/root
```

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
