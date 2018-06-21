# python_networkx snippets

https://networkx.github.io/documentation/stable/index.html

## install
```bash
$ pip install networkx
$ pip install --upgrade networkx
$ pip freeze | grep networkx

#To install networkx and all optional packages, do:
$ pip install networkx[all]
$ pip install numpy scipy pandas matplotlib pygraphviz pydot pyyaml gdal
```


## Test an installed package
If you have a file-based (not a Python egg) installation you can test the installed package with:

```python
>>> import networkx as nx
>>> nx.test()
```

or:

```bash
python -c "import networkx as nx; nx.test()"
```

## sample plot
```python
import matplotlib.pyplot as plt
plt.switch_backend('agg')
import networkx as nx

G = nx.DiGraph()
G.add_path([3, 5, 4, 1, 0, 2, 7, 8, 9, 6])
G.add_path([3, 0, 6, 4, 2, 7, 1, 9, 8, 5])

nx.draw_networkx(G)
#plt.show()
plt.savefig('networkx_plot.png')
```




