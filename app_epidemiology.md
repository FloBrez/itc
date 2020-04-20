## Epidemiology

Inspired by the SARS-CoV-2 epidemic of 2020, let's have a look at a causal model for aggregate epidemiological data. During the epidemic, the numbers of infected and deceased have been widely reported in news outlets throughout the world and (especially in the beginning) have been closely monitored by millions on a daily basis. Soon, the reported numbers have raised many questions as they suggested wildly different conclusions about the virus' lethality across countries. While the WHO reported a case-fatality-rate (CFR) of 3.5%, some countries reported CFRs as low as 0.3%. Differences in pogress of the pandemic, demographics, and the availability of intensive-cars-units (ICU) would suggest *some* differences, but a deviation by an order of magnitude seemed unlikely

The differences in reported numbers and statistics are understood to be substantially driven by differences in the data generation process, especially the mechanism of who is subjected to a test for the virus. While South Korea adopted a strategy of widespread testing of the population, others only tested when patients showed (severe forms) of associated symptoms and/or recent contact with known infected people.

To illustrate this, we will model parts of the data generating process as causal mechanisms, allowing us to reason about the effects of different testing strategies on reported numbers, how we can estimate the number of patients who died *because* of the virus rather than died *with* the virus, and how government measures (lockdown) fit into this model.

In a second part, we swith focus a little bit and take a closer look at the dynamics of the pandemic. We show how dynamic systems can be represented in causal graphs and causal assigments. We will use this to have a closer look at different types of interventions in dynamical settings, primarily between one-time interventions and permanent interventions. Lastly, we shortly discuss the relation between unit-level models and models for aggregate variables.

### The reporting mechanism

A crucial statistic in epidemiology is the CFR, the proportion of deaths from a certain infection compared to the total number of those diagnosed with the disease for a certain period of time. It is a measure risk measure as its definition guarantees that the value is always between 0 and 1. Although widely used in the medical literature and beyond, it is a problematic concept. Often used to compare severities of different diseases and viruses, its definition does not account for potentially large differences in the process generating the numerator and denominator of the statistic. During the SARS-CoV-2 outbreak, limited testing capabilities and large amount of asymptomatic cases dramatically suppressed the reported number of infected, distorting comparisons with similar better known viruses such as the influenza. A more robust statistic is the infection fatality rate (IFR), which uses the number of *infected* rather than *diagnosed* individuals in its denominator (but of course cannot be observed directly). We will discuss this in a minute.

The CFR (as well as the IFR) is furthermore problematic as it is often treated as an attribute of the virus itself (at least for a given population). This neglects the crucial fact that for many diseases, treatments might be available that save lives of many patients. If, as it was the case during the onset of the SARS-CoV-2 pandemic, a major concern is the availability of treatment resources (especially ICU units), distinguishing between a CFRs *with* and *without treatment* is important to avoid confusion. [^footnote-app-epidem-flu]

[^footnote-app-epidem-flu]: Early numbers suggested that, after accounting for asymptomatic and untested cases, the SARS-CoV-2 virus might be similarly fatal as the influenza. This conclusion often neglected the fact that influenza-patients usually get the full treatment, but that faster spreading of SARS-CoV-2 might concentrate severe cases to a shorter time period, overwhelming the capaicities for treatment and therefore increasing the CFR.

To dive deeper into this problem, let's take a look at a causal graph for the generation of these observable numbers and statistics. For simplicity, we will present the causal graph as a summary graph, where we neglect the inherent time structure of the mechanism. This does not cause any problems for causal reasoning, as the summary graph is still remains acyclic. However, to make inferences based on observed data, we will later on take a look at the full time graph as well.

![DAG of the process generating data on infected and deceased individuals due to SARS-CoV-2](images/dag_app_epidem1.png)

While the causal graph might be a reasonable description for the reporting mechanism across countries and over time, the details of the causal relationships certainly were neither time-constant nor identical across coutries. Below we describe the situation as it likely existed in March of 2020 in Germany as an example:

