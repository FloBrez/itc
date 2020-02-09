# Epistemology

## Manipulation
Sometimes the cause cannot be directly manipulated: the doctor can prescribe a drug but not ensure the patient is taking the drug; a marketing manager might choose who to sent a mail to, but the delivery could fail; we dealt with problems like these in our application on instrumental variables.
The problem is however, more subtle, and probably more important than we might have anticipated. The issue appears in situations where cannot directly intervene on a variable, but only on a mechanism that affects that variable.

Assume, you're an economist asked to evaluate the effect of university education on a persons lifetime income to inform a decision on whether or not to expand access to university education.
As an expert in economics, statistics and causal inference, you immediately recognize the problems with this task.
* knowing about treatment effect heterogeneity, you understand that the average treatment effect calculated for the current group of students is not an estimate for the treatment effect for those who will become available under the new policy.
* you're asked to provide a causal effect, but the intervention is not specified. The government can't directly manipulate

Uncertainty about effectiveness of interventions can have various reasons:
* *correct model*: we are uncertain about the assumptions on the causal structure used to make the causal inference
* *extrapolation*: the causal inference relied on data drawn from other populations, either other individual or a different time. In dynamic environments such as the economy, causal knowledge can depreciate fast with new technology, a changing competition and ever-so slightly different regulation.
*

In many circumstances the optimal decision will differ by perspective. Imagine a doctor having two different treatments at hand. Drug A is known to be most effective (100), but relies on the patient taking the drug reliably every day. If taken irregularly, the drug's effectiveness is severly lower (50). Drug B on the other hand works similarly if take regularly or irregularly (75). If the doctor has to make a decision whether to prefer A vs B, she will have to rely on her judgements of the patient's ability to follow through on a regular schedule. If it is known that most patients have a hard time doing this, the best treatment to prescribe from a doctor's perspective is drug B. The patient, however, might think differently. Knowing that they have the self-discipline they might choose to go with drug A.
This is just one example on how a guideline with simple recommendations can be sub-optimal. If the patient was given the information, he could use it to make a better judgement (but of course the patient might be overconfident in his ability to stick to a rigid schedule).
This is similar to giving someone advice to exercise and restrict to 2000kcal food intake to loose weight. This certainly works *if* one adhere's to it. The likelihood to fail will be great though. A less ambitious and rigid goal might be less effective, but might be substantially easier to follow-through. The *recommendation* for a diet will have to have a larger effect than the more rigid one.

## Long-Term Effects
In examples so far we have considered situations where the intervention was one-shot, i.e. we only intervened once in the system. Although plausible in the applications considered, there are many applications where this is not the case. Especially when we are interested in long-term goals rather than short-term outcomes, it is implausible that we would not be able to intervene in the future. Of course, this can partly be alleviated estimating the likelihood of future actions and taken these into account, but that doesn't make sense if we are the actors ourselves.
The British xx was tasked to evaluate the effect of Brexit on British GDP in the years after Brexit. This is difficult to establish as many important decisions are undetermined by Brexit itself (leaving out the problem that the terms and conditions of the Brexit are not fully specified themselves). Leaving the EU will allow Great Britain to explore policies that were not available within the EU: every country in the EU has to have a value-added tax system. Leaving the EU allows to choose a different policy. An economist trying to provide this estimate will have to assume a probability distribution on this topic, as it will certainly have non-trivial impact. A politician in charge, e.g. the prime minister, might disregard this recommendation as he might have quite different plans and the probability distribution might be quite different (it might not be fully centered at a single option as he might be unsure whether he might achieve this policy if he is willing to go for it).  


## Are all sciences equal?

The concept of causality as discussed in this book is a cornerstone of many scientific disciplines. Although in most cases not stated explicitly in those terms, the question **what will happen if i does x (versus y)** is implicit in most scientific work in diverse fields such as economics, psychology, medicine, and history\footnote{For history, the question needs to be changed to **what would have happened if i did x (versus y)**. Note that *i* needs to be an actor who can *manipulate x* directly for this question to make sense. Statements such as *if it weren't for Mikhail Gorbachev, the Soviet Union wouldn't have been dissolved in '91* are therefore too ambiguous for a rigorous treatment: it will likely matter if Gorbachev wasn't elected by the Politburo in 1985 in the first place, being ousted from office by coup d'état or stepped down from office due to health reasons.}.
The interventions contemplated and analyzed in these disciplines vary widely in terms of manipulability, scope and ethics: a randomized experiment on fiscal policy is neither operationally feasible nor ethically desirable - at least at a the level of entire nations; assessing how individuals provide different answers if questions are phrased differently is both manipulable in a controlled environment and too unintrusive to be ethically problematic. Throughout the book we discussed several methods to infer causal relationships ranging from randomized controlled trials to time series analysis. With every step away from the ideal properties of an RCT, the reliability and robustness of results crucially depended on the validity of the assumptions that we were willing to accept. In general, the more assumptions we make, the more likely the results will be unreliable.
On a sidenote: of course, incorrect causal assumptions are not the only or even the main reason for scientific results to be unreliable. Many of those have to do with problems of *statisical inference* instead. Even in experiments following an RCT design, there are plenty of pitfalls to be aware of. Too small samples, p-hacking, and publishing bias are just a few reasons for the [replication crisis](https://en.wikipedia.org/wiki/Replication_crisis) in psychology, medicine and other social sciences.

Least reliable results are to be expected when the complexity of the subject matter is very high, but the methodoligal toolkit to investigate it is reduced to the least reliable ones

* macroeconomics. growth, business cycle, monetary and fiscal policy.
* epidemiology. including nutrition.
* social psychology.
* evolution. while the theory of evolution has strong empirical support, combinatorial explosion and complex dynamics do not allow for a reliable inference of effects of interventions in the biosphere.

Even if complexity is high, if some aspects of the problem can be thoroughly studied and combined using a consistent theory, the overall results can be reasonably reliable:

* climate science.
* microeconomics. pseudo-experiments on price controls (e.g. minimum wage or gas price cap) supported by strong theory of supply and demand. problem is often quantification of effects rather than the general direction. There is almost no disagreement across labor economists that there exists a general trade-off between higher minimum wages and lower unemployment. The debate today primarily focuses on the possibility of small negative or even positive effects on employment, but virtually everybody accepts the logic that unemployment will exist/increase above a certain threshold.
*


*
