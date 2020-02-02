# Defining Causality

## Causality in simple environments
Let's first take a look at a maximally simple environment, shown in figure xxx. It represents a circuit diagram with a voltage source, a switch (X) and a lamp (Y). All elements of this environment can assume one of two states each, which we will conveniently encode as 0 and 1:
* the switch can either be open (0) or closed (1)
* the lamp can either be off (0) or on (1).
Let's further assume that the voltage source has enough capacity to lighten the lamp if the switch is closed. Although this system is easy to understand and reason about, let's take an extra second to translate the circuit diagram into a *causal graph*, a representation that will become quite handy in more complex environments that will be discussed later in the book.

### Causal Graphs
tbd

We can further represent a *causal graph* as a set of structural equations. Due to its simplicity, the circuit diagram can be represented with a single equation:
\begin{equation}
Y := f(X) = X
\end{equation}
Note, that the equation uses operator "$:=$"" rather than the usual "$=$". It reads "$f(X)$ is evaluated and *assigned* to $Y$" and therefore resembles variable assignment in many programming languages where, for example, `x = x + 1` is a valid expression.

Since the structural equation represents the *causal mechanism* relating the switch and the lamp, we can immediately read what happens if we intervene on the switch: when we close the switch, i.e. $do(X:= 1)$, then the lamp will be on, $Y := 1$; if we open the switch, $do(X:= 0)$, then the lamp dies, $Y := 0$.

Let's take it up a notch and create a more interesting environment by adding a second switch, connected in series, see figure XXX for the circuit diagram and figure xxx for the graph representation. The two switches allow the environment to be in four different states. Only if both switches are on, will the lamp be on, in the other three states it will be off:

| switch $X_1$ 	| switch $X_2$ 	| lamp 	    |
|-------------	|-------------	|---------	|
| 0           	| 0           	| 0       	|
| 0           	| 1           	| 0       	|
| 1           	| 0           	| 0       	|
| 1           	| 1           	| 1       	|

We can easily spot that the structural equation representation is
\begin{equation}
Y := f(X_1, X_2) = X_1 \cdot X_2
\end{equation}

(Beispiel abändern und mit ein bzw zwei Batterien durchspielen? Dann wäre der Strom additiv und die Modellierung wäre flexibler.)

Setzen wir in diesem System nun den Schalter 1 auf geschlossen, erkennen wir, dass der Zustand der Leuchte nun noch vom Zustand des zweiten Schalters abhängt.
\begin{equation}
Y := f(1, X_2) = 1 \cdot X_2 = X_2
\end{equation}

Nehmen wir nun an, dass wir nicht allwissend sind, sondern sich ein Schleier des Unwissens über Schalter 2 gelegt hat: wir wissen, dass es ihn gibt, wir wissen nur nicht, ob dieser geschlossen ist oder nicht.

Man stellt uns nun die Aufgabe, den Zustand des Schalters 2 aus der rein passiven Beobachtung des Systems zu lernen.

Ein Blick auf Tabelle xxx zeigt, dass uns das nur in einigen Fällen gelingen wird. Bestimmte Konstellationen von Schalter 1 und Leuchte geben uns nicht ausreichende Information, um den Zustand von Schalter 2 lernen zu können. Selbstverständlich könnten wir dieses Problem lösen, indem wir Schalter 1 betätigen und beobachten, wie sich Leuchte dann ändert. Tatsächlich können wir durch die Intervention und die weitere Beobachtung auf den Zustand von Schalter 2 zu schließen.

Dies ist bereits ein erster Hinweis auf ein fundamentales Problem, auf das wir im Weiteren noch detaillierter eingehen werden: durch Interventionen in eine System können Informationen generiert werden, die aus rein passiver Beobachtung nicht verfügbar sind.

Gehen wir nun noch einen Schritt weiter und überlegen wir uns, ob das Problem gelöst werden kann, indem wir



## Causality in complex environments
\begin{equation}
\Delta_i := Y_i^{S;do(Z_i:=1)} - Y_i^{S; do(Z_i:=0)} \label{eq:myfirsteq} \tag{1}
\end{equation}

As $Y$ is binary, $\Delta$ can be one of ${-1, 0, 1}$ with $\Delta = 1$ being the desired outcome. As discussed in [causality], we are not able to measure this quantity directly, but need to resort to population-level quantities instead:
\begin{equation}
P(\Delta) = P^{S;do(Z:=1)}(Y) - P^{S;do(Z:=0)}(Y) \label{eq:mktg_pop_ate} \tag{2}
\end{equation}



# Notation
Interventionen in einem System $S$ notieren wir mit dem $do()$ Operator. So bezeichnet etwa $S;do(Z:=1)$, dass im System $S$ der Knoten $Z$ auf den Wert 1 festgesetzt wird, jedoch alle anderen Beziehungen unverändert bleiben. Sofern wir diese Intervention mit einer statistischen Größe in Verbindung bringen, wird diese hochgestellt an die statistische Größe angefügt, z.B. $P^{S;do(Z:=1)}(Y)$. Damit folgen wir der Notation wie sie etwa auch in Peters et al. verwendet wird und weichen somit von der von Pearl (2000) verwendeten Notatation $P(Y|do(Z=1))$ ab. Obwohl Letztere griffiger ist, kann sie zuweilen zu Missverständnissen führen:

* Der Ausdruck $P(Y|do(Z=1))$ ist der bedingten Wahrscheinlichkeit $P(Y|Z=1)$ sehr ähnlich, und kann daher - trotz der Verwendung des $do()$ Operator - zur Verwechslung führen.
* Die Intervention $do(Z:=1)$ bezieht sich immer auf ein bestimmtes System $S$. Dies machen wir in der Notation sichtbar.
* Die Verwendung von $Z=1$ statt $Z:=1$ kann - in komplizierteren Anwendungen - als symmetrische Beziehung missverstanden werden. $Z:=1$ verdeutlicht jedoch die Asymmetrie, nämlich dass der Variablen $Z$ der Wert 1 *zugewiesen* wird, und die Beziehung somit "von rechts nach links" zu lesen ist.


## Measuring causal effects

The fundamental problem of causal inference

The definition of [causal effect] hints at a severe problem for its measurements. It involves two quantities which can never be both observed at once. This poses a problem, a problem so fundamental that is often called **the fundamental problem of causal inference**.
