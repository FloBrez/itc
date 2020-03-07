# Methods for Causal Inference

Causal relations can be inferred from **experiments** as well as **observational studies**.
The randomized controlled experiment is a proven method to infer causal relations in complex environments. It involves full control over the assignment mechanism and the assignment is random.
A common variation is the situation where the variable of interest cannot be directly intervened on, but a causal parent can. For example, a doctor can (randomly) prescribe a certain drug, but the patient still chooses to take the drug or not. The method of instrumental variables allows us to infer (local) causal effects nevertheless.

Afterwards, we switch to those methods that can be used even if we cannot intervene in the environment, but have to rely on passive observation only. Inferring causal relations in these situations requires a thorough understanding of the causal links from the variable of interest to the effect. We will study two different inference strategies which rely on different sets of assumptions.

Finally, we discuss methods for causal inference in samples of size 1. Given appropriate assumptions, we are able to infer causal relations by leveraging (dependent) observations over time.

## Causal vs Statistical Inference
Causal inference is much harder than statistical inference.

## Randomized Controlled Experiments

TODO
### Assignment Mechanisms
```{definition, rct_assignment, name = "Complete Randomization"}
If intervention $X$ is assigned through mechansim
\begin{equation}
X := U
\end{equation}
where $U ~ Bernoulli(p)$ with $0 < p < 1$, the experiment is said to be completely randomized.
```

```{definition, strat_assignment, name = "Stratified Randomization"}
tbd
```

Startified experiments first group individuals according to some observable attribute (e.g. by gender or by city). These groups are called strata. Within each stratum, treatment assignment follows a copmpletey randomized experiment. All methods for statistical inference can be used if the stratum is interpreted as the population for each sub-experiment. In many cases, however, we're not primarily interested in the effect in each stratum (although this can be informative) but in the population containing all strata. The statistics become more cumbersome, but stratification imposes no harm in the sense of additional assumptions as the stratification mechanism is fully known.


## Instrumental Variables

TODO

## Propensity Score Matching

Many questions cannot be answered with deliberate experiments. Experimentation might be considered unethical or unfeasible; the intervention has already been done without randomization;
TODO

## Difference-in-Difference Estimator

TODO

## Time Series Methods

TODO
