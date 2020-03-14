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

text

```{definition, strat_assignment, name = "Stratified Randomization"}
tbd
```

Stratified experiments first group individuals according to some observable attribute (e.g. by gender or by city). These groups are called strata. Within each stratum, treatment assignment follows a copmpletey randomized experiment. All methods for statistical inference can be used if the stratum is interpreted as the population for each sub-experiment. In many cases, however, we're not primarily interested in the effect in each stratum (although this can be informative) but in the population containing all strata. The statistics become more cumbersome, but stratification imposes no harm in the sense of additional assumptions as the stratification mechanism is fully known.


## Instrumental Variables

In many practical applications, the assignment cannot be enforced, e.g. patients assigned to take a drug might choose to not follow through. In these cases, the effect of assignment and the effect of the actual treatment (the drug) will be different. A drug might be effective, if the application is difficult, many patients might choose not to follow through. A less effective drug that is easier to apply might have overall higher effectiveness of the assignment.

We can extend graph x from the previous section to show this mechanism explicitly. So far, we have focused on the effect of $X$ on $Y$, ignoring the details of the mechanism, especially that $Z$, the patient's decision to follow the assignment, is a *mediator* of the effect of $X$ on $Y$. This is not a problem if the effect of $X$ on $Y$ is our primary interest. However, we might be interested to split this mechanism into two sub-mechanisms in their own right. The mechanism $X -> Z$ explains how assignment of treatment is followed through by patients, whereas $Z -> Y$ is the biochemical of the drug. Often, researchers are interested in the latter, but aren't able to enforce assignment. As $U$ is a confounder of $Z -> Y$, the correlation of $Z$ and $Y$ is not a valid method to estimate the causal effect. In comes the instrumental variable, in this case $X$.
The intuition behind this method is as follows. We can reliably infer the effect of $X$ on $Y$, as $X$ is randomized and therefore there is no confounding. We can further also infer the effect of $X$ on $Z$, again because $X$ is randomized. In a sense, as $X$ on $Y$ is the combined effect of $X$ on $Z$ and $Z$ on $Y$, there are ways we can get the latter from the former two (it is, in general, not just the difference of these two). 

TODO

## Propensity Score Matching

Many questions cannot be answered with deliberate experiments. Experimentation might be considered unethical or unfeasible; the intervention has already been done without randomization;
TODO

## Difference-in-Difference Estimator

TODO

## Time Series Methods

TODO
