

# post()

[jQuery.post() | jQuery API Documentation](https://api.jquery.com/jQuery.post/)


# selector

[jQuery Selectors](https://www.w3schools.com/jquery/jquery_ref_selectors.asp)

[Try jQuery Selector](https://www.w3schools.com/jquery/trysel.asp)

## example

```js
// remove li tag / containing 'abc' string
$("li:contains('abc')").remove();

// update a tag(href, text) / containing 'abc' string
$("a:contains('abc')").attr("href", "/foo/bar.png").text('def');
```


# change link

```js
$("SELECTOR").attr("href", "http://example.com/")
```

# important

```js
//$('SELECTOR').css('text-transform', 'lowercase !important'); // NG
$('SELECTOR').css({'cssText': 'text-transform: lowercase !important;'}); // OK
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

# change attr href

```html
<a id="mylink" href="#">example</a>
```

```js
$("#mylink").attr("href", "http://example.com/")
```


# change Pseudo elements

```html
<style id='stylesheet' type='text/css'></style>
```

```js
$("style").html('#red:before{color:red;}');
$("#stylesheet").html('#red:before{color:red;}');
```

cf. [jQueryでcssの「:before」、「:after」などの疑似要素のstyleを変更させる方法 | webデザインメモ](https://mugenweb-note.com/web/css/before-jquery)



# chain

```js
$(".class1")
  .css("color","red")
  .text("foo");
```

# css

```js
$(".class1")
  .css({
    "color":"red", 
    "font-size":"10px"
  });
```

# selector

```js
var $s = $(".class1 tag2 #id3");
$s.f1($s.f2());
```

