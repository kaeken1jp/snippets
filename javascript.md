# javascript snippets

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


## http/https flag
```javascript
  <script>
  if( (window.location.hostname == '__DOMAIN_NAME__') & (window.location.protocol != 'https:') ) {
    location.href = location.href.replace("http://", "https://");
  }
  </script>
```

## location hostname, port
```javascript
<script>
domain = document.domain;
alert(domain);
hostname = window.location.hostname;
alert(hostname);
port = window.location.port;
alert(port);
host_port = window.location.host;
alert(host_port);
href = window.location.href;
alert(href);
</script>
```

## location hash
```javascript
<script src="./jquery-3.3.1.min.js"></script>
<script>
$(function(){
  var params={};
  window.location.search
    .replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,key,value) {
      params[key] = value;
    }
  );

});
</script>
```

## replace src
```javascript
$("#img_id").attr("src", str);
```

## filter distinct object
```javascript
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
```javascript
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


## scroll window
```javascript
window.scrollTo(x, y) // pixel

ex)
window.scrollTo(0, 400); 
```


## check speed
```javascript
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

# encrypto

js暗号化/復号化

wwwtyro/cryptico: An easy-to-use encryption system utilizing RSA and AES for javascript. https://github.com/wwwtyro/cryptico

JavaScriptで RSA 公開鍵による暗号化、復号化が出来るライブラリ「cryptico.js」 | Web活メモ帳 https://blog.verygoodtown.com/2011/09/generating-an-rsa-key-pair-public-key-string/

crypticoでPure JavaScriptによる公開鍵暗号を用いるメモ - Qiita https://qiita.com/miyanaga/items/8692d0742a49fb37a6da

Node.jsで公開鍵暗号方式を使う - Qiita https://qiita.com/wf9a5m75/items/07a9794c9c569c10cfab



## object 空判定
```js
return !Object.keys(obj).length;
```
 
 
 
