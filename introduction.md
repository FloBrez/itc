# Introduction

> Correlation doesn’t imply causation, but it does waggle its eyebrows suggestively and gesture furtively while mouthing ‘look over there.’
> — Randall Munroe

Causal analysis is a fascinating field. It deals with the fundamental relation between cause and effect in complex environments. Being able to infer what the effect is going to be after doing A versus B is of utmost importance in a wide variety of applications, from policy analysis, drug prescription to marketing. Despite its ubiquity in all disciplines concerned with complex phenomena, the concept of **causality** has eluded a mathematically rigorous treatment for a long time, resulting in puzzling paradoxes and ambiguous statements. Only in recent decades a new formalism has emerged to solve these problems, with main contributors from the computer science and economics departments. The **causal revolution** [@pearl2019] swept away decades of experts and students arguing about the correct interpretation of phenomena such as **Simpson's paradox**, the nature and properties of the **error term in regression equations** and the interpretation of **structural parameters** in SEMs. The revolution established a new regime, which introduced new notation and a unified language, where causal and statistical concepts are finally separated. At last, **correlation** is never again to be confused with **causation**.

"Introduction To Causality" is a gentle introduction into this modern understanding of causality as it unfolded after the revolution. It will help you learn the fundamentals of this art and science of causal analysis. After reading this book, you'll have the tools to understand and communicate causal concepts and you will know how to tackle the common questions. The code in the appendix will help you to apply these methods using the R programming language.

## What you will learn

First we will discuss causality in a trivial lab environment where we are able to control every important aspect of the environment. This will help us get familiar with the vocabulary and notation and will provide some insights in how to think about causality.

Once we have become familiar with the simple setting, we will loosen the assumption that we are able to fully control the environment. At this point, we will introduce causality as a probabilistic concept. Our inability to fully control and understand our environment forces us to settle for a less precise inference on the effects. We can't say what will happen, but we can still provide robust inference on what will happen **on average**. Most importantly, we will see why classical statistical concepts and notation are not sufficient for a rigorous and unambiguous treatment of causality and we will get a sense that there is a fundamental difference between what can be learned from passive observation ("correlation") and active intervention ("causation").

Once we mastered the probabilistic nature of causality we will discuss on how we can **measure** the effect of **actions** in a variety of settings. We will start with the easiest scenario, the randomized controlled trial. It is often considered the gold standard for clinical trials and applied across scientific disciplines. It will serve as a benchmark in our further discussion, where we will look at scenarios that violate the assumption behind the randomized controlled trial: we will discuss observational studies, synthetic cohorts and time series analysis.

After this tour de force, we shift gears and have a closer look at a couple of applications. We will discuss how to measure and interpret the placebo effect in clinical trials, how to optimize marketing using A/B tests and multi-armed bandits, and how to evaluate government interventions.

Finally, I will  wrap up this book by providing some parting thoughts on epistemology and the importance of causality in the evolution of artificial intelligence and machine learning.

These chapters will hopefully provide you with a solid foundation and will allow you to find the right solution for your causal problem. But for most of your problems they will not be enough. Throughout this book we'll point you to resources where you can learn more. The appendix provides some additional material on statistics and programming.

## What you won't learn

There are some important topics that this book doesn't cover. We hope that this book will leave you wanting more and that you will continue in your journey to master causality by going deeper into this topic or by exploring closly related fields and applications that we did not cover in sufficient length.

### Statistics
The book focuses on causal inference rather than statistics. Some basic statistical concepts are discussed in the appendix, but they primarily serve as a refresher. We assume that the reader is  (or has been) familiar with statistics as it is taught in most Statistics 101 classes. Details on estimation methods and properties of estimators (e.g. consistency) are not discussed. We will provide references that provide more details.
We will, however, extensively discuss the differences between these two types of inferences and how they relate. Our discussion on causal inference will, except for the basic introduction, be probabilistic in nature and statistical notation will be used throughout the book. We have summarized information on notation and terminology in CHAPTER XX.

### Machine Learning
We will address issues of machine learning where we see a connection to causal concepts. We do not go deep on any causal and non-causal ML algorithms. The discussion will focus on the discussion of supervised ML versus reinforcement learning.

### Proofs
The book does not contain any proof or any heavy mathematical derivations. We will link to reference material. Despite that, we do intend to be rigorous in argumentation and notation and some discussions might seem overly verbose at first. We believe however that this is necessary, especially to avoid confusion between statistical and causal concepts.

### Type Causality vs Actual Causality
When referring to causality, we will always mean what philosophers typically call *type causality* rather than *actual causality*. The former takes a forward-looking approach by inferring the *effects of causes*. This allows to predict outcome for interventions, e.g. it allows to answer questions like "what will be the outcome if we prescribe this new drug *X* to patients with heart disease". *Actual causality* instead mostly takes a backward look at a given instance and tries to infer *causes of effects*. This allows to answer questions such as "what caused person *Y* to die from heart disease". This type of inference is important if the goal is to assign responsibility, e.g. in a legal case. For a thorough introduction I recommend to take a look at [@halpern2016].

## How this book is organised


## Prerequisites

To get the most out of this book, you should be familiar with basic concepts of statistical analysis, nomeclature and notation. If "expected value", "conditional probability" or "hypothesis test" are only vaguely familiar to you, please review the appendix before digging into the main text.

The code snippets at the end of the book are purely optional. If you want to follow along on these, you need to have R on your computer. To download the software, go to CRAN, the **c**omprehensive **R** **a**rchive **n** etwork. CRAN is composed of a set of mirror servers distributed around the world and is used to distribute R and R packages. Don't try and pick a mirror that's close to you: instead use the cloud mirror, <https://cloud.r-project.org>, which automatically figures it out for you. RStudio is an integrated development environment, or IDE, for R programming. Download and install it from <http://www.rstudio.com/download>.


## Acknowledgements

The book has been compiled from markdown documents using R package bookdown. This package has allowed me to adopt a very flexible workflow where the compilation and publication of an HTML version only takes seconds.


## Links

A free HTML version of this book is available at https://flobrez.github.io/itc/. The markdown sources and supplementary material is available at https://github.com/flobrez/itc.
