# python_pandas snippets

## csv2df
```python
df = pd.read_csv(infile, sep=',')
header = df.columns
```

## tsv2df
```python
df = pd.read_csv(infile, sep='\t')
header = df.columns
```
