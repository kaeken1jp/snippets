# chrome snippets

# shortcut

https://developers.google.com/web/tools/chrome-devtools/shortcuts?hl=en

## (Mac)Opens the Search tab in the Drawer, which lets you search for text across all loaded resources
```
Control+Shift+F
```

# config

# how to make extension

## sample dir
```
.
└── src
     ├── main.js
     └── manifest.json
```

# manifest.json
```json
{
  "name": "Sample",
  "version": "1.0.0",
  "manifest_version": 2,
  "description": "Sample Chrome Extension",
  "content_scripts": [{
    "matches": ["https://domain.com/k/*"],
    "js": [
      "main.js"
    ]
  }]
}
```

# main.js
```javascript
window.alert('hello world');
```





