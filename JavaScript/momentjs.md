# link
http://momentjs.com/

# use
```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ja.js"></script>
<script>
    moment().format();
</script>
```

# format

https://momentjs.com/docs/#/parsing/string-format/

```js
moment().format("YYYY-MM-DD HH:mm");
//"2019-05-31 22:57"
moment().format("YYYYMMDD_HHmm");
//"20190531_2258"
```

# diff

```js
//n days ago

//7 days ago
moment().add(-7, 'days').format('YYYYMMDD');
//"20190530"

```

