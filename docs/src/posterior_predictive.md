```@raw html
<img src="https://raw.githubusercontent.com/itsdfish/TrueAndErrorModels.jl/gh-pages/dev/assets/logo_readme.png" alt="drawing" width="900"/>
```
# Bayesian Parameter Estimation

The purpose of this tutorial is to demonstrate how to generate and plot  posterior predictive distributions of a True and Error Model (TEM; Birnbaum & Quispe-Torreblanca, 2018) of decision strategies in multistage decision making (Deng, et al., 2026) using the [Turing.jl](https://turinglang.org/) package. 

## Full Code 

You can reveal copy-and-pastable version of the full code by clicking the ▶ below.

```@raw html
<details>
<summary><b>Show Full Code</b></summary>
```
```julia
using MultistageTrueAndErrorModels
using Random
using StatsPlots
using Turing
using TuringUtilities
Random.seed!(4032)

model = MultistageTrueErrorModel(;
    b = 0.3,
    sb = 0.9,
    sf = 0.1,
    ϵ = fill(0.1, 4)
)

n_sim = 200

data = rand(model, n_sim)

@model function model1(data::Vector{<:Integer})
    b ~ Uniform(0, 1)
    sb ~ Uniform(0, 1)
    sf ~ Uniform(0, 1)
    ϵ ~ Uniform(0, 0.5)
    ϵ′ = fill(ϵ, 4)

    data ~ MultistageTrueErrorModel(; b, sb, sf, ϵ = ϵ′)
    return (; b, sb, sf, ϵ = ϵ′)
end

turing_model = model1(data)
chains = sample(turing_model, NUTS(1000, 0.65), MCMCThreads(), 1000, 4)

pred_model = predict_distribution(;
    simulator = Θ -> rand(MultistageTrueErrorModel(; Θ...), n_sim),
    model = turing_model,
    func = x -> x ./ sum(x)
)

post_preds = generated_quantities(pred_model, chains)
post_preds = stack(post_preds, dims = 1)

labels = get_response_labels(model)
violin(
    post_preds,
    xticks = (1:length(labels), labels),
    ylabel = "Response Probability",
    leg = false,
    grid = false,
    xrotation = 90,
    dpi = 300
)
scatter!(1:16, data ./ sum(data), color = :black) 
```
```@raw html
</details>
```

## Load Packages

The first step is to load the required packages. You will need to install each package in your local
environment in order to run the code locally. We will also set a random number generator so that the results are reproducible.

```julia
using Random
using StatsPlots
using TrueAndErrorModels
using Turing
using TuringUtilities
Random.seed!(6521)
```

## Generate Data

For a description of the decision making task, please see the description in the [model overview](https://itsdfish.github.io/TrueAndErrorModels.jl/dev/overview/). In the code block below, we will create a model object and generate response pattern counts from 200 simulated subjects. 
```julia
model = MultistageTrueErrorModel(;
    b = 0.3,
    sb = 0.9,
    sf = 0.1,
    ϵ = fill(0.1, 4)
)

n_sim = 200

data = rand(model, n_sim)
```
```julia
16-element Vector{Int64}:
 88
 12
  8
  4
  ⋮
  2
  2
  4
  7
```

 ## Estimate the Parameters

In the code block below, we will define the Bayesian model and create a model object called `turing_model` which is used for parameter estimation and posterior prediction. Note that if you develop a custom model, it must return a `NamedTuple` of parameters in order to generate predictive distributions, as illustrated below. 
```julia
@model function model1(data::Vector{<:Integer})
    b ~ Uniform(0, 1)
    sb ~ Uniform(0, 1)
    sf ~ Uniform(0, 1)
    ϵ ~ Uniform(0, 0.5)
    ϵ′ = fill(ϵ, 4)

    data ~ MultistageTrueErrorModel(; b, sb, sf, ϵ = ϵ′)
    return (; b, sb, sf, ϵ = ϵ′)
end

turing_model = model1(data)
```

## Generate Posterior Predictive Model

The code block below creates a model for generating a predictive distribution. The inputs for `predict_distribution` are defined as follows:

- `simulator`: a function that generates simulated data from the model
- `model`: a Turing model with data attached 
- `func`: an arbitrary function applied to the simulated data. In this case, the simulated data are     normalized as response probabilities. 

```julia 
pred_model = predict_distribution(;
    simulator = Θ -> rand(MultistageTrueErrorModel(; Θ...), n_sim),
    model = turing_model,
    func = x -> x ./ sum(x)
)
```

## Generate Predictive Distribution

The next step is to call `generated_quantities` to sample from the predictive distribution. If you passed `Prior()` to `sample` above, a prior predictive distribution will be used. Otherwise, it will generate a
posterior predictive distribution. The second line of code combines the four chains for each response pattern. Each row corresponds to a posterior predictive sample, and each column corresponds to a different response pattern. 
```julia
post_preds = generated_quantities(pred_model, chains)
post_preds = stack(post_preds, dims = 1)
```
```julia
4000×16 Matrix{Float64}:
 0.25   0.04   0.05   0.47   0.01   0.005  0.015  0.03   0.02   0.005  0.015  0.025  0.02   0.01   0.005  0.03
 0.24   0.035  0.05   0.495  0.005  0.0    0.005  0.045  0.01   0.0    0.005  0.045  0.02   0.01   0.005  0.03
 0.24   0.06   0.05   0.435  0.03   0.005  0.005  0.04   0.02   0.005  0.01   0.05   0.025  0.005  0.0    0.02
 0.275  0.075  0.04   0.37   0.035  0.0    0.015  0.06   0.02   0.0    0.005  0.05   0.005  0.01   0.005  0.035
 0.19   0.06   0.045  0.505  0.01   0.005  0.0    0.05   0.03   0.0    0.005  0.035  0.035  0.005  0.0    0.025
 0.275  0.055  0.07   0.405  0.035  0.015  0.0    0.03   0.025  0.0    0.01   0.02   0.015  0.0    0.005  0.04
 0.24   0.045  0.085  0.48   0.025  0.0    0.005  0.015  0.03   0.0    0.005  0.045  0.01   0.0    0.0    0.015
 ⋮                                  ⋮                                  ⋮                                  ⋮
 0.25   0.07   0.075  0.405  0.02   0.01   0.005  0.05   0.02   0.0    0.0    0.04   0.025  0.015  0.0    0.015
 0.185  0.075  0.05   0.495  0.035  0.005  0.01   0.04   0.01   0.0    0.005  0.03   0.02   0.005  0.0    0.035
 0.17   0.04   0.08   0.475  0.035  0.01   0.015  0.055  0.02   0.0    0.005  0.045  0.035  0.005  0.0    0.01
 0.225  0.065  0.05   0.46   0.04   0.005  0.0    0.035  0.015  0.0    0.005  0.02   0.03   0.01   0.0    0.04
 0.255  0.045  0.04   0.39   0.015  0.005  0.0    0.085  0.035  0.005  0.02   0.04   0.01   0.0    0.005  0.05
 0.22   0.095  0.035  0.475  0.015  0.0    0.0    0.035  0.015  0.015  0.0    0.025  0.045  0.005  0.005  0.015
```
 ## Plot Predictive Distributions

Lastly, we will plot the posterior predictive distributions as violin plots. The first line of code gets a pre-made vector of response category labels. The function `violin` generates a violin plot and rotates the response category labels by 90 degrees for readability. The final line of code plots the data as black dots. As expected, the data are typically located near the bulk of the posterior predictive density. 

```julia
labels = get_response_labels(model)
violin(
    post_preds,
    xticks = (1:length(labels), labels),
    ylabel = "Response Probability",
    leg = false,
    grid = false,
    xrotation = 90,
    dpi = 300
)
scatter!(1:16, data ./ sum(data), color = :black) 
```

 ![](assets/posterior_predictive_distribution.png)