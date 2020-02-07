https://webdriver.io/

# install

https://webdriver.io/docs/gettingstarted.html

```
You’ll need Node.js installed (at least v8.11.2 or higher). If you don't have Node installed, we recommend installing NVM to assist managing multiple active Node.js versions.
```

```sh
mkdir webdriverio-test && cd webdriverio-test
npm init -y

npm i --save-dev @wdio/cli

./node_modules/.bin/wdio config -y
```


# make test

```sh
mkdir -p ./test/specs

touch ./test/specs/basic.js
vi  ./test/specs/basic.js
```

```js
const assert = require('assert')

describe('webdriver.io page', () => {
    it('should have the right title', () => {
        browser.url('https://webdriver.io')
        const title = browser.getTitle()
        assert.strictEqual(title, 'WebdriverIO · Next-gen WebDriver test framework for Node.js')
    })
})
```

```sh
./node_modules/.bin/wdio wdio.conf.js
```



