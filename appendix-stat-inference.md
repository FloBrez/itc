# Statistical Inference

This section provides a brief introduction into concepts of probability theory and statistical inference that are essential for understanding the technical parts of the main text.

## Distributions

### Single Random Variable
The expected value of a discrete random variable $X$ is the weighted avarage of the possible values $x$, with their probabilites as weights

\begin{equation}
E(X) = \sum_{x} p(x) x
\end{equation}

The expected value of a sum of two random variables is the sum of their expected values

\begin{equation}
E(X + Y) = E(X) + E(Y)
\end{equation}

and the expected value scales linearly with scaling factor $a$

\begin{equation}
E(a X) = a E(X)
\end{equation}

Note, however, that this property does not hold for the product of two random variables

\begin{equation}
E(X \cdot Y) = E(X) \cdot E(Y)
\end{equation}

only if $X$ and $Y$ are independent.

### Multiple Random Variables

* Covariance
* Correlation
* Conditional Probability
* Regression Parameter

## Statistical Inference

### Estimators

### Hypothesis Tests
