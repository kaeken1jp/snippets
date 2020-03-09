# falsy values
[Falsy - MDN Web Docs Glossary: Definitions of Web-related terms | MDN](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)

```
There are 7 falsy values in JavaScript.

false	The keyword false

0	The number zero

0n	BigInt, when used as a boolean, follows the same rule as a Number. 0n is falsy.

"", '', ``	
This is an empty string (the length of the string is zero).
Strings in JavaScript can be defined with double quotes "", single quotes '', or Template literals ``.

null	null - the absence of any value

undefined	undefined - the primitive value

NaN	NaN - not a number
```

# operate list / push,pop,shift,unshift

```
var a = [1, 2, 3];                                                                                                                                                                                          
var b = a.unshift(0);
console.log(a); //[0, 1, 2, 3]
console.log(b); //4（amount of element）

var a = [1, 2, 3];
var b = a.shift();
console.log(a); //[2, 3]
console.log(b); //1

var a = [1, 2, 3];
var b = a.pop();
console.log(a); //[1, 2]
console.log(b); //3

var a = [1, 2, 3];
var b = a.push(4);
console.log(a); //[1, 2, 3, 4]
console.log(b); //4（amount of element）
```


# timestamp

```js
var ts = Math.round((new Date()).getTime() / 1000);
```

# ts format

```js
var timestamp = 1301090400,
date = new Date(timestamp * 1000),
datevalues = [
   date.getFullYear(),
   date.getMonth()+1,
   date.getDate(),
   date.getHours(),
   date.getMinutes(),
   date.getSeconds(),
];
alert(datevalues); //=> [2011, 3, 25, 23, 0, 0]
```


# URI encode / decode

```js
// encodeURI は、「:」、「/」、「;」、「?」の各文字はエンコードせず
encodeURI(string) / decodeURI(string) 

// encodeURIComponent は、「:」、「/」、「;」、「?」の各文字はエンコードする
encodeURIComponent(string) / decodeURIComponent(string)
```


# delete falsy elements

```js
var arr = [1, "a", true, null, undefined, 0, "", false];

var new_arr = arr.filter(function(x){
	return !(x === null || x === undefined || x === false || x === ""); 
})

console.log(new_arr); //=> [1, "a", true, 0]


// delete falsy elements
var new_arr2 = arr.filter(Boolean);

console.log(new_arr2); //=> [1, "a", true]
```

# Cookie read/write
```js
# write
document.cookie = "key=1";

# read
var str = document.cookie;

# read all
//cookie値を連想配列として取得する
function getCookieArray(){
  var arr = new Array();
  if(document.cookie != ''){
    var tmp = document.cookie.split('; ');
    for(var i=0;i<tmp.length;i++){
      var data = tmp[i].split('=');
      arr[data[0]] = decodeURIComponent(data[1]);
    }
  }
  return arr;
}

var arr = getCookieArray();
var result = arr["key"];

```


## sessionStorage

```js
// convert int to string at sessionStorage
sessionStorage.setItem("key1", 1);
var val1 = sessionStorage.getItem("key1");
console.log(typeof val1);//=> string
```

## http/https flag

```js
  if( (window.location.hostname == '__DOMAIN_NAME__') & (window.location.protocol != 'https:') ) {
    location.href = location.href.replace("http://", "https://");
  }
```

## location data

```
http://www.htmq.com:8000/js/index.php?q=javascript#link
↓↓↓
location.hrefは「http://www.htmq.com:8000/js/index.php?q=javascript#link」
location.protocolは「http:」
location.hostnameは「www.htmq.com」
location.hostは「www.htmq.com:8000」
location.portは「8000」
location.pathnameは「/js/index.php」
location.searchは「?q=javascript」
location.hashは「#link」
```

## replace src

```js
$("#img_id").attr("src", str);
```

## filter distinct object

