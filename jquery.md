# jquery snippets

## selector

[jQuery Selectors](https://www.w3schools.com/jquery/jquery_ref_selectors.asp)

[Try jQuery Selector](https://www.w3schools.com/jquery/trysel.asp)

## important

```javascript
$('SELECTOR').css({'cssText': 'text-transform: lowercase !important;'});
```

# Ajax

## check link status
```js
function check_link_status(url) {
  $.ajax({
    type: "GET",
    url: url,
  }).done(function(data, textStatus, jqXHR){ 
  //console.log(jqXHR.status);
    //console.log("ok: "+url);
  }).fail(function(jqXHR, textStatus, errorThrown){
  //console.log(jqXHR.status);
    console.log("%c: NG: "+url, 'font-size:20px;color:#000;background:#ff0000;');
  });
}

$('a').each(function(i, elem) {
  if ( $(elem).attr('href').indexOf('http') != -1 ) {
    check_link_status($(elem).attr('href'));
  }
});
```
