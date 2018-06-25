# python_football-data.org snippets

## sample
```python
import http.client
import json

api_key = 'API_KEY'
connection = http.client.HTTPConnection('api.football-data.org')
headers = { 'X-Auth-Token': api_key, 'X-Response-Control': 'minified' }
connection.request('GET', '/v1/competitions', None, headers )
response = json.loads(connection.getresponse().read().decode())

print (response)
```
