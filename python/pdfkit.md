[pdfkit · PyPI](https://pypi.org/project/pdfkit/)

# install wkhtmltopdf

[snippets/wkhtmltopdf.md at master · kaeken1jp/snippets](https://github.com/kaeken1jp/snippets/blob/master/python/wkhtmltopdf.md)

# example

```py
import pdfkit

pdfkit.from_url('http://google.com', 'out.pdf')
pdfkit.from_file('test.html', 'out.pdf')
pdfkit.from_string('Hello!', 'out.pdf')
```




