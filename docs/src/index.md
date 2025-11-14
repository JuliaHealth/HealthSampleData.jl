```@meta
CurrentModule = HealthSampleData
```

# HealthSampleData

> To provide consistent data sets for teaching and learning across JuliaHealth.

Welcome to `HealthSampleData.jl`!

This package curates and provisions a number of datasets useful in health informatics, public health, medical imaging, and machine learning research. 
It is made in an effort to provide learning resources that are consistently available across JuliaHealth.

## Dataset Overview

`HealthSampleData.jl` uses `DataDeps.jl` to download data sources from a variety of locations.
Each dataset provides:

1. A short description
2. Relevant links or resources
3. Its file type (e.g. CSV, sqlite, etc.)
4. A quickstart guide
5. Where it is being downloaded from

> **NOTE:** For more information about datasets and data sources, please refer to [Supported Datasets](./supported_datasets).

## Installation

To install `HealthSampleData.jl`, type the following snippet into the Julia REPL:

```julia
Pkg.add("HealthSampleData.jl")
```