using DataFrames
using HealthSampleData
using SQLite
using Test

# NOTE: Configuration for the GitHub CI to always accept a prompt
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

include("src/tests.jl")
