# Code

## Equivalence of statistical properties and SQL

The probability distribution $P(X = x)$

```
SELECT
    X                                AS value_x
  , SUM(1.0) / SUM(SUM(1.0)) OVER () AS probability_of_x
FROM table
GROUP BY X
```



The expected value $E(X)$

```
SELECT
    AVG(X) AS expected_value_of_X
FROM table
```

The set of conditional expected values $E(X|Y)$

```
SELECT
      Y      AS value_y
    , AVG(X) AS cond_expected_value_X_given_y
FROM table
GROUP BY Y
```


The conditional expected values $E(X|Y = y)$

```
SELECT
      Y      AS value_y
    , AVG(X) AS cond_expected_value_X_given_y
FROM table
WHERE Y = y
GROUP BY Y
```
