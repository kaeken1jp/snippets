# PHP7 to ES7 syntax translator

[babel-preset-php - npm](https://www.npmjs.com/package/babel-preset-php)

## sample

```php
define('FOO', max(floatval($c), strlen("foo")));
$bar['x'][][$b] = json_encode(__FILE__);
class Foo extends Bar\Baz {
  var $z = "hello" . "world";
  function __construct($some = array(7)) {
    parent::__construct(func_get_args());
    self::${$k} = "{$this->z[10]}";
  }
}
```

```js
const FOO = Math.max(+c, "foo".length);
bar.x.push({[b]: JSON.stringify(__filename)});
class Foo extends Bar.Baz {
  constructor(some = [7]) {
    super(arguments);
    this.z = "hello" + "world";
    this.constructor[k] = `${this.z[10]}`;
  }
}
```

