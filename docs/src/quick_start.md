# Quick Start Guide

Here is a complete example workflow for how someone would want to use `HealthSampleData.jl`.

## Installation

To install `HealthSampleData.jl`, type the following snippet into the Julia REPL:

```julia
Pkg.add("HealthSampleData.jl")
```

## Download a Dataset

We'll download a small dataset:

```julia
import HealthSampleData:
    Test

Test()
```

You should see something like the following:

```text
This program has requested access to the data dependency Test.
which is not currently installed. It can be installed automatically, and you will not see this message again.

The Palmer Penguins test dataset for HealthSampleData.jl. To cite:

Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer
Archipelago (Antarctica) penguin data. R package version 0.1.0.
https://allisonhorst.github.io/palmerpenguins/. doi:
10.5281/zenodo.3960218.

Do you want to download the dataset from https://huggingface.co/datasets/JuliaHealthOrg/JuliaHealthDatasets/penguins.csv to "C:\Users\You\.julia\scratchspaces\[UUID]\datadeps\Test"?
[y/n]
```