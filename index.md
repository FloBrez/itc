---
knit: "bookdown::render_book"
title: "Introduction To Causality: A Modern Approach"
author: ["Florian Brezina"]
description: "A gentle introduction into the art and science of causal inference"
url: 'https://flobrez.github.io/intro_to_causality/'
github-repo: flobrez/itc
site: bookdown::bookdown_site
cover-image: "images/cover.png"
documentclass: book
link-citations: yes
bibliography: ["bib.bib"]
---

# Welcome {-}

This is the HTML version of **"Introduction to Causality: A Moden Approach"**, a gentle but rigorous introduction into the art and science of causal inference. This book covers the basics of causal inference: you will learn

* how **causal inference** differs from **statistical inference** or **prediction**;
* how to express these differences in **unambiguous mathematical notation** and **causal graphs**;
* a variety of techniques to probe causal questions, from **randomized controlled experiments** to **structural equation models**;
* the current scientific edge on causal analysis, including reinforcement learning.

We approach this topic by closely examining most simple scenarios first and build upon those chapter by chapter. Throughout the book, we will use modern notation and language, primarily following Pearl (2000).

The book further contains an extensive appendix containing code snippets in the statistical programming language R as well as auxilliary material on statistics. We hope that this will allow the book to be a good standalone source for all those interested in causality, whether or not they have a solid foundation in statistics.
