# python_datausa snippets

https://datausa.io/

## api sample

```python
import requests

url = "https://api.datausa.io/api/?show=geo&sumlevel=state&required=avg_wage"

json = requests.get(url).json()

data = [dict(zip(json["headers"], d)) for d in json["data"]]

print(data)
```
