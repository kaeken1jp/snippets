# python_fbprophet snippets

## install
```bash
pip install fbprophet
```

## example
```python
# TODO debug

import pandas as pd
from fbprophet import Prophet

df = pd.read_csv('prophet/examples/example_wp_log_peyton_manning.csv')
res = df.head()
print(res)

m = Prophet()
m.fit(df)

future = m.make_future_dataframe(periods=365)
future.tail()

forecast = m.predict(future)
forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail()

fig1 = m.plot(forecast)
fig2 = m.plot_components(forecast)
```

