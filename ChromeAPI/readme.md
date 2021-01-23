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
http://anti-code.com/devtools-cheatsheet/#command-line-api

## $$ (Returns an array of elements that match the given CSS selector.)
```js
# all body innerText
$$('body').map(x=>x.innerText).join('\n')

# all link href
$$('a').map(x=>x.href).join('\n')



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

# extract all href link
$$('.class_name > a').map(x=>x.href).join('\n')
```

## $0 (The currently-selected object in the inspector.)
## $_ (The previously evaluated statement)
## $1 (The previously-selected object in the inspector.)
## $n(index) (Access to an array of last 5 inspected elements.)
## dir(object) (Prints an interactive listing of all properties of the object. This looks identical to the view that you would see in the DOM tab.)
## dirxml(node) (Prints the XML source tree of an HTML or XML element. This looks identical to the view that you would see in the HTML tab. You can click on any node to inspect it in the HTML tab.)
## clear() (Clears the console.)
## copy() (Copies everything passed to it to the clipboard.)
## inspect(object[, tabName]) (Inspects an object in the most suitable tab, or the tab identified by the optional argument tabName.)
## keys(object) (Returns an array containing the names of all properties of the object.)
## values(object) (Returns an array containing the values of all properties of the object.)
## monitorEvents(object[, types]) (Turns on logging for all events dispatched to an object. The optional argument types may specify a specific family of events to log. The most commonly used values for types are "mouse" and "key". The full list of available types includes "composition", "contextmenu", "drag", "focus", "form", "key", "load", "mouse", "mutation", "paint", "scroll", "text", "ui", and "xul".)
## unmonitorEvents(object[, types]) (Turns off logging for all events dispatched to an object.)
## performance
## performance.timing
## performance.memory
## performance.navigation
## profile([title]) (Turns on the JavaScript profiler. The optional argument title would contain the text to be printed in the header of the profile report.)
## profileEnd() (Turns off the JavaScript profiler and prints its report.)



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



# Extension for dev

# Secure Shell

[Secure Shell App - Chrome ウェブストア](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo/related)

cf. chromium / apps / libapps / HEAD / . / nassh

[nassh - apps/libapps - Git at Google](https://chromium.googlesource.com/apps/libapps/+/HEAD/nassh)

# Edit This Cookie

# 


