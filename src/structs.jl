"""
    MultistageTrueErrorModel{T <: Real} <: AbstractErrorModel{T}

A model object for a True and Error Model of Allias Paradox. Two choice sets are presented twice during the same session, 
meaning 4 choices are made in total. Subscript r represents risky, subscript s represents safe, and subscripts 1 and 2
represent choice set. For example, `pᵣᵣ` represents the probability of truely prefering the risky option in both choice sets
and `ϵₛ₁` represents the error probability of choosing safe given a true preference for risky in first choice set. 

# Fields 

- `p::AbstractVector{T}`: a vector of true preference state probabilities with elements `p = [pᵣᵣ, pᵣₛ, pₛᵣ, pₛₛ]`, such that sum(p) = 1. 
- `ϵ::AbstractVector{T}`: a vector of error probabilities with elements `ϵ = [ϵₛ₁, ϵₛ₂, ϵᵣ₁, ϵᵣ₂]`.


# Constructors

MultistageTrueErrorModel(p, ϵ)

MultistageTrueErrorModel(; p, ϵ)

# Example 

```julia 
using TrueAndErrorModels

dist = MultistageTrueErrorModel(; p = [0.60, .30, .05, .05], ϵ = fill(.10, 4))
data = rand(dist, 200)
logpdf(dist, data)
```

# Documentation 

Full documentation can be found at https://itsdfish.github.io/TrueAndErrorModels.jl/dev/

# References

Birnbaum, M. H., & Quispe-Torreblanca, E. G. (2018). TEMAP2. R: True and error model analysis program in R. Judgment and Decision Making, 13(5), 428-440.

Lee, M. D. (2018). Bayesian methods for analyzing true-and-error models. Judgment and Decision Making, 13(6), 622-635.
"""
struct MultistageTrueErrorModel{T <: Real} <: AbstractTrueErrorModel{T}
    b::T
    cb::T
    cf::T
    ϵ::AbstractVector{T}

    function MultistageTrueErrorModel(
        b::T,
        cb::T,
        cf::T,
        ϵ::AbstractArray{T}
    ) where {T <: Real}
        @argcheck all((ϵ .≥ 0) .&& (ϵ .≤ 0.5))
        @argcheck b ≤ 1 && b ≥ 0
        @argcheck cb ≤ 1 && cb ≥ 0
        @argcheck cf ≤ 1 && cf ≥ 0
        return new{T}(b, cb, cf, ϵ)
    end
end

function MultistageTrueErrorModel(b, cb, cf, ϵ)
    b, cb, cf, _ = promote(b, cb, cf, ϵ[1])
    ϵ = convert(Vector{typeof(b)}, ϵ)
    return MultistageTrueErrorModel(b, cb, cf, ϵ)
end

function MultistageTrueErrorModel(; b, cb, cf, ϵ)
    return MultistageTrueErrorModel(b, cb, cf, ϵ)
end
