cd(@__DIR__)
using Pkg
Pkg.activate("")
using MultistageTrueAndErrorModels
using Random
using StatsPlots
using Turing
using TuringUtilities
Random.seed!(4032)

model = MultistageTrueErrorModel(;
    b = 0.3,
    sb = 0.1,
    sf = 0.9,
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
