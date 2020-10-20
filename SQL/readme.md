# syntax

## Difference between WHERE and HAVING

![](https://i.gyazo.com/575d98558bb8025b0ac3e7b837197a93.png)

```
WHERE clause filters rows before aggregate calculations are performed where as
HAVING clause filters rows after aggregate calculations are performed
Totalsales of iPhone and Speakers can be calculated by using eitherWHERE or
HAVING clause
SELECT Product, SUM(SalEAmount) AS TotalSales
FROM Sales
WHERE Product in ('iPhone', 'Speakers')
WHERE clause filters rows
GROUP BY Product
before aggregate calculations
are performed where as
HAVING clause filters rows
Product TotalSales
iPhone
Speakers
after aggregate calculations
are performed. So from a
performance standpoint,
1500
400
HAVING is slower than WHERE
and should be avoided when
SELECT Product, SUM(SaleAmount) AS TotalSales
FROM Sales
possible.
GROUP BY Product
HAVING Product in ('iPhone', 'Speakers')|
```




