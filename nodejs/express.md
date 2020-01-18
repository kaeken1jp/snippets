[Express - Node.js web application framework](https://expressjs.com/)

# install

```sh
$ npm install -g express
$ npm install express-generator -g
```

# version & help

```sh
$ express --version
4.16.1

$ express -h

  Usage: express [options] [dir]

  Options:

        --version        output the version number
    -e, --ejs            add ejs engine support
        --pug            add pug engine support
        --hbs            add handlebars engine support
    -H, --hogan          add hogan.js engine support
    -v, --view <engine>  add view <engine> support (dust|ejs|hbs|hjs|jade|pug|twig|vash) (defaults to jade)
        --no-view        use static html instead of view engine
    -c, --css <engine>   add stylesheet <engine> support (less|stylus|compass|sass) (defaults to plain css)
        --git            add .gitignore
    -f, --force          force on non-empty directory
    -h, --help           output usage information
```

# make app template

```sh
$ express [app name]

$ express sample
$ ls sample/
app.js		package.json	routes
bin		public		views

$ cd sample
$ npm install
```

# start app

```sh
npm start
open http://localhost:3000/
```

# make app

```sh
$ mkdir myapp & cd myapp
$ npm install express

$ vi app.js
$ cat app.js
var express = require('express'),
    app = express();

//app.use(app.router);

app.get('/', function(req, res) {
    res.send('hello world');
});
app.get('/about', function(req, res) {
    res.send('about this page!');
});

app.listen(3000);
console.log("server starting...");

$ node app & open http://localhost:3000/
server starting...
```

# cf. Error: listen EADDRINUSE :::

```sh
killall -9 node
```

# req.params

```js
var express = require('express'),
    app = express();

app.get('/users/:name?', function(req, res) {
    if (req.params.name) {
        res.send('hello, ' + req.params.name);
    } else {
        res.send('hello, nobody!');
    }
});
app.get('/items/:id([0-9]+)', function(req, res) {
    res.send('item no: ' + req.params.id);
});

app.listen(3000);
console.log("server starting...");
```

# restart

```sh
$ killall -9 node ; node app & open http://localhost:3000/users/hoge
```


# res.sendfile / express.static

```js
var express = require('express'),
    app = express();

// multi files
app.use(express.static(__dirname + '/public'));

// one file
app.get('/hello.txt', function(req, res) {
    res.sendfile(__dirname + '/public/hello.txt');
});

app.listen(3000);
console.log("server starting...");
```

# make custom middleware / express.logger

```js
var express = require('express'),
    app = express();

// middleware
app.use(express.logger('dev'));
app.use(app.router);
app.use(express.static(__dirname + '/public'));
app.use(function(req, res, next) {
    console.log('my custom middleware !');
    next();
});

app.get('/hello.txt', function(req, res) {
    res.send('hello from app.js');
});

app.listen(3000);
console.log("server starting...");
```

