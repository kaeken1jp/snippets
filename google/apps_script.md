# google_apps_script snippets


## popup
```javascript
function hello() {
  Browser.msgBox("Hello, World");
}
```

## prompt
```javascript
function helloWithPrompt() {
  var name = Browser.inputBox("Enter your name");
  Browser.msgBox("Hello, "+name);
}
```

## infinite loop
```javascript
function infLoop() {
  var a = [];
  while(true) a.push('evil!');
}
```

## search cc official URL from coinmarketcap.com
```javascript
function searchURL(cc_name) {
  var url = "https://coinmarketcap.com/currencies/" + cc_name + "/";
  var response = UrlFetchApp.fetch(url);
  var myRegexp = /<a href="(https?.+)" target="_blank" rel="noopener">Website<\/a>/i;
  var match = myRegexp.exec(response.getContentText());
  var result = match[1];
  Logger.log(result);
  return result
}

//searchURL("bitcoin");
```

## search meta-description tag from cc official website
```javascript
function searchDescription(url) {
  var response = UrlFetchApp.fetch(url);
  Logger.log(response);
  var myRegexp = /.*<meta *name=["']description["'] *content=["'](.+)["'].*\/?>.*/i;
  var match = myRegexp.exec(response.getContentText());
  var result = match[1];
  Logger.log(result);
  return result
}

//searchDescription("https://ripple.com/");
```


## GPT-3 and Google Sheets

- get api key

https://platform.openai.com/account/api-keys

- gas code

```js
/**
 * GPT-3 and Google Sheets
 *
 * @param {string} prompt Prompt.
 * @param {number} temperature (Optional) Temperature.
 * @param {string} model (Optional) GPT-3 Model.
 * @return Response returned by GPT-3.
 * @customfunction
 */
const SECRET_KEY = "";
//const MAX_TOKENS = 10;
const MODEL_NAME = "text-davinci-003"; // more structured and deterministic: for data
//const MODEL_NAME = "davinci"; // more flexible and creative: for stories, chatbots
const MODEL_TEMP = 0.3;

function GPT(prompt,max_tokens=30) {
  const url = "https://api.openai.com/v1/completions";
  const payload = {
    model: MODEL_NAME,
    prompt: prompt,
    temperature: MODEL_TEMP,
    //max_tokens: MAX_TOKENS,
    max_tokens: max_tokens
  };
  const options = {
    contentType: "application/json",
    headers: { Authorization: "Bearer " + SECRET_KEY },
    payload: JSON.stringify(payload),
  };
  const res = JSON.parse(UrlFetchApp.fetch(url, options).getContentText());
  return res.choices[0].text.trim();
}

```

- sheets function

```
=IF(ISBLANK($A2),,GPT("explain about "&$A2&" :",1000))
```

https://i.gyazo.com/4758d13ff4d307173414b0000ab38b1f.png


## random quiz

https://zenn.dev/r_ngtm/articles/00d04f6315d51efbd7a3

```js
// シートを開いたタイミングで実行
function onOpen(){
  var sheet = SpreadsheetApp.getActiveSpreadsheet(); // 現在開いているGoogleスプレッドシート
  var myMenu= [];
  myMenu.push({name: "出題", functionName: "showQuiz"}); // メニューへ項目の登録
  sheet.addMenu("クイズ", myMenu); // メニュー追加
}
// 問題をランダムに１つ選び、ポップアップとして出す
function showQuiz() { 
  const ui = SpreadsheetApp.getUi(); 
  const sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet(); // 現在開いているシート
  const lastRow = sheet.getLastRow(); // 最後の行
  const row = Math.floor((lastRow - 1) * Math.random()) + 2; // ランダム抽選  
  const range_question = sheet.getRange(row, 1); // セルの取得(問題)
  const range_answer = sheet.getRange(row, 2); // セルの取得(答え)
  
  // 問題を出す
  const response = ui.prompt("問題 " + (row - 1), range_question.getValue(), ui.ButtonSet.OK);
  // OKを押したら答えを出す
  const response_complete = ui.alert(
    "答え", 
    "【問題】\n" + range_question.getValue() + "\n\n【入力】\n" + response.getResponseText() + "\n\n【答え】\n" + range_answer.getValue(), ui.ButtonSet.OK);
}
```


