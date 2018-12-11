# chrome snippets

# shortcut

https://developers.google.com/web/tools/chrome-devtools/shortcuts?hl=en

## (Mac)Opens the Search tab in the Drawer, which lets you search for text across all loaded resources
```
Command+Option+F
```

## (Mac)Toggle Device Mode
```
Command+Shift+M

このショートカットを使用するには、マウスのフォーカスが DevTools ウィンドウにある必要があります
```


# Console API
http://anti-code.com/devtools-cheatsheet/#console-api

## console.log()
```js
var str = "string";
var num = 123;
var flo = 9.87;
console.log('String: %s', str);
console.log('Number: %d', num);
console.log('Float: %f', flo);

var url = "http://example.com/"
var sty = 'color:#fff;background:#000;';
console.log('Link: %o', url);
console.log('%c: stylish output', sty);
```

## console.table()
```js
console.table([{a:1, b:2, c:3}, {a:"foo", b:false, c:undefined}]);
console.table([[1,2,3], [2,3,4]]);
```
<img src="https://i.gyazo.com/e4cc362643535a26f61ec8cb511455cc.png">


# Command Line API

## $$
```js
# all form input attribute dump
console.log(
  $$('input').map(
    x=>'input'
    + ',type=' + x.type
    + ',name=' + x.name
    + ',id=' + x.id
    + ',class=' + x.class
    + ',value=' + x.value
    + ',style=' + x.style
    + ',placeholder=' + x.placeholder
  ).join('\n')
)
```




# config

# how to make extension

## sample dir
```
.
└── src
     ├── main.js
     └── manifest.json
```

# manifest.json
```json
{
  "name": "Sample",
  "version": "1.0.0",
  "manifest_version": 2,
  "description": "Sample Chrome Extension",
  "content_scripts": [{
    "matches": ["https://domain.com/k/*"],
    "js": [
      "main.js"
    ]
  }]
}
```

# main.js
```javascript
window.alert('hello world');
```





