# Marketing

Another common application where correlation is often confused with causation is in marketing. This might be because data scientist and business might not speak the same language. It might, however, also be a valid pragmatic assumption, which is later validated in an experiment.
I will focus here on the (mis-)application of propensity modeling. Propensity modeling attempts to predict if a (potential) customers will perform a certain action, e.g. whether a new visitor on your site will register or whether a customer will buy a certain product. The model output is an estimated probability that the customer will do the action. Propensity models therefore fall into the class of binary regression.\footnote{This application should not be considered a classification problem as we are not primarily interested in the prediction class, i.e. whether or not the customer will do the action, but we're mostly interested in the *likelihood* to do so. Most marketing application will have a success rate (often called conversion rate) far below .5 and a fairly limited information set. In that case for most or even all customer the best prediction will be to predict non-conversion for every customer. However, even if no customer might have a predicted likelihood greater than .5, it can be fruitful for marketing to know if that probability is, say, .01 or 0.4.}

\begin{equation}
P(Y|I) = f(I) \label{eq:mktg1} \tag{1}
\end{equation}
where $I$ is the information set available for prediction.[^footnote-information-set]

[^footnote-information-set]: Typically you will find a notation similar to $P(Y|X) = f(X)$ where $X$ is called a feature set or a vector/matrix of features. I use the term information set to deliberately distinguish between the notion of all the information you have available for a customer. The information set is abstract and represents information in potentially very different formats, e.g. order data in your data base, the recorded call with the customer service team, or the customer's product reviews. Feature engineering is the step where this information is transformed into a format that can be used by ML algorithms: the order data could be transformed into multiple features, e.g. the total revenue in past 30 days, total revenue in past 180 days, the number of days the customer put an order in; the recorded call can transformed into days since the latest customer service contanct, length of the call, length of waiting in line and whether or not the issue was resolved; the product reviews are transformed into word embeddings.

There are plently of algorithms that could be used to estimate the function. Logistic regression is often chosen as it is easy to implement and the model itself might provide some insights. Here, we will focus not on the implementation part, but on the interpretation and (mis-) use of the model.

To see why the model might not be want you think it is, we will have a
A naive usage of the model is to focus marketing on customers with high likelhood to do the action. This however, can be serverly misleading, as we will discuss next. To show this, we will start with an ideal assumption: our model is perfect. A perfect model means that we predict the customer action correctly for every customer and the model produces predicted probabilies which are well calibrated. This means that we only get two predictions, either a customer will do action with estimated probability 0 or whether they will do so with probability 1 - and the model is always right.
However, although we have the best possible model, it illustrates well why the naive interpreation cannot be correct. If we focus our marketing on those customers with highest propensity (as there are only two values it is those with predicted probability 1), we focus our attention on a customer group that buys the product anyways. In fact, these are the customers that we should *least* focus on as the best we can do is to have no effect on those customers (but we still have the cost of the marketing intervention, which might be an opportunity cost) and in some case we might even affect the customer adversely (as they might be annoyed by the marketing). Hence, we're left with the second group of customers, those with predicted probability of 0. In this group, there might be some who will be convinced to buy the product after being exposed to  the marketing, but we are not able to say which ones. Even after doing an experiment, we will not improve on our decision rule. Say, we run an A/B test on all customers who were predicted to not buy, and we estimate that 0.02
Depending on the situation, this model might not be very useful. The only thing that we learned from the model is that we should exclude those customers with highest probability from our marketing. This runs counter to our intuition. Furthermore, in many applications, the action might be a rare event, with likelihoods not much higher than 1%. Excluding these customers from marketing might not save a lot of money in the first place, and establishing a system where you're able to provide different marketing on customer-level might have some fixed costs (e.g. it might require to store and process customer-level data and deploy the model-outputs to production systems).

\footnote{Another issue that might arise in this context is the (monetary) value expected to be gained from the marketing intervention. As customers who are convinced by marketing to buy a product might fundamentally differ from customers who do so naturally, the might have e.g. higher return rates or more contacts with customer service. Hence, estimating the monetary value each gained customer might in itself be a non-trivial problem.}

From the example it becomes clear that propensity modelling using a predictive model on passively observed data will at best be a proxy for the problem at hand. The goal of marketing optimization is to optimally trade-off the cost and effect of marketing, where the latter is a *causal* rather than an assosiative concept. Supervised machine learning models, regardless of their complexity, will fail at achieving the task since even a *ideal* falls short.
To see this more clearly, let's restate the problem in causal notation first. Let $Y$ denote the binary customer action we want to predict. Further, let $S$ denote the default environment, which includes all relevant causal factors that determine customer decisions, their preferences and endowment, the offers available on the market and our own offer and current marketing strategy. For simplicity's sake, let's assume our marketing strategy is binary and denote it by $M$ (e.g. whether or not we send the customer a marketing email). Assume the current marketing strategy is $M = 0$, i.e. we do currently not have an email program.
The individual causal differential effect of sending an email to customer $i$ is then
\begin{equation}
\Delta_i := Y_i^{S;do(Z_i:=1)} - Y_i^{S; do(Z_i:=0)} \label{eq:myfirsteq} \tag{1}
\end{equation}

As $Y$ is binary, $\Delta$ can be one of ${-1, 0, 1}$ with $\Delta = 1$ being the desired outcome. As discussed in [causality], we are not able to measure this quantity directly, but need to resort to population-level quantities instead:
\begin{equation}
P(\Delta) = P^{S;do(Z:=1)}(Y) - P^{S;do(Z:=0)}(Y) \label{eq:mktg_pop_ate} \tag{2}
\end{equation}
Both quantities on the right-hand side of equation $\eqref{eq:mktg_pop_ate}$ can be estimated. There are couple of ways to do so, many of which we discussed in [causality]. The most straigtforward way is to apply a randomized controlled trial (or "A/B test") where the population at hand is randomly split in two groups, one group being exposed to the marketing (i.e. $S;do(Z:=1)$) the other not being exposed (i.e. $S;do(Z:=0)$).\footnote{If $I_A$ and $I_B$ denote the sets of individuals assigned to groups A and B, repectively, and $n_A$ and $n_B$ denote the size of these sets, an estimate for the average treatment effect is the group difference of the average success rate, i.e. $\hat{P}(\Delta) = \frac{1}{n_A} \sum_{i \elem I_A} Y_i - \frac{1}{n_B} \sum_{i \elem I_B} Y_i$.}
Conditioning the probability estimate on a set of features allows us to investigate whether the *differential causal effect* is co-related with observable information - which ultimately tells us who will be most affected by the marketing.
In the most simple case, we condition by a single discrete attribute $A$, providing
\begin{equation}
P(\Delta | A) = P^{S;do(Z:=1)}(Y | A) - P^{S;do(Z:=0)}(Y | A) \label{eq:mktg_pop_cate} \tag{3}
\end{equation}

This is superficially similar to equation $\eqref{eq:mktg1}$, but note that the right-hand side in $\eqref{eq:mktg_pop_cate} describes two conditional probabilities drawn from two different environments.
It will be helpful to rewrite this into a linear model form. Assume that $A$ is binary. Then
\begin{align}
P(\Delta | A = 1) &= P^{S;do(Z:=1)}(Y | A = 1) - P^{S;do(Z:=0)}(Y | A = 1) \\
                  &= a_1 - a_0 \\
                  &=: \Delta_1 \\
P(\Delta | A = 0) &= P^{S;do(Z:=1)}(Y | A = 0) - P^{S;do(Z:=0)}(Y | A = 0) \\
                  &= a_3 - a_2 \\  
                  &=: \Delta_0           
\end{align}
We can further represent $P(Y)$ as a function of $Z$
\begin{align}
P(Y) &= P^{S;do(Z:=0)}(Y) \cdot (1-Z) + P^{S;do(Z:=1)}(Y) \cdot Z \\
     &= P^{S;do(Z:=0)}(Y) + (P^{S;do(Z:=1)}(Y) - P^{S;do(Z:=0)}(Y)) \cdot Z \\
     &= P^{S;do(Z:=0)}(Y) + P(\Delta) \cdot Z \\
     &= \beta_0 + \beta_1 Z
\end{align}
Further, replacing unconditional quantities with conditional ones, we can write
\begin{align}
P(Y | A) &= P^{S;do(Z:=0)}(Y | A) + P(\Delta | A) \cdot Z \\
         &= \alpha_0 + \alpha_1 A + (\Delta_0 + \Delta_1 \cdot A) \cdot Z \\
         &= \alpha_0 + \alpha_1 A + \Delta_0 Z + \Delta_1 A Z
\end{align}
which looks quite familiar as it is the conventional way to specify a logistic regression equation on $A$, $Z$ and the interaction of both $A \cdot Z$.[^footnote-hte-nomenclature] If the treatment is ineffective $\Delta_0 = 0$ *and* $Delta_1 = 0$. The *differential causal effect* is said to be heterogeneous, if $\Delta_1 \neq 0$.
[^footnote-hte-nomenclature]: The literature on *heterogeneous treatment effect* models often groups parameters of this equation regarding their role in application: $\alpha_1$ is called "prognostic" as it shows if and how the success rate differs across attributes $A$ *if no intervention/treatment* is provided; $\Delta_1$ on the other hand is often called "predictive", meaning how predictive $A$ is on the *effectiveness of the intervention/treatment*, i.e. whether and by how much treatment effects differ across values of $A$.

The model can be generalized to the case where not just a single (binary) attribute is considered, but a vector of attributes.
