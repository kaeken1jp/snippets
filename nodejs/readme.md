https://nodejs.org/en/

# cheat sheet

http://overapi.com/nodejs

https://nodejs.org/en/docs/

https://gist.github.com/LeCoupa/985b82968d8285987dc3

# cli
```js
$ node

> console.log(1)
1
undefined

> console.log('abc')
abc
undefined

> .help
.break    Sometimes you get stuck, this gets you out
.clear    Alias for .break
.editor   Enter editor mode
.exit     Exit the repl
.help     Print this help message
.load     Load JS from a file into the REPL session
.save     Save all evaluated commands in this REPL session to a file

> .exit
```


# console.log
```sh
$ cat console_log.js
console.log("Hello world!");

$ node console_log.js
Hello world!
```

# args

```sh
$ node test.js aaa bbb ccc ddd eee
```

```js
for(var i = 0;i < process.argv.length; i++){
  console.log("argv[" + i + "] = " + process.argv[i]);
}
```

```
argv[0] = node
argv[1] = /workspace/test.js
argv[2] = aaa
argv[3] = bbb
argv[4] = ccc
argv[5] = ddd
argv[6] = eee
```
