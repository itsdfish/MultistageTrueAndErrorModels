```@raw html
<img src="https://raw.githubusercontent.com/itsdfish/TrueAndErrorModels.jl/gh-pages/dev/assets/logo_readme.png" alt="drawing" width="900"/>
```

# Overview 

This package implements a True and Error Model (TEM; Birnbaum, & Quispe-Torreblanca, 2018) of a multi-stage decision making task (Deng et al., 2026) in the Julia programming language. In the multi-stage decision making task, subjects make two sequential decisions which can be represented as a decision tree. A fundamental research question is whether people employ backward induction or forward iduction as a decision making strategy. Answering this question is difficult because observed responses are a mixture of one's prefered strategy and various sources of error. TEM is a mathematical framework for distinguishing between true preferences and errors in decision making. For more details, see the section titled *Model Overview*. See [TrueAndErrorModels.jl](https://itsdfish.github.io/TrueAndErrorModels.jl/dev/) for an example applied to binary choices. 

## Key Features

One of the most valuable benefits of MultistageTrueAndErrorModels.jl is its seemless integration with the Julia ecosystem. Key examples include

- [Distributions.jl](https://juliastats.org/Distributions.jl/latest/): a common interface for probability distributions, including probability density functions, cumulative distribution functions, means etc. 
- [Turing.jl](https://turinglang.org/docs/tutorials/docs-00-getting-started/index.html): an ecosystem for Bayesian parameter estimation, maximum likelihood estimation, variational inference and more.
- [Pigeons.jl](https://pigeons.run/dev/): a package for Bayes factors and Bayesian parameter estimation, specializing with intractible, multimodal posterior distributions. Pigeons.jl is compatible with Turing.jl.

# References

Birnbaum, M. H., & Quispe-Torreblanca, E. G. (2018). TEMAP2. R: True and error model analysis program in R. Judgment and Decision Making, 13(5), 428-440.

Deng, W., Kellen, D., & Hotaling, J. M. (2026). Toward the cognitive modeling of dynamic decision making. Psychonomic Bulletin & Review, 33(4), 127.

Lee, M. D. (2018). Bayesian methods for analyzing true-and-error models. Judgment and Decision Making, 13(6), 622-635.