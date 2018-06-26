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

## Examples
```python
# Read and write graphs

import sys

import matplotlib.pyplot as plt
import networkx as nx

G = nx.grid_2d_graph(5, 5)  # 5x5 grid
try:  # Python 2.6+
    nx.write_adjlist(G, sys.stdout)  # write adjacency list to screen
except TypeError:  # Python 3.x
    nx.write_adjlist(G, sys.stdout.buffer)  # write adjacency list to screen
# write edgelist to grid.edgelist
nx. write_edgelist(G, path="grid.edgelist", delimiter=":")
# read edgelist from grid.edgelist
H = nx.read_edgelist(path="grid.edgelist", delimiter=":")

nx.draw(H)
plt.show()
```

```python
# Compute some network properties for the lollipop graph.

import matplotlib.pyplot as plt
from networkx import nx

G = nx.lollipop_graph(4, 6)

pathlengths = []

print("source vertex {target:length, }")
for v in G.nodes():
    spl = dict(nx.single_source_shortest_path_length(G, v))
    print('{} {} '.format(v, spl))
    for p in spl:
        pathlengths.append(spl[p])

print('')
print("average shortest path length %s" % (sum(pathlengths) / len(pathlengths)))

# histogram of path lengths
dist = {}
for p in pathlengths:
    if p in dist:
        dist[p] += 1
    else:
        dist[p] = 1

print('')
print("length #paths")
verts = dist.keys()
for d in sorted(verts):
    print('%s %d' % (d, dist[d]))

print("radius: %d" % nx.radius(G))
print("diameter: %d" % nx.diameter(G))
print("eccentricity: %s" % nx.eccentricity(G))
print("center: %s" % nx.center(G))
print("periphery: %s" % nx.periphery(G))
print("density: %s" % nx.density(G))

nx.draw(G, with_labels=True)
plt.show()
```


