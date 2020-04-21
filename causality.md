# Causal Models

## Causality, Asymmetry and Entropy

*Causality* is strongly linked to the concept of *time*. Cause precedes effect, never the other way round. Symptoms occur after infection
This asymmetry is mirrored in the physical notion of entropy and (as an emergent property) time.
While the past is determined we feel that we are able to act on the future, that we are able to choose one among many possible futures. This is due to the low entropy the universe had in the past.
All fundamental physical laws are perfectly symmetrical and therefore reversable. Asymmetry is only introduced by a coarse-grained look at the world, and therefore an *emergent* property.


## Basic Definitions
We assume the world can be modelled by *variables*. Variables can take various values. The variables themselves are denoted by upper-case latin letters, e.g. $X$, whereas we use lower-case letters for their values, e.g. $x$. In case $X$ is *categorical*, different values will be denoted by a subscript $x_j$. Where $X$ has two values only, we will encode them with $0$ and $1$.

### Causal Graphs

```{definition, graphs, name = "Causal Graph"}
A graph is a mathematical structure. It consists of a set of nodes and and a set of edges, where edges connect ordered pairs of nodes. In *causal graphs*, nodes represent variables; edges represent the causal relation from cause to effect. Note that in a causal graph, an edge is an *ordered* pair of nodes, the edge therefore directed. In most graphs in this book, we will consider causal systems that can be represeted as directed acyclical graphs (DAGs)[^dag1]. These DAGs have no feedback loops.
```

[^dag1]: Readers familiar with DAGs data processing pipelines will recognize that these too describe causal mechanisms. Datasets are manipulated in an ordered sequence of steps to produce a final outcome where the result of each step is determined by the outcome of its parents steps (the input datasets) and the mechanism itself (the transformation of the datasets).

The causal graphs convey the qualitative pattern of causal relations. They do not quantify that relation, i.e. specify how two variables are related. A graph with relation $A \rightarrow B$
It The quantitative aspects are better represented in a set of structural equations.

```{definition, exoendo, name = "Exogeneous and Endogeneous Variables"}
An exogeneous variable in a graph G has no edges pointing into itself.
An endogeneous variable in a graph G has at least one edge point into itself.
```

### Structural Equations

*Structural equations* represent the causal relations between *variables*. The *absence* of a variable from the model assumes that it is not relevant for the causal description of the system.
We will focus exposition on *categorical variables* which can assume a

$X \rightarrow Y$ means that $X$ causes $Y$. Manipulating $X$ determines the value of $Y$, but not the other way round. We call $X$ the *cause* and $Y$ the *outcome*. Others call $Y$ the "*effect*", but we will use *effect* to denote changes in the outcome due to manipulations of the cause. This is in line with conventions in statistical literature (e.g. "average treatment effect") and its usage in everyday language (e.g. "tipping on that button had no effect on the brightness of the screen").

## Causality In A Simple Environment
Let's first take a look at a maximally simple environment, shown in figure xxx. It represents a circuit diagram with a voltage source, a switch (X) and a lamp (Y). All elements of this environment can assume one of two states each, which we will conveniently encode as 0 and 1:
* the switch can either be open (0) or closed (1)
* the lamp can either be off (0) or on (1).
Let's further assume that the voltage source has enough capacity to lighten the lamp if the switch is closed. Although this system is easy to understand and reason about, let's take an extra second to translate the circuit diagram into a *causal graph*, a representation that will become quite handy in more complex environments that will be discussed later in the book.



We can further represent a *causal graph* as a set of structural equations. Due to its simplicity, the circuit diagram can be represented with a single equation:
\begin{equation}
Y := f(X) = X
\end{equation}
Note, that the equation uses operator "$:=$"" rather than the usual "$=$". It reads "$f(X)$ is evaluated and *assigned* to $Y$" and therefore resembles variable assignment in many programming languages where, for example, `x = x + 1` is a valid expression. Crucially, it is asymmetric: if $X$ is the air temperature and $Y$ the reading of the temperature on a thermometer, the reading will change if we heat up the air; manipulating the reading, e.g. by exposing the thermometer to direct sunlight will not heat up the air around it.

Since the structural equation represents the *causal mechanism* relating the switch and the lamp, we can immediately read what happens if we intervene on the switch: when we close the switch, i.e. $do(X:= 1)$, then the lamp will be on, $Y := 1$; if we open the switch, $do(X:= 0)$, then the lamp dies, $Y := 0$.

Let's take it up a notch and create a more interesting environment by adding a second switch, connected in series, see figure XXX for the circuit diagram and figure xxx for the graph representation. The two switches allow the environment to be in four different states. Only if both switches are on, will the lamp be on, in the other three states it will be off:

| switch $X_1$ 	| switch $X_2$ 	| lamp $Y$  |
|-------------	|-------------	|---------	|
| 0           	| 0           	| 0       	|
| 0           	| 1           	| 0       	|
| 1           	| 0           	| 0       	|
| 1           	| 1           	| 1       	|

