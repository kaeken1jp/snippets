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


# exec node.js file
```sh
$ cat console_log.js
console.log("Hello world!");

$ node console_log.js
Hello world!
```

# non blocking process
```js
// non blocking
setTimeout(function() {
  console.log(1);
}, 1000);
console.log(2);
```

## result
```
2
1
```

# blocking process
```js
// blocking
var start = new Date().getTime();
console.log(1);
while (new Date().getTime() < start + 1000);
console.log(2);
```

## result
```
1
2
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