* For an individual to be reported to be infected with SARS-CoV-2, there are two main causal influneces: whether the person is in fact infected with that virus and whether a PCR test was performed. If we assume that the PCR test used is perfect (i.e. has no type I error nor a type II error), we can model this relationship deterministically as $ReportedInfection := f(Test, Infection)$. Note that the assumption of a perfect test also allows us to disregard any causal influence from $OtherInfection$ to $ReportedInfection$, which would be the case if the test accidently would show positive outcomes in cases where the person does not have SARS-CoV-2, but a similar infection (e.g. other corona viruses), a problem of early antibody tests.
* In Germany, an individual is tested for SARS-CoV-2 if they are symptomatic and/or have had recent contact with a person known to be SARS-CoV-2-positive. Again, for simplicity, we assume that this is a strict rule-based (and stable) mechanism.[^footnote-test-mechanism] The structural assigment is $Test := g(Symptoms, ContactInfected)$.

[^footnote-test-mechanism]: In reality, this assumption was violated. Over the course of the epidemic, testing capabilities have increased in most countries and tests have been expanded over time. In some countries and regions, asymptomatic persons have been tested as well, even if there was no known contact with another infected person. We discuss this in more detail when we take a look at the full time graph of the model.

* A person's symptoms are determined by them being infected by the SARS-Cov-2 virus, other viruses causing respiratory diseases, age, pre-existing conditions, as well as other unspecified and unobserved factors (e.g. genetics). The assignment is
\begin{equation}
Symptoms := h(Infection, InfectionOther, Age, PreCondition, U)
\end{equation}
and the assignment is probabilistic due to $U$ being treated as a noise term. As we define symptoms to include the value "death", this mechanisms has to fully explain a person's likelihood to die with and without the virus.

* The infection mechanism is modelled as a probablistic function of personal hygiene and exposure to the virus:
\begin{equation}
Infection := h(Hygiene, Exposure, V)
\end{equation}

* finally, a person is reported to have died of SARS-CoV-2 if the person has been positively tested for the virus and has died (one of the possible values of the symptom):
\begin{equation}
ReportedDeath := h(ReportedInfection, Symptoms)
\end{equation}
We assume this to be a simple and deterministic mechanism.

#### Reasoning about interventions and counterfactuals
The model now allows us to reason about certain interventions that affect the reported numbers of infected and deceased.

##### No virus
The most important one is certainly the counterfactual question of what would happen if there were no SARS-CoV-2 virus out there, which serves as a baseline model that allows us to compare the pandemic situation to a "normal" one.
Technically, this amounts to replacing the assignment for variable $Infection$ to
\begin{equation}
Infection := 0
\end{equation}
As this is just a hypothetical intervention, let us assume that it is atomic, i.e. we assume that the rest of the model is not changed by this intervention. Most importantly, the assignment $Symptoms := h(Infection, InfectionOther, Age, PreCondition, U)$ is still in place, it's just that the value of one of the inputs is $0$ in the entire population.
As $Symptoms$ was defined to be a categorical variable including the value "death", we can use the model to compare two distributions in the population, one with and one without the virus. The difference tells us the additional deaths due to SARS-CoV-2 virus rather than just the numer of deaths associated with SARS-CoV-2 (which is what $ReportedDeath$ is capturing). This information is important because we ultimately want to understand how deadly the disease acutally is, i.e. how many deaths it causes, not just how prevalent it is in people how are dying. With the median age of reported deaths with the virus being at around 80 and the probability of a person at 80 to die within 12 months being at around 5%, this is non-negligible.

##### Changing testing strategy
expanding test capacities
comparing numbers across countries with (very) different test strategies
random testing

### Evolving Symptoms

To model the evolution of symptoms over time, we need to switch from a time series summary graph to a full time graph.
