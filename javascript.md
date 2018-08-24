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
