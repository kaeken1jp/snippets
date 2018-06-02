# google_apps_script snippets

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
