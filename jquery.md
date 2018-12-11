# jquery snippets

## selector

[jQuery Selectors](https://www.w3schools.com/jquery/jquery_ref_selectors.asp)

[Try jQuery Selector](https://www.w3schools.com/jquery/trysel.asp)

## important

```javascript
$('SELECTOR').css({'cssText': 'text-transform: lowercase !important;'});
```

## Chrome console a href list up
```js
$$('a').map(x=>x.href).join('\n')
```

## Chrome console span innerText list up
```js
$$('span').map(x=>x.innerText).join('\n')
```

## Chrome console form element dump
```js
console.log($$('input').map(x=>'type=' + x.type + ',name=' + x.name + ',id=' + x.id + ',value=' + x.value).join('\n'))
```
