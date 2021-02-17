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

# v-model

- two way data binding (to UI)

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

- output

![](https://i.gyazo.com/a6023f2d206e5671febc211fe6575c13.png)


# v-for

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
    <h1>My Todos</h1>
    <ul>
      <li v-for="todo in todos">{{ todo }}</li>
    </ul>
    <form>
      <input type="text">
      <input type="submit" value="Add">
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <script src="js/main.js"></script>
</body>
</html>
```

```js
(function() {
  'use strict';

  var vm = new Vue({
    el: '#app',
    data: {
      todos: [
        'task 1',
        'task 2',
        'task 3'
      ]
    }
  });
})();
```

- output

![](https://i.gyazo.com/39cbaa985a1dbf188a3bdd989da02698.png)




# v-on


```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>My Vue App</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>

  <div id="app" class="container">
    <h1>My Todos</h1>
    <ul>
      <li v-for="todo in todos">{{ todo }}</li>
    </ul>
    <!-- <form v-on:submit="addItem"> -->
    <form @submit.prevent="addItem">
      <input type="text" v-model="newItem">
      <input type="submit" value="Add">
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <script src="js/main.js"></script>
</body>
</html>
```

```js
(function() {
  'use strict';

  var vm = new Vue({
    el: '#app',
    data: {
      newItem: '',
      todos: [
        'task 1',
        'task 2',
        'task 3'
      ]
    },
    methods: {
      // addItem: function(e) {
      //   e.preventDefault();
      //   this.todos.push(this.newItem);
      // }
      addItem: function() {
        this.todos.push(this.newItem);
        this.newItem = '';
      }
    }
  });
})();
```

- output

![](https://i.gyazo.com/874aab11213a78c4a2e1f54395657f4d.gif)
