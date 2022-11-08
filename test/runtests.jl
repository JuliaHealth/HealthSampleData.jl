using DataFrames
using HealthSampleData
using SQLite
using Test

# TODO: Write why this is needed
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

include("src/tests.jl")