We can easily spot that the structural equation representation is
\begin{equation}
Y := f(X_1, X_2) = X_1 \cdot X_2
\end{equation}

When we close switch 1, $X_1 := 1$, the state of the lamp is solely determined by the state of swith 2.
\begin{equation}
Y := f(1, X_2) = 1 \cdot X_2 = X_2
\end{equation}

At the same time, we also understand that, when $X_1 := 0$, the state of the lamp is independent of switch 2:
\begin{equation}
Y := f(0, X_2) = 0 \cdot X_2 = 0
\end{equation}

This might at first seem trivial, but here comes the twist: assume we know the system, but we are unable to observe the state of switch 1 (imagine it being hidden inside a plastic container or something). Imagine further that we also observe that switch 2 is open (and the lamp is therefore off). Will closing switch 2 turn on the light?

We cannot provide an answer to this question, at least not one with certainty. We know that the *effectiveness* of switch 2 depends on something that we don't know, the state of switch 1. *Only* through intervening with the system by closing switch 2 or by gathering information about the state of switch 1 we are able to answer this question.[^cf1] Nevertheless, we might be able to provide a *probabilistic* answer to the question, an answer that quanitifies our uncertainty about switch 1. If we know that the likelihood that switch 1 is closed is 0.8 in all cases where we encounter switch 2 to be open and and the light to be off, then closing switch 2 will turn on the light in 80% of the cases.

[^cf1]: Note, however, that this ambiguity disappears if we happen to observe switch 2 to be closed and therefore the light to be on. With our understanding of the system, it is clear that switch 1 also has to be closed. Opening switch 2 will consequently turn off the light, *with certainty*.

This example has shown that even in very simple causal systems, not being able to observe (and measure) a single variable, requires us to revert to inferences of a lesser kind, probabilistic rather than actual. Of course, most systems worth studying in fields outside of physics are far more complex as the one described here, and many variables of interest cannot be observed or measured. Causal analysis is therefore closely linked with statistics. From here on, we will consider these probabilistic use cases.

## Causality In A Complex Environment
\begin{equation}
\Delta_i := Y_i^{S;do(Z_i:=1)} - Y_i^{S; do(Z_i:=0)} \label{eq:myfirsteq} \tag{1}
\end{equation}

As $Y$ is binary, $\Delta$ can be one of ${-1, 0, 1}$ with $\Delta = 1$ being the desired outcome. As discussed in [causality], we are not able to measure this quantity directly, but need to resort to population-level quantities instead:
\begin{equation}
P(\Delta) = P^{S;do(Z:=1)}(Y) - P^{S;do(Z:=0)}(Y) \label{eq:mktg_pop_ate} \tag{2}
\end{equation}

## Causal Effects

The fundamental problem of causal inference

The definition of [causal effect] hints at a severe problem for its measurements. It involves two quantities which can never be observed at once. This poses a severe problem, often called **the fundamental problem of causal inference**.
Nevertheless, it does not prevent us from inferring *average* causal effects. This might be counterintuitive at first. How could we measure the *average* of a quantity, if we can't measure the quantity itself? We will see that statistics comes to the rescue. The linearity of expectation states that

\begin{equation}
E(U - V) = E(U) - (V)
\end{equation}
i.e. expected value of the difference of two random variables is the difference between the expected values of the individual random variables. Hence, even if $U - V$ cannot be observed, we can still calculate.[^linexpex1]

[^linexpex1]: Imagine you are interested in the average *net income* of a certain population, i.e. $E(income - expenses)$. Even if you do not have access to individual-level data, say due to privacy concerns, you can calculate this value if you are given the population averages of income and expenses, i.e. $E(income) - E(expenses)$. Note that linearity is a property of the expected value, but not of other aggregate metris that might be of interest like the median value, where, in general, $Median(income - expenses) \neq Median(income) - Median(expenses)$.

### Definition

bla

### Causal Effect Statistics

```{definition, ate, name = "Average Treatment Effect"}
The Average Treatment Effect, or ATE, is the expected value of xx in population x.
```

bla bla bla

```{definition, att, name = "Average Treatment Effect on the Treated"}
The Average Treatment Effect on the Treated, or ATT, is the expected value of xx in population x conditional on observing x.
```

It is often used in situations where the treatment effect is expected to be heterogeneous in a population. In a given environment, selection into treatment could yield treated individuals to have a different average treatment effect than the total population. For example, if university eduction has a higher effect on earnings for people with high intelligence and if people with high intelligence more often chose a university education than less intelligent ones, the average effect of university eduction of those who choose to go to university will be higher than in the overall population (and therefore than those choosing not to go to university).


```{definition, itt, name = "Intention To Treat Effect"}
The Intention To Treat Effect, or ITT, is the expected value of xx in population x.
```

It is conceptually the same as the ATE, but often refers to a situation where the primary intervention cannot be manipulated directly, e.g. where a doctor can prescribe a drug but not enforce that the patient actually takes the drug.


```{definition, late, name = "Local Average Treatment Effect"}
The Average Treatment Effect, or ATE, is the expected value of xx in population x.
```
