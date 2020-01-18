[nodemon - npm](https://www.npmjs.com/package/nodemon)

# install

```sh
npm install -g nodemon
```

# help

```sh
$ nodemon -h
  Usage: nodemon [options] [script.js] [args]

  Options:

  --config file ............ alternate nodemon.json config file to use
  -e, --ext ................ extensions to look for, ie. js,pug,hbs.
  -x, --exec app ........... execute script with "app", ie. -x "python -v".
  -w, --watch path.......... watch directory "path" or files. use once for
                             each directory or file to watch.
  -i, --ignore ............. ignore specific files or directories.
  -V, --verbose ............ show detail on what is causing restarts.
  -- <your args> ........... to tell nodemon stop slurping arguments.

  Note: if the script is omitted, nodemon will try to read "main" from
  package.json and without a nodemon.json, nodemon will monitor .js, .mjs, .coffee,
  .litcoffee, and .json by default.

  For advanced nodemon configuration use nodemon.json: nodemon --help config
  See also the sample: https://github.com/remy/nodemon/wiki/Sample-nodemon.json

  Examples:

  $ nodemon server.js
  $ nodemon -w ../foo server.js apparg1 apparg2
  $ nodemon --exec python app.py
  $ nodemon --exec "make build" -e "styl hbs"
  $ nodemon app.js -- --config # pass config to app.js

  All options are documented under: nodemon --help options
```

# how to use


```sh
# js file
$ cat hoge.js
console.log('hoge 1');

$ nodemon ./hoge.js localhost 8080
[nodemon] 2.0.2
[nodemon] to restart at any time, enter `rs`
[nodemon] watching dir(s): *.*
[nodemon] watching extensions: js,mjs,json
[nodemon] starting `node ./hoge.js localhost 8080`
hoge 1
[nodemon] clean exit - waiting for changes before restart

# update js file
$ cat hoge.js
console.log('hoge 2');

[nodemon] restarting due to changes...
[nodemon] starting `node ./hoge.js localhost 8080`
hoge 2
[nodemon] clean exit - waiting for changes before restart
```



