# python_pyfootball snippets

## install
```bash
pip install pyfootball
``

## sample
```python
import pyfootball
f = pyfootball.Football(api_key='your_api_key')
bayern = f.get_team(5)
bayern.market_value
```
