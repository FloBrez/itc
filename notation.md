# (APPENDIX) Appendix {-}

# Notation and Terminology

Throughout the book we will follow notation and terminology similar to @peters2017. It deviates from @pearl2009 primarily in the notation for intervention distributions. Where @pearl2009 writes $P(Y|do(X = x))$, we will use $P^{\Gamma;do(X:=x)}(Y)$ instead: it avoids confusion with the notation for conditional distributions and it emphasizes that an intervention is an *assignment* ("$:=$") rather than  an *equality* ("$=$"). Otherwise we follow conventional statistical notation.

| symbol       	| represents        |
|-------------	|-------------	    |
| $X, Y, U$     | (random) variable	|
| $x$           | value of $X$      |
| $X =x$        | $X$ has value $x$ |
| $X:=x$        | assignment of value $x$ to variable $X$ |
| $i$           | sample index, observation |
| $\Gamma$      | causal graph      |
| $\Gamma;do(X:=x)$ | intervention on graph $\Gamma$ by assigning value $x$ to $X$ |
| $P(Y)$        | probability distribution of $Y$ |
| $P(Y|X = x)$  | probability distribution of $Y$ given $X = x$ |
| $P(Y|X)$      | set of probability distributions $P(Y|X = x) \forall x$ |
| $P^{\Gamma;do(X:=x)}(Y)$ | probability distributions of $Y$ after intervention on graph $\Gamma$ |
| $E(Y), \mu_Y$ | expected value of $Y$ |
| $Var(Y), \sigma_Y^2$ | variance of $Y$ |
| $\hat{\beta}$ | estimate of parameter $\beta$ |
| $X -> Y$ | causal link from $X$ to $Y$ |