```js
function distinct(fieldNames) {
  var self = this;
  return function(item, i, arr) {
    return i == indexOf(arr, item, equalsAllFields)
  }

  function indexOf(arr, obj, comparator) {
    for(var index in arr) {
      if(comparator(obj, arr[index]) == true) return index;
    }
    return -1;
  }

  function equalsAllFields(a, b) {
    for(var i in fieldNames) {
      var f = fieldNames[i];
      if(a[f] !== b[f]) return false;
    }
    return true;
  }
}

var data = [ 
  { keyword: 'hoge', url: 'example.com', ts: 1 },
  { keyword: 'hoge', url: 'example.net', ts: 2 },
  { keyword: 'fuga', url: 'example.net', ts: 3 },
  { keyword: 'hoge', url: 'example.com', ts: 4 } 
];

data.filter(distinct(["keyword"]))
// 0: {keyword: "hoge", url: "example.com", ts: 1}
// 1: {keyword: "fuga", url: "example.net", ts: 3}

data.filter(distinct(["keyword","url"]))
// 0: {keyword: "hoge", url: "example.com", ts: 1}
// 1: {keyword: "hoge", url: "example.net", ts: 2}
// 2: {keyword: "fuga", url: "example.net", ts: 3}

data.filter(distinct(["keyword","url","ts"]))
// 0: {keyword: "hoge", url: "example.com", ts: 1}
// 1: {keyword: "hoge", url: "example.net", ts: 2}
// 2: {keyword: "fuga", url: "example.net", ts: 3}
// 3: {keyword: "hoge", url: "example.com", ts: 4}

```


## search object

```js
var pre_obj = [ 
  { keyword: 'hoge', url: 'example.com', ts: 1 },
  { keyword: 'hoge', url: 'example.net', ts: 2 },
  { keyword: 'fuga', url: 'example.net', ts: 3 },
  { keyword: 'hoge', url: 'example.com', ts: 4 } 
];
var post_obj = pre_obj.filter(function(item, index) {
  if ((item.keyword).indexOf('hoge') >= 0) {
    return true;
  }
});
//post_obj
//0: {keyword: "hoge", url: "example.com", ts: 1}
//1: {keyword: "hoge", url: "example.net", ts: 2}
//2: {keyword: "hoge", url: "example.com", ts: 4}

```

## clone object

```js
var firstObj = ["a", "b", "c"];
var sameObj = firstObj;
sameObj.push("d");
console.log(sameObj); //= ["a", "b", "c", "d"]
console.log(firstObj); //= ["a", "b", "c", "d"]

var firstObj = ["a", "b", "c"];
var newObj = firstObj.slice(); // clone object
newObj.push("d");
console.log(newObj); //= ["a", "b", "c", "d"]
console.log(firstObj); //= ["a", "b", "c"]
```



## scroll window

```js
window.scrollTo(x, y) // pixel

ex)
window.scrollTo(0, 400); 
```


## check speed

```js
// console.time
console.time("loop time");
for(var i =0; i < 1000000000; i++){}
console.timeEnd("loop time");
// => loop time: 2409.7939453125ms

//performance.now()
var startTime = performance.now();
for(var i =0; i < 1000000000; i++){}
var endTime = performance.now();
console.log(endTime - startTime);
// => 2406.4999999827705

//performance.mark(), performance.measure()
performance.mark('myPerformanceStart')
for(var i =0; i < 1000000000; i++){}
performance.mark('myPerformanceEnd')

performance.measure(
    'myPerformance', // 計測名
    'myPerformanceStart', // 計測開始点
    'myPerformanceEnd' // 計測終了点
);

const results = performance.getEntriesByName('myPerformance');
console.log(results[0]);
/* => duration: 2411.8000000016764
entryType: "measure"
name: "myPerformance"
startTime: 1011144.2999999854
*/


//(deprecated)Date.now()
var startTime = Date.now();
for(var i =0; i < 1000000000; i++){}
var endTime = Date.now();
console.log(endTime - startTime);
// => 2389

```

cf. 

