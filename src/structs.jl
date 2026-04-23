"""
$(TYPEDEF)

A True and Error Model of backward vs.forward induction strategy in a two stage sequential decision making
task (Deng et al., 2026). 

# Fields 

- `b::T`: the probability of using backward induction 
- `sb::T`: the probability of continuing a backward induction strategy in blocks 3 and 4
- `sf::T`: the probability of continuing a forward induction strategy in blocks 3 and 4
- `ϵ::AbstractVector{T}`: a vector of error probabilities with elements `ϵ = [ϵ₁, ϵ₂, ϵ₃, ϵ₄]` where `ϵᵢ ≤ .50`
    and `i` indexes the block id.

# Example 

```julia 
using MultistageTrueAndErrorModels

model = MultistageTrueErrorModel(;
    b = 0.1,
    sb = 0.8,
    sf = 0.4,
    ϵ = [0.1, 0.04, 0.02, 0.03]
)

data = rand(model, 200)
logpdf(model, data)
```

# Documentation 

Full documentation can be found at https://itsdfish.github.io/MultistageTrueAndErrorModels.jl/dev/

# References

Birnbaum, M. H., & Quispe-Torreblanca, E. G. (2018). TEMAP2. R: True and error model analysis program in R. Judgment and Decision Making, 13(5), 428-440.

Deng, W., Kellen, D., & Hotaling, J. M. (2026). Toward the cognitive modeling of dynamic decision making. Psychonomic Bulletin & Review, 33(4), 127.

Lee, M. D. (2018). Bayesian methods for analyzing true-and-error models. Judgment and Decision Making, 13(6), 622-635.
"""
struct MultistageTrueErrorModel{T <: Real} <: AbstractTrueErrorModel{T}
    b::T
    sb::T
    sf::T
    ϵ::AbstractVector{T}

    function MultistageTrueErrorModel(
        b::T,
        sb::T,
        sf::T,
        ϵ::AbstractArray{T}
    ) where {T <: Real}
        @argcheck all((ϵ .≥ 0) .&& (ϵ .≤ 0.5))
        @argcheck b ≤ 1 && b ≥ 0
        @argcheck sb ≤ 1 && sb ≥ 0
        @argcheck sf ≤ 1 && sf ≥ 0
        return new{T}(b, sb, sf, ϵ)
    end
end

"""
$(TYPEDSIGNATURES)

A constructor for `MultistageTrueErrorModel`.

# Arguments

- `b::T`: the probability of using backward induction 
- `sb::T`: the probability of continuing a backward induction strategy in blocks 3 and 4
- `sf::T`: the probability of continuing a forward induction strategy in blocks 3 and 4
- `ϵ::AbstractVector{T}`: a vector of error probabilities with elements `ϵ = [ϵ₁, ϵ₂, ϵ₃, ϵ₄]` where `ϵᵢ ≤ .50`
    and `i` indexes the block id.
"""
function MultistageTrueErrorModel(b, sb, sf, ϵ)
    b, sb, sf, _ = promote(b, sb, sf, ϵ[1])
    ϵ = convert(Vector{typeof(b)}, ϵ)
    return MultistageTrueErrorModel(b, sb, sf, ϵ)
end

"""
$(TYPEDSIGNATURES)

A constructor for `MultistageTrueErrorModel`.

# Keywords

- `b::T`: the probability of using backward induction 
- `sb::T`: the probability of continuing a backward induction strategy in blocks 3 and 4
- `sf::T`: the probability of continuing a forward induction strategy in blocks 3 and 4
- `ϵ::AbstractVector{T}`: a vector of error probabilities with elements `ϵ = [ϵ₁, ϵ₂, ϵ₃, ϵ₄]` where `ϵᵢ ≤ .50`
    and `i` indexes the block id.
"""
function MultistageTrueErrorModel(; b, sb, sf, ϵ)
    return MultistageTrueErrorModel(b, sb, sf, ϵ)
end
