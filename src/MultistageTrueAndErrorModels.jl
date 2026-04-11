module MultistageTrueAndErrorModels

using ArgCheck
using Distributions
using PrettyTables
using TrueAndErrorModels

import TrueAndErrorModels: compute_probs
import TrueAndErrorModels: get_response_labels

export MultistageTrueErrorModel
export compute_probs
export get_response_labels
export logpdf
export rand

include("structs.jl")
include("functions.jl")
include("utilities.jl")
end
