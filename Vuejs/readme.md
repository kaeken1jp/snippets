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



# delete item


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
      <li v-for="(todo, index) in todos">
        {{ todo }}
        <span @click="deleteItem(index)" class="command">[x]</span>
      </li>
    </ul>
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
      addItem: function() {
        this.todos.push(this.newItem);
        this.newItem = '';
      },
      deleteItem: function(index) {
        if (confirm('are you sure?')) {
          this.todos.splice(index, 1);
        }
      }
    }
  });
})();
```

- output

![](https://i.gyazo.com/e5ab5d321910abd17d165ac2a6203bb9.gif)




# v-bind


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
      <li v-for="(todo, index) in todos">
        <input type="checkbox" v-model="todo.isDone">
        <!-- <span v-bind:class="{done: todo.isDone}">{{ todo.title }}</span> -->
        <span :class="{done: todo.isDone}">{{ todo.title }}</span>
        <span @click="deleteItem(index)" class="command">[x]</span>
      </li>
    </ul>
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
      todos: [{
        title: 'task 1',
        isDone: false
      }, {
        title: 'task 2',
        isDone: false
      }, {
        title: 'task 3',
        isDone: true
      }]
    },
    methods: {
      addItem: function() {
        var item = {
          title: this.newItem,
          isDone: false
        };
        this.todos.push(item);
        this.newItem = '';
      },
      deleteItem: function(index) {
        if (confirm('are you sure?')) {
          this.todos.splice(index, 1);
        }
      }
    }
  });
})();
```

- output

![](https://i.gyazo.com/19f1aec13656c7ca94f6bafb5aa4e411.gif)



# v-show, v-if


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
    <!-- <ul>
      <li v-for="(todo, index) in todos">
        <input type="checkbox" v-model="todo.isDone">
        <span :class="{done: todo.isDone}">{{ todo.title }}</span>
        <span @click="deleteItem(index)" class="command">[x]</span>
      </li>
      <li v-show="!todos.length">Nothing to do, yay!</li>
    </ul> -->
    <!-- <ul>
      <li v-if="todos.length" v-for="(todo, index) in todos">
        <input type="checkbox" v-model="todo.isDone">
        <span :class="{done: todo.isDone}">{{ todo.title }}</span>
        <span @click="deleteItem(index)" class="command">[x]</span>
      </li>
      <li v-else>Nothing to do, yay!</li>
    </ul> -->
    <ul v-if="todos.length">
      <li v-for="(todo, index) in todos">
        <input type="checkbox" v-model="todo.isDone">
        <span :class="{done: todo.isDone}">{{ todo.title }}</span>
        <span @click="deleteItem(index)" class="command">[x]</span>
      </li>
    </ul>
    <ul v-else>
      <li>Nothing to do, yay!</li>
    </ul>
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
      // todos: [{
      //   title: 'task 1',
      //   isDone: false
      // }, {
      //   title: 'task 2',
      //   isDone: false
      // }, {
      //   title: 'task 3',
      //   isDone: true
      // }]
      todos: []
    },
    methods: {
      addItem: function() {
        var item = {
          title: this.newItem,
          isDone: false
        };
        this.todos.push(item);
        this.newItem = '';
      },
      deleteItem: function(index) {
        if (confirm('are you sure?')) {
          this.todos.splice(index, 1);
        }
      }
    }
  });
})();
```

- output

![](https://i.gyazo.com/b4bcde3fc40bd5f738be0bf3e7e37cb5.gif)



# Computed Properties, Filter

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
    <h1>
      My Todos
      <span class="info">({{ remaining }}/{{ todos.length }})</span>
    </h1>
    <ul>
      <li v-for="(todo, index) in todos">
        <input type="checkbox" v-model="todo.isDone">
        <span :class="{done: todo.isDone}">{{ todo.title }}</span>
        <span @click="deleteItem(index)" class="command">[x]</span>
      </li>
      <li v-show="!todos.length">Nothing to do, yay!</li>
    </ul>
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
      todos: [{
        title: 'task 1',
        isDone: false
      }, {
        title: 'task 2',
        isDone: false
      }, {
        title: 'task 3',
        isDone: true
      }]
    },
    methods: {
      addItem: function() {
        var item = {
          title: this.newItem,
          isDone: false
        };
        this.todos.push(item);
        this.newItem = '';
      },
      deleteItem: function(index) {
        if (confirm('are you sure?')) {
          this.todos.splice(index, 1);
        }
      }
    },
    computed: {
      remaining: function() {
        var items = this.todos.filter(function(todo) {
          return !todo.isDone;
        });
        return items.length;
      }
    }
  });
})();
```

- output

![](https://i.gyazo.com/f1574ea973deeb8c854f944fc5d84574.gif)

