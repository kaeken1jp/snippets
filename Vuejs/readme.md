[Vue.js](https://vuejs.org/)


[Vue CLI](https://cli.vuejs.org/)

# install Vue CLI

[Vue CLI](https://cli.vuejs.org/)

```sh
npm install -g @vue/cli

npm install -g @vue/cli-service-global

```

# create a project

```sh
vue create my-project
# OR
vue ui
```


# first vue app

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>My Vue App</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <script src="js/main.js"></script>
</body>
</html>
```

```js
(function() {
  'use strict';
})();
```

# two way data binding (to UI)

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>My Vue App</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>

  <div id="app">
    <p>Hello {{ name }}!</p>
    <!-- <p>Hello {{ name.toUpperCase() }}!</p> -->
    <p><input type="text" v-model="name"></p>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <script src="js/main.js"></script>
</body>
</html>
```

```js
(function() {
  'use strict';

  // two way data binding (to UI)

  var vm = new Vue({
    el: '#app',
    data: {
      name: 'username1'
    }
  });
})();
```
