# python_numpy snippets

## random.choice()
```py
import numpy as np
fnc_name = np.random.choice(["A", "B", "C", "D"], p=[0.1, 0.2, 0.3, 0.4])
print('function name:', fnc_name)
eval(fnc_name)()
```

