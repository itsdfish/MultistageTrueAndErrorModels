using MultistageTrueAndErrorModels
using Documenter

DocMeta.setdocmeta!(MultistageTrueAndErrorModels, :DocTestSetup, :(using MultistageTrueAndErrorModels); recursive=true)

makedocs(;
    modules=[MultistageTrueAndErrorModels],
    authors="itsdfish <itsdfish@gmail.com> and contributors",
    sitename="MultistageTrueAndErrorModels.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
