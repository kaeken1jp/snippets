# chrome snippets

# shortcut

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





