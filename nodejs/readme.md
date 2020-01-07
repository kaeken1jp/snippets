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

# web server
```js
var http = require('http');
var server = http.createServer();
server.on('request', function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.write('hello world');
  res.end();
});
server.listen(1337, 'localhost'); // http://localhost:1377
console.log("server listening ...");
```

# settings

## setting file
```sh
$ cat settings.js
```

```js
exports.port = 1337;
exports.host = 'localhost';
```

## load setting file
```sh
$ cat http_and_settings.js
```

```js
var http = require('http');
var settings = require('./settings'); // load setting file
console.log(settings);
var server = http.createServer();
server.on('request', function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.write('hello world');
  res.end();
});
server.listen(settings.port, settings.host); // use setting data
console.log("server listening ...");
```

# control req.url

```js
var http = require('http');
var settings = require('./settings');
console.log(settings);
var server = http.createServer();
server.on('request', function(req, res) {
  switch (req.url) {
    case '/about':
      msg = "about this page";
      break;
    case  '/profile':
      msg = "about me";
      break;
    default:
      msg = "wrong page";
      break;
  }
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.write(msg);
  res.end();
});
server.listen(settings.port, settings.host);
console.log("server listening ...");
```


# read html file
```js
var http = require('http');
var fs = require('fs'); // fs module
var settings = require('./settings');
console.log(settings);
var server = http.createServer();
server.on('request', function(req, res) {
  // read file
  fs.readFile(__dirname + '/public/index.html', 'utf-8', function(err, data) {
    if (err) {
      res.writeHead(404, {'Content-Type': 'text/plain'});
      res.write('not found');
      return res.end();
    }
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
  });
});
server.listen(settings.port, settings.host);
console.log("server listening ...");
```

# use template

## install ejs

[snippets/npm.md at master · kaeken1jp/snippets](https://github.com/kaeken1jp/snippets/blob/master/nodejs/npm.md#ejs-embedded-javascript-templates)

## code





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
