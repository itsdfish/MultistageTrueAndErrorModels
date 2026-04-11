function Base.show(io::IO, ::MIME"text/plain", model::MultistageTrueErrorModel)
    T = typeof(model)
    model_name = string(T.name.name)
    column_labels = [
        [MultiColumn(3, "p"), MultiColumn(4, "ϵ")],
        ["b", "cb", "cf", "ϵ₁", "ϵ₂", "ϵ₃", "ϵ₄"]
    ]
    return pretty_table(
        io,
        [model.b; model.cb; model.cf; model.ϵ]';
        title = model_name,
        column_label_alignment = :c,
        column_labels = column_labels,
        compact_printing = false,
        formatters = [fmt__printf("%5.2f", [2,])],
        alignment = :c
    )
end

"""
    get_response_labels()

Returns a vector of response pattern labels.
"""
function get_response_labels(::MultistageTrueErrorModel)
    labels = [
        "B B B B"
        "B̅ B B B"
        "B B̅ B B"
        "B̅ B̅ B B"
        "B B B̅ B"
        "B̅ B B̅ B"
        "B B̅ B̅ B"
        "B̅ B̅ B̅ B"
        "B B B B̅"
        "B̅ B B B̅"
        "B B̅ B B̅"
        "B̅ B̅ B B̅"
        "B B B̅ B̅"
        "B̅ B B̅ B̅"
        "B B̅ B̅ B̅"
        "B̅ B̅ B̅ B̅"
    ]
end
