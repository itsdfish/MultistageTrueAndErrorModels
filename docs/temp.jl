cd(@__DIR__)
using Pkg
Pkg.activate("")
using MultistageTrueAndErrorModels
using Random
using StatsPlots
using Turing
Random.seed!(685)

model = MultistageTrueErrorModel(;
    b = 0.3,
    sb = 0.4,
    sf = 0.2,
    ϵ = fill(0.1, 4)
)

data = rand(model, 200)

@model function model1(data::Vector{<:Integer})
    b ~ Uniform(0, 1)
    sb ~ Uniform(0, 1)
    sf ~ Uniform(0, 1)
    ϵ ~ Uniform(0, 0.5)
    ϵ′ = fill(ϵ, 4)

    data ~ MultistageTrueErrorModel(; b, sb, sf, ϵ = ϵ′)
    return (; b, sb, sf, ϵ = ϵ′)
end

chains = sample(model1(data), NUTS(1000, 0.65), MCMCThreads(), 1000, 4)

post_plot = plot(chains, grid = false)
vline!(
    post_plot,
    [missing 0.3 missing 0.4 missing 0.2 missing 0.10],
    color = :black,
    linestyle = :dash
)
