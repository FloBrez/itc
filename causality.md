# Causality

## Definition
Betrachten wir zunächst ein maximal einfaches System, schematisch dargestellt in Abb xxx. Es handelt sich hierbei um ein elektrisches Schalt Diagramm mit Stromquelle, Schalter (X) und Leuchte (Y). Wir nehmen der Einfachheit halber an, dass alle Elemente dieses Systems nur jeweils zwei Zustände annehmen können, die wir bequem als 0 und 1 kodieren können:
* der Schalter ist entweder geöffnet (0) oder geschlossen (1)
* die Leuchte bleibt dunkel (0) oder leuchtet (1).
Wir nehmen, an, dass die Stromquelle über ausreichend Kapazität verfügt. Somit hängt der Zustand der Leuchte trivial vom Zustand des Schalters ab, ist der Schalter geschlossen ist der Stromkteis geschlossen, Strom fließt durch die Leuchte und sie beginnt zu leuchten. Wird der Schalter geöffnet, wird der Stromkreis unterbrochen und die Leuchte erlischt.
Wir können dieses (zugegebenermaßen triviale) System auch formalisieren, zum Einen indem wir es in einen Graphen überführen, der die kausalen Zusammenhänge in Form von gerichteten Verbindungen zwischen Knoten darstellt sowie eine strukturelle Gleichung, die dies in mathematische Ausdrucksweise tut:

\begin{equation}
Y := f(X) = X
\end{equation}
Man beachte, dass in dieser Gleichung kein normales $=$ steht, sondern der Zuweisungsoperator $:=$: er besagt, dass der auf der rechten Seite stehende Ausdruck evaluiert wird, und anschließend der Variablen aug der linken Seite zugewiesen wird.\footnote{Dies kennen Sie vielleicht aus Programmiersprachen, wo Ausdrücke wie $x = x + 1$ gängig sind. Auch hier ist die Gleichung so zu verstehen, dass zunächst der bestehende Wert von x um 1 erhöht wird, bevor dann das Ergebnis an die Speicherstelle von x kopiert wird.}. Da die strukturelle Gleichung kausal zu interpretieren ist, können wir folgendes schließen: wenn der Schalter geschlossen wird, dann gilt $Y := 1$, was die Leuchte zum Leuchten bringt. Wird der Schalter geöffnet, $Y := 0$, erlischt diese.

Viel mehr gibt dieses einfache System nicht her, daher wenden wir uns nun dem System mit zwei Schaltern, $X_1$ und $X_2$. Beide sind in Reihe geschaltet, siehe Abbildung xxx. Als kausales System dargestellt, sieht es aus wie in Abbildung xxx. Somit kann es vier mögliche Schalterzustände geben, und nur wenn beide zugleich geschlossen sind wird die Leuchte brennen, siehe auch Tabellel xxx

| Schalter $X_1$ 	| Schalter $X_2$ 	| Leuchte 	|
|-------------	|-------------	|---------	|
| 0           	| 0           	| 0       	|
| 0           	| 1           	| 0       	|
| 1           	| 0           	| 0       	|
| 1           	| 1           	| 1       	|

Wir erkennen leicht, dass sich dies auch als strukturelle Gleichung schreiben lässt:
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


## Abschnitt 1

fefkaejkajketja ke jkaej kajke taktj akkejktj

# Kapitel 2

afnkefaefne. see also chapter [Kap 1](# Kapitel 1)

\begin{equation}
\beta_0 = \beta_1
\end{equation}


## Terminologie




## Unmittelbare Diskriminierung



# Notation
Interventionen in einem System $S$ notieren wir mit dem $do()$ Operator. So bezeichnet etwa $S;do(Z:=1)$, dass im System $S$ der Knoten $Z$ auf den Wert 1 festgesetzt wird, jedoch alle anderen Beziehungen unverändert bleiben. Sofern wir diese Intervention mit einer statistischen Größe in Verbindung bringen, wird diese hochgestellt an die statistische Größe angefügt, z.B. $P^{S;do(Z:=1)}(Y)$. Damit folgen wir der Notation wie sie etwa auch in Peters et al. verwendet wird und weichen somit von der von Pearl (2000) verwendeten Notatation $P(Y|do(Z=1))$ ab. Obwohl Letztere griffiger ist, kann sie zuweilen zu Missverständnissen führen:

* Der Ausdruck $P(Y|do(Z=1))$ ist der bedingten Wahrscheinlichkeit $P(Y|Z=1)$ sehr ähnlich, und kann daher - trotz der Verwendung des $do()$ Operator - zur Verwechslung führen.
* Die Intervention $do(Z:=1)$ bezieht sich immer auf ein bestimmtes System $S$. Dies machen wir in der Notation sichtbar.
* Die Verwendung von $Z=1$ statt $Z:=1$ kann - in komplizierteren Anwendungen - als symmetrische Beziehung missverstanden werden. $Z:=1$ verdeutlicht jedoch die Asymmetrie, nämlich dass der Variablen $Z$ der Wert 1 *zugewiesen* wird, und die Beziehung somit "von rechts nach links" zu lesen ist.


## Measuring causal effects

The fundamental problem of causal inference

The definition of [causal effect] hints at a severe problem for its measurements. It involves two quantities which can never be both observed at once. This poses a problem, a problem so fundamental that is often called **the fundamental problem of causal inference**.
