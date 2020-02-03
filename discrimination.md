## Discrimination

In den letzten Jahren wurde in Politik, Medien und Wissenschaft häufiger über Diskriminierung diskutiert, einige Beispiele sind hierbei die Diskriminierung von Frauen im Berufsleben, der Wahl von Abegordneten zum Bundestag.\footnote{Weitere prominente Beispiele, die aus den USA auch nach Deutschland Wirkung entfalteten war die Diskussion um die Vergabe von Filmpreisen an vorwiegend weiße und männliche Schauspieler, Produzenten und Autoren sowie die  von Afroamerikanern bei der Oskar-verleihung.} Ein Verbot von Diskriminierung hat in Deutschland im Jahre 2006 Gesetzescharakter angenommen mit der Verabschiedung des *Allgemeinen Gleichbehandlungsgesetzes (AGG)*\footnote{https://www.gesetze-im-internet.de/agg/index.html}, dass u.a. die Diskriminierung aus Gründen des Alters, der ethnischen Herkunft oder des Geschlechts unzulässig ist. Wie bereits des Gesetzesname andeutet, wird Diskriminierung als ein Vorgang angesehen, nicht als ein Zustand\footnote{Die im allgemeinen Sprachgebrauch übliche Bezeichnung *Gleichstellungsgesetz* ist weniger klar und kann daher zu Fehlinterpretationen führen}. Dies wird insebesondere in §3 deutlich, wo eine (unmittelbare) Diskriminierung dann vorliegt "wenn eine Person wegen [Alter, Herkunft oder Geschlecht] eine weniger günstige Behandlung erfährt, als eine andere Person in einer vergleichbaren Situation erfährt".
Die zunehmende Anwendung automatisierter Entscheidungsalgorithmen rückt die Frage nach Diskrimierung auch in den Blickpunkt der Forschung im Bereich des maschinellen Lernens. Es ist in diesem Kontext, dass dieses Thema eine mathematische Formalisierung erfahren hat. Dabei wurden zuletzt auch kausale Argumentationen und Notation eingeführt, siehe etwa Kilbertus etl al..

Wir werden uns im Folgenden an einem einfachen Beispiel diesem Problem nähern sowie einen Versuch der
Die Identifikation von diskriminierenden Handlungen wird dadurch erschwert, dass die Handelnden Personen häufig nur einen Teil des gesamten Mechanismus kontrollieren und es begründete Sachzwänge gibt.
Im Folgenden unterscheiden wir zwei Merkmalstypen

First, let's introduce some basic terminology first:
* *protected feature*: this is a person's feature that is legally protected, e.g. age or gender.
* *accepted feature*: these are features that are explicitely or implicitely accepted for discrimination, e.g. the job might (by law) require a certain certificate of qualification or the job requires a certain skillset like a specific programming language or the ability to lift weigths heavier than 30 kg.

While the protected features are usually unambiguous and explicitly stated in law, the accepted features can be reason for disagreement. It is usually the set of features that are deemed to be necessary to do the job, but of course "doing the job" can done in different qualities. A bar owner might believe it to be necessary for his waiters to be handsome and flirty with the predominantely female audience, but an applicant might think it is not. Getting the order right and providing the right servcie while being friendly he might consider to be sufficient.  

* *unprotected feature*: these are all features that are not explicitly protected, e.g. eye color, ability to lift more than 30kg


* *zulässige Merkmale*: dies sind Merkmale, nach denen eine diskriminierende Handlung zulässig ist. So kann etwa für eine Tätigkeit in einem Warenlager voraussgesetzt werden, dass ein Bewerber in der Lage sein muss, Lasten über 20kg zu transportieren, da dies für die Erfüllung der Tätigkeit unabdingbar ist.
* *aufhebende Merkmale*: diese stellen eine Teilmenge der *zulässigen Merkmale* dar. Es sind diejenigen Merkmale, die auf dem kausalen Pfad zwischen den *geschützten* Merkmalen und dem Output liegen. Das Merkmal "kann Lasten über 20kg transportieren" ist vermutlich ein solches, da dieses kausal vom Geschlecht und/oder dem Alter eines Bewerbers beeinflusst ist.
* *unzulässige Merkmale*: sind Merkmale, nach denen eine diskriminierende Handlung nicht zulässig ist, die aber nicht ein *geschütztes Merkmal* sind. Dies könnte etwa die Augenfarbe des Bewerbers sein, die (etwa gemäß AGG nicht geschützt ist), jedoch für die Erfüllung der Tätigkeit irrelevant sein dürfte.
* *stellvertretende Merkmale*: diese stellen eine Teilmenge der *unzulässigen Merkmale* dar. Es sind diejenige Merkmale, die auf dem kausalen Pfad zwischen den *geschützten* Merkmalen und dem Output liegen. So kann die Augenfarbe eines Bewerbers ein *stellvertretendes Merkmal* sein, wenn die Augenfarbe etwa durch das Geschlecht oder die ethnische Herkunft beeinflusst wird. Sie werden *stellvertretend* genannt, da sie Information über das geschützte Merkmals beinhalten und somit zur Diskriminierung herangezogen werden könnten.

TODO: sollte *unzulässig* nicht anders bezeichnet werden, da ja eine Diskriminierung nach nicht-stellvertretern rechtlich nicht verboten ist.

Es gelten folgende Definitionen:

* kann ein Mechanismus der unmittelbaren Diskriminierung durch einen vom geschützten Merkmal unabhängigen Prozess (oder eine Konstante) ersetzt werden, ohne dass sich die Verteilung der Zielvariable ändert, so ist dieser Mechanismus nicht-diskriminierend
