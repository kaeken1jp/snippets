# python_matplotlib snippets

## setting backend
```python
import matplotlib.pyplot as plt
plt.switch_backend('agg')
```

## save file
```python
plt.savefig('file.png')
```

# chart

## bubble chart
```python
# libraries
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
 
# create data
x = np.random.rand(15)
y = x+np.random.rand(15)
z = x+np.random.rand(15)
z=z*z
 
# Change color with c and alpha. I map the color to the X axis value.
plt.scatter(x, y, s=z*2000, c=x, cmap="Blues", alpha=0.4, edgecolors="grey", linewidth=2)
 
# Add titles (main and on axis)
plt.xlabel("the X axis")
plt.ylabel("the Y axis")
plt.title("A colored bubble plot")
 
plt.show()
```

## japanize

uehara1414/japanize-matplotlib: pip install して import するだけで matplotlib を日本語表示対応させる https://github.com/uehara1414/japanize-matplotlib


