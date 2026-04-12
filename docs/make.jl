using Documenter
using NamedArrays
using MultistageTrueAndErrorModels
using Turing

makedocs(
    warnonly = true,
    sitename = "MultistageTrueAndErrorModels",
    format = Documenter.HTML(
        assets = [
            asset(
            "https://fonts.googleapis.com/css?family=Montserrat|Source+Code+Pro&display=swap",
            class = :css
        )
        ],
        collapselevel = 1
    ),
    modules = [
        MultistageTrueAndErrorModels,
        #Base.get_extension(MultistageTrueAndErrorModels, :TuringExt),
        #Base.get_extension(MultistageTrueAndErrorModels, :NamedArraysExt)
    ],
    pages = [
        "Home" => "index.md",
        "Model Overview" => "overview.md",
        "Bayesian Parameter Estimation" => "parameter_estimation.md",
        "Predictive Distributions" => "posterior_predictive.md",
        "API" => "api.md"
    ]
)

deploydocs(repo = "github.com/itsdfish/MultistageTrueAndErrorModels.jl.git")
