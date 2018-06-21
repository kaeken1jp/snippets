# python_networkx snippets

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






