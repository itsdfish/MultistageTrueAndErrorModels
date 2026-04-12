using SafeTestsets
@safetestset "compute_probs" begin
    @safetestset "1" begin
        using MultistageTrueAndErrorModels
        using Test

        model = MultistageTrueErrorModel(;
            b = 0.3,
            sb = 0.4,
            sf = 0.2,
            ϵ = [0.05, 0.06, 0.07, 0.08]
        )
        probs = compute_probs(model)

        true_probs = [
            0.094026
            0.0322284
            0.028466
            0.4288796
            0.0189996
            0.003642
            0.0033884
            0.04157
            0.0184764
            0.0038532
            0.0035516
            0.0453188
            0.138498
            0.0142764
            0.014594
            0.1102316
        ]

        @test probs ≈ true_probs atol = 0.002
    end

    @safetestset "2" begin
        using MultistageTrueAndErrorModels
        using Test

        model = MultistageTrueErrorModel(;
            b = 0.1,
            sb = 0.8,
            sf = 0.4,
            ϵ = [0.1, 0.04, 0.02, 0.03]
        )
        probs = compute_probs(model)

        true_probs = [
            0.06777
            0.0257892
            0.052038
            0.4440028
            0.0019332
            0.0009636
            0.0020988
            0.0182044
            0.0024588
            0.001086
            0.0022932
            0.019762
            0.017838
            0.0141612
            0.03357
            0.2960308
        ]

        @test probs ≈ true_probs atol = 0.002
    end

    @safetestset "sum to 1" begin
        using Distributions
        using MultistageTrueAndErrorModels
        using Test

        for _ ∈ 1:100
            model = MultistageTrueErrorModel(;
                b = rand(Uniform(0, 1)),
                sb = rand(Uniform(0, 1)),
                sf = rand(Uniform(0, 1)),
                ϵ = rand(Uniform(0, 0.5), 4)
            )

            probs = compute_probs(model)
            @test sum(probs) ≈ 1
        end
    end
end

@safetestset "rand" begin
    using Random
    using MultistageTrueAndErrorModels
    using Test

    Random.seed!(654)

    model = MultistageTrueErrorModel(;
        b = 0.1,
        sb = 0.8,
        sf = 0.4,
        ϵ = [0.1, 0.04, 0.02, 0.03]
    )

    n_trials = 100_000
    data = rand(model, n_trials)
    probs = data ./ n_trials

    @test sum(probs) ≈ 1
end
