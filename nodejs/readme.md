https://nodejs.org/en/

# cheat sheet

http://overapi.com/nodejs

https://nodejs.org/en/docs/

https://gist.github.com/LeCoupa/985b82968d8285987dc3



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