[パフォーマンスまわりのAPIについて \- Qiita](https://qiita.com/makotot/items/70bd392a62afd43d3189)


# Promise

## Promise.all()

```js
var p1 = Promise.resolve(3);
var p2 = 1337;
var p3 = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("foo");
  }, 100);
}); 

Promise.all([p1, p2, p3]).then(values => { 
  console.log(values); // [3, 1337, "foo"] 
});
```

## Promise loop

```js
function doSomething(elem) {
  console.log(elem);
}

function loopPromise(arr) {
  return arr.reduce(function(promise, elem) {
      return promise.then(function() {
          return doSomething(elem);
      });
  }, Promise.resolve());
}

var ary = [1,2,3];

loopPromise(ary).then(function() {
    console.log('all done');
});
```


# encrypto

js暗号化/復号化

wwwtyro/cryptico: An easy-to-use encryption system utilizing RSA and AES for javascript. https://github.com/wwwtyro/cryptico

JavaScriptで RSA 公開鍵による暗号化、復号化が出来るライブラリ「cryptico.js」 | Web活メモ帳 https://blog.verygoodtown.com/2011/09/generating-an-rsa-key-pair-public-key-string/

crypticoでPure JavaScriptによる公開鍵暗号を用いるメモ - Qiita https://qiita.com/miyanaga/items/8692d0742a49fb37a6da

Node.jsで公開鍵暗号方式を使う - Qiita https://qiita.com/wf9a5m75/items/07a9794c9c569c10cfab



# object 空判定

```js
return !Object.keys(obj).length;
```
 
# array 配列
## 重複を除外

```js
var distinctArrayData = Array.from(new Set(duplicatedArrayData));
```

# get Last N day

```js
function getLastNDay(n) {
  var date = new Date();
  date.setDate(date.getDate() - n);
  var y = date.getFullYear();
  var m = date.getMonth() + 1;
  var d = date.getDate();
  m = ('0' + m).slice(-2);
  d = ('0' + d).slice(-2);
  return y + m + d;
}
getLastNDay(1); // 20190101
```

# promise & loop

```js
// ループ処理の完了を受け取るPromise
new Promise(function(res, rej) {
  // ループ処理（再帰的に呼び出し）
  function loop(i) {
    // 非同期処理なのでPromiseを利用
    return new Promise(function(resolve, reject) {
      // 非同期処理部分
      setTimeout(function() {
        console.log(i);
        // resolveを呼び出し
        resolve(i+1);
      }, 100);
    })
    .then(function(count) {
      // ループを抜けるかどうかの判定
      if (count > 10) {
        // 抜ける（外側のPromiseのresolve判定を実行）
        res();
      } else {
        // 再帰的に実行
        loop(count);
      }
    });
  }
  // 初回実行
  loop(0);
}).then(function() {
  // ループ処理が終わったらここにくる
  console.log("Finish");
})
```
 


# isJSON()

```js

var isJSON = function(arg) {
    arg = (typeof arg === "function") ? arg() : arg;
    if (typeof arg  !== "string") {
        return false;
    }
    try {
    arg = (!JSON) ? eval("(" + arg + ")") : JSON.parse(arg);
        return true;
    } catch (e) {
        return false;
    }
};
```

# json str to obj

```js
var json_str = '{ "name":"John", "age":30, "city":"New York"}';
var obj = JSON.parse(json_str);
```

# obj to json str

```js
var obj = { name: "John", age: 30, city: "New York" };
var json_str = JSON.stringify(obj);
```

# foreach / object

```js
$.each(object, function(index, value) {
    console.log(value);
}); 
```

```js
num_list = ['a','b','c'];
$.each(num_list, function(i, e) {
  console.log(i);
  console.log(e);
});
```

```
0
a
1
b
2
c
```



# trim

```js
function trim(s){ 
  return ( s || '' ).replace( /^\s+|\s+$/g, '' ); 
}
```

# delete whitespace & newline

## pre
```js
$('#q1').text()
```

- result
```
"
                        Q1
                        abc?
                        
                    
                    
                        a1
			a2
			a3
                    
                "
```

## post

```js
$('#q1').text().replace(/\s+/g, '');
```

- result
```
"Q1abc?a1a2a3"
```


# ternary operator

```js
var flag = 'dev';
var file_name = 'file' + ((flag == 'dev') ? '_dev' : '') + '.ext';
```

