function Base.show(io::IO, ::MIME"text/plain", model::MultistageTrueErrorModel)
    T = typeof(model)
    model_name = string(T.name.name)
    column_labels = [
        [MultiColumn(3, "p"), MultiColumn(4, "ϵ")],
        ["b", "sb", "sf", "ϵ₁", "ϵ₂", "ϵ₃", "ϵ₄"]
    ]
    return pretty_table(
        io,
        [model.sb; model.sf; model.sf; model.ϵ]';
        title = model_name,
        column_label_alignment = :c,
        column_labels = column_labels,
        compact_printing = false,
        formatters = [fmt__printf("%5.2f", [2,])],
        alignment = :c
    )
end

"""
    get_response_labels(::MultistageTrueErrorModel)

Returns a vector of response pattern labels.
"""
function get_response_labels(::MultistageTrueErrorModel)
    labels = [
        "BBBB"
        "FBBB"
        "BFBB"
        "FFBB"
        "BBFB"
        "FBFB"
        "BFFB"
        "FFFB"
        "BBBF"
        "FBBF"
        "BFBF"
        "FFBF"
        "BBFF"
        "FBFF"
        "BFFF"
        "FFFF"
    ]
end
