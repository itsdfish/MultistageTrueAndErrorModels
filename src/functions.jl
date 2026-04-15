"""
$(TYPEDSIGNATURES)

Computes the joint probability for all 16 response categories.
    
# Arguments

- `dist::MultistageTrueErrorModel{T}`: a distribution object for a True and Error Model of multistage decision making.

# Output 

- `θ::Vector{T}`: vector of joint response probabilities for the following response patterns across the four blocks:

1.  BBBB
2.  FBBB
3.  BFBB
4.  FFBB
5.  BBFB
6.  FBFB
7.  BFFB
8.  FFFB
9.  BBBF
10. FBBF
11. BFBF
12. FFBF
13. BBFF
14. FBFF
15. BFFF
16. FFFF

where B corresponds to a response pattern consistent with backward induction, F corresponds to a response pattern consistent with forward induction, and the 
position of each element corresponds to block ID.

# Example 

```julia 
using MultistageTrueAndErrorModels

model = MultistageTrueErrorModel(;
    b = 0.3,
    sb = 0.4,
    sf = 0.2,
    ϵ = [0.05, 0.06, 0.07, 0.08]
)
probs = compute_probs(model)
```
"""
function compute_probs(dist::MultistageTrueErrorModel{T}) where {T}
    (; b, sb, sf, ϵ) = dist
    ϵ₁, ϵ₂, ϵ₃, ϵ₄ = ϵ
    θ = zeros(T, 16)

    # 1 1 1 1
    θ[1] =
        b * (1 - ϵ₁) * (1 - ϵ₂) * sb * (1 - ϵ₃) * (1 - ϵ₄) +
        b * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sb) * ϵ₃ * ϵ₄ +
        (1 - b) * ϵ₁ * ϵ₂ * sf * ϵ₃ * ϵ₄ +
        (1 - b) * ϵ₁ * ϵ₂ * (1 - sf) * (1 - ϵ₃) * (1 - ϵ₄)

    # 0 1 1 1
    θ[2] =
        b * ϵ₁ * (1 - ϵ₂) * sb * (1 - ϵ₃) * (1 - ϵ₄) +
        b * ϵ₁ * (1 - ϵ₂) * (1 - sb) * ϵ₃ * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * sf * ϵ₃ * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * (1 - sf) * (1 - ϵ₃) * (1 - ϵ₄)

    # 1 0 1 1
    θ[3] =
        b * (1 - ϵ₁) * ϵ₂ * sb * (1 - ϵ₃) * (1 - ϵ₄) +
        b * (1 - ϵ₁) * ϵ₂ * (1 - sb) * ϵ₃ * ϵ₄ +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * sf * ϵ₃ * ϵ₄ +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * (1 - sf) * (1 - ϵ₃) * (1 - ϵ₄)

    # 0 0 1 1
    θ[4] =
        b * ϵ₁ * ϵ₂ * sb * (1 - ϵ₃) * (1 - ϵ₄) +
        b * ϵ₁ * ϵ₂ * (1 - sb) * ϵ₃ * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * sf * ϵ₃ * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sf) * (1 - ϵ₃) * (1 - ϵ₄)

    # 1 1 0 1
    θ[5] =
        b * (1 - ϵ₁) * (1 - ϵ₂) * sb * ϵ₃ * (1 - ϵ₄) +
        b * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sb) * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * ϵ₁ * ϵ₂ * sf * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * ϵ₁ * ϵ₂ * (1 - sf) * ϵ₃ * (1 - ϵ₄)

    # 0 1 0 1
    θ[6] =
        b * ϵ₁ * (1 - ϵ₂) * sb * ϵ₃ * (1 - ϵ₄) +
        b * ϵ₁ * (1 - ϵ₂) * (1 - sb) * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * sf * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * (1 - sf) * ϵ₃ * (1 - ϵ₄)

    # 1 0 0 1
    θ[7] =
        b * (1 - ϵ₁) * ϵ₂ * sb * ϵ₃ * (1 - ϵ₄) +
        b * (1 - ϵ₁) * ϵ₂ * (1 - sb) * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * sf * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * (1 - sf) * ϵ₃ * (1 - ϵ₄)

    # 0 0 0 1
    θ[8] =
        b * ϵ₁ * ϵ₂ * sb * ϵ₃ * (1 - ϵ₄) +
        b * ϵ₁ * ϵ₂ * (1 - sb) * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * sf * (1 - ϵ₃) * ϵ₄ +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sf) * ϵ₃ * (1 - ϵ₄)

    # 1 1 1 0
    θ[9] =
        b * (1 - ϵ₁) * (1 - ϵ₂) * sb * (1 - ϵ₃) * ϵ₄ +
        b * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sb) * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * ϵ₂ * sf * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * ϵ₂ * (1 - sf) * (1 - ϵ₃) * ϵ₄

    # 0 1 1 0
    θ[10] =
        b * ϵ₁ * (1 - ϵ₂) * sb * (1 - ϵ₃) * ϵ₄ +
        b * ϵ₁ * (1 - ϵ₂) * (1 - sb) * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * sf * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * (1 - sf) * (1 - ϵ₃) * ϵ₄

    # 1 0 1 0
    θ[11] =
        b * (1 - ϵ₁) * ϵ₂ * sb * (1 - ϵ₃) * ϵ₄ +
        b * (1 - ϵ₁) * ϵ₂ * (1 - sb) * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * sf * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * (1 - sf) * (1 - ϵ₃) * ϵ₄

    # 0 0 1 0
    θ[12] =
        b * ϵ₁ * ϵ₂ * sb * (1 - ϵ₃) * ϵ₄ +
        b * ϵ₁ * ϵ₂ * (1 - sb) * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * sf * ϵ₃ * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sf) * (1 - ϵ₃) * ϵ₄

    # 1 1 0 0
    θ[13] =
        b * (1 - ϵ₁) * (1 - ϵ₂) * sb * ϵ₃ * ϵ₄ +
        b * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sb) * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * ϵ₂ * sf * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * ϵ₂ * (1 - sf) * ϵ₃ * ϵ₄

    # 0 1 0 0
    θ[14] =
        b * ϵ₁ * (1 - ϵ₂) * sb * ϵ₃ * ϵ₄ +
        b * ϵ₁ * (1 - ϵ₂) * (1 - sb) * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * sf * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * ϵ₂ * (1 - sf) * ϵ₃ * ϵ₄

    # 1 0 0 0
    θ[15] =
        b * (1 - ϵ₁) * ϵ₂ * sb * ϵ₃ * ϵ₄ +
        b * (1 - ϵ₁) * ϵ₂ * (1 - sb) * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * sf * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * ϵ₁ * (1 - ϵ₂) * (1 - sf) * ϵ₃ * ϵ₄

    # 0 0 0 0
    θ[16] =
        b * ϵ₁ * ϵ₂ * sb * ϵ₃ * ϵ₄ +
        b * ϵ₁ * ϵ₂ * (1 - sb) * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * sf * (1 - ϵ₃) * (1 - ϵ₄) +
        (1 - b) * (1 - ϵ₁) * (1 - ϵ₂) * (1 - sf) * ϵ₃ * ϵ₄
    return θ
end
