# Marketing

Another common application where correlation is often confused with causation is in marketing. This might be because data scientist and business might not speak the same language. It might, however, also be a valid pragmatic assumption, which is later validated in an experiment.
I will focus here on the (mis-)application of propensity modeling. Propensity modeling attempts to predict if a (potential) customers will perform a certain action, e.g. whether a new visitor on your site will register or whether a customer will buy a certain product. The model output is an estimated probability that the customer will do the action. Propensity models therefore fall into the class of binary regression.\footnote{This application should not be considered a classification problem as we are not primarily interested in the prediction class, i.e. whether or not the customer will do the action, but we're mostly interested in the *likelihood* to do so. Most marketing application will have a success rate (often called conversion rate) far below .5 and a fairly limited information set. In that case for most or even all customer the best prediction will be to predict non-conversion for every customer. However, even if no customer might have a predicted likelihood greater than .5, it can be fruitful for marketing to know if that probability is, say, .01 or 0.4.}

\begin{equation}
P(y|I) = f(I)
\end{equation}


There are plently of algorithms that could be used to estimate the function. Logistic regression is often chosen as it is easy to implement and the model itself might provide some insights. Here, we will focus not on the implementation part, but on the interpretation and (mis-) use of the model.

To see why the model might not be want you think it is, we will have a
A naive usage of the model is to focus marketing on customers with high likelhood to do the action. This however, can be serverly misleading, as we will discuss next. To show this, we will start with an ideal assumption: our model is perfect. A perfect model means that we predict the customer action correctly for every customer and the model produces predicted probabilies which are well calibrated. This means that we only get two predictions, either a customer will do action with estimated probability 0 or whether they will do so with probability 1 - and the model is always right.
However, although we have the best possible model, it illustrates well why the naive interpreation cannot be correct. If we focus our marketing on those customers with highest propensity (as there are only two values it is those with predicted probability 1), we focus our attention on a customer group that buys the product anyways. In fact, these are the customers that we should *least* focus on as the best we can do is to have no effect on those customers (but we still have the cost of the marketing intervention, which might be an opportunity cost) and in some case we might even affect the customer adversely (as they might be annoyed by the marketing). Hence, we're left with the second group of customers, those with predicted probability of 0. In this group, there might be some who will be convinced to buy the product after being exposed to the marketing, but we are not able to say which ones. Even after doing an experiment, we will not improve on our decision rule. Say, we run an A/B test on all customers who were predicted to not buy, and we estimate that 0.02
Depending on the situation, this model might not be very useful. The only thing that we learned from the model is that we should exclude those customers with highest probability from our marketing. This runs counter to our intuition. Furthermore, in many applications, the action might be a rare event, with likelihoods not much higher than 1%. Excluding these customers from marketing might not save a lot of money in the first place, and establishing a system where you're able to provide different marketing on customer-level might have some fixed costs (e.g. it might require to store and process customer-level data and deploy the model-outputs to production systems).

\footnote{Another issue that might arise in this context is the (monetary) value expected to be gained from the marketing intervention. As customers who are convinced by marketing to buy a product might fundamentally differ from customers who do so naturally, the might have e.g. higher return rates or more contacts with customer service. Hence, estimating the monetary value each gained customer might in itself be a non-trivial problem.}