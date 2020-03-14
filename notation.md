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

## Terminology Confusion

Causality has been studied for decades using only statistical notation and terminology. As the main text shows, this cannot be achieved. Trying to do so leads to imprecision, paradoxes, and outright confusion. Hence, it is important to always bear in mind that "causal and statistical concepts do not mix." [@pearl2009, p.332] The same author even goes so far as to proclaim:

> If I am remembered for no other contribution except for insisting on the causal-statistical distinction, I would consider my scientific work worthwhile.

He demonstrates this (on page 40) by acknolidging that statistical notation is not rich enough to discriminate between the causal relation between disease and symptoms

$$
P(symptoms | disease)
$$

and non-causal relationship

$$
P(disease | symptoms)
$$

If you already have some background on this topic, you might have heard many causal terms to be used in statistics text without the proper context. The following list will provide some guidance

Causal terminology:
confounder, randomization, instrumental variable, experimental vs observational data, exogeneous vs endogeneous variables, structural equations, spurious correlation, explanation

statisical concepts:
correlation, independence, regression (parameter), significance, variance, distribution, Granger causality, likelihood, propensity scores

> [B]ehind every causal conclusion there must lie some causal assumption that is not discernible from the distribution function. [@pearl2009, p.332]

And then there's "spurious correlation".

> In statistics, a spurious relationship or spurious correlation is a mathematical relationship in which two or more events or variables are associated but not causally related, due to either coincidence or the presence of a certain third, unseen factor (referred to as a "common response variable", "confounding factor", or "lurking variable") [https://en.wikipedia.org/wiki/Spurious_relationship]

It is probably the worst of all of these. First, it obviously mixes statistical and causal concepts. Saying that a correlation is "spurious" because there is no causal relation is just weird. A spurious correlation should be an observation where the correlation in a sample is non-zero, although it is in the entire population.
Second, "correlation" suggests that it's just not the right statistical measure to convey the causal relationship - and that a conditional expectation or a regression coefficient might. They don't.
