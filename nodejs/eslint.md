[ESLint - Pluggable JavaScript linter](https://eslint.org/)

# install

```sh
$ npm install -g eslint

$ eslint -v
v6.8.0
```

# config

```sh
./node_modules/.bin/eslint --init
```

# exec

## js file
```
$ cat test.js
function hello(name) {
    document.body.textContent = "Hello, " + nama + "!"
}

hello("World");

$ cat test2.js
function hello(name2) {
    document.body.textContent = "Hello, " + nama2 + "!"
}

hello("World");
```

## exec

```
$ eslint test.js

/path/to/test.js
  1:16  error  'name' is defined but never used  no-unused-vars
  2:45  error  'nama' is not defined             no-undef

✖ 2 problems (2 errors, 0 warnings)
```

```
$ eslint *

/path/to/test.js
  1:16  error  'name' is defined but never used  no-unused-vars
  2:45  error  'nama' is not defined             no-undef

/path/to/test2.js
  1:16  error  'name2' is defined but never used  no-unused-vars
  2:45  error  'nama2' is not defined             no-undef

✖ 4 problems (4 errors, 0 warnings)
```

## List of available rules

[List of available rules - ESLint - Pluggable JavaScript linter](https://eslint.org/docs/rules/)

## community (JP)

[eslint/eslint-jp - Gitter](https://gitter.im/eslint/eslint-jp)

## fix manually

```
$ eslint test.js && echo 'ok'
ok
```




