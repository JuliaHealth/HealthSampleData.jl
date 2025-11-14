using HealthSampleData
using Test

@testset "HealthSampleData.jl" begin
    @test isa(HealthSampleData.Test, Function)
    @test hasmethod(HealthSampleData.Test, Tuple{})

    @test isa(HealthSampleData.download_hf_dataset, Function)

    @test_throws ErrorException HealthSampleData.download_hf_dataset("NonExistentDataset12345")
    @testset "HuggingFaceDatasets - Test dataset download" begin
        path = HealthSampleData.download_hf_dataset("Test")
        @test isa(path, String)
        @test path == "Test/penguins.csv"
    end
end
