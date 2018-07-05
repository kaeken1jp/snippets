# javascript snippets

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
