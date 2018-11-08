# javascript snippets

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


