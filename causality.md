# Defining Causality


## Causal Models
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

Setzen wir in diesem System nun den Schalter 1 auf geschlossen, erkennen wir, dass der Zustand der Leuchte nun noch vom Zustand des zweiten Schalters abhängt.
\begin{equation}
Y := f(1, X_2) = 1 \cdot X_2 = X_2
\end{equation}

Nehmen wir nun an, dass wir nicht allwissend sind, sondern sich ein Schleier des Unwissens über Schalter 2 gelegt hat: wir wissen, dass es ihn gibt, wir wissen nur nicht, ob dieser geschlossen ist oder nicht.

Man stellt uns nun die Aufgabe, den Zustand des Schalters 2 aus der rein passiven Beobachtung des Systems zu lernen.

Ein Blick auf Tabelle xxx zeigt, dass uns das nur in einigen Fällen gelingen wird. Bestimmte Konstellationen von Schalter 1 und Leuchte geben uns nicht ausreichende Information, um den Zustand von Schalter 2 lernen zu können. Selbstverständlich könnten wir dieses Problem lösen, indem wir Schalter 1 betätigen und beobachten, wie sich Leuchte dann ändert. Tatsächlich können wir durch die Intervention und die weitere Beobachtung auf den Zustand von Schalter 2 zu schließen.

Dies ist bereits ein erster Hinweis auf ein fundamentales Problem, auf das wir im Weiteren noch detaillierter eingehen werden: durch Interventionen in eine System können Informationen generiert werden, die aus rein passiver Beobachtung nicht verfügbar sind.

Gehen wir nun noch einen Schritt weiter und überlegen wir uns, ob das Problem gelöst werden kann, indem wir



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

The definition of [causal effect] hints at a severe problem for its measurements. It involves two quantities which can never be both observed at once. This poses a problem, a problem so fundamental that is often called **the fundamental problem of causal inference**.

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
