using Downloads

const HF = HuggingFaceHub

"""
    _huggingface_dataset_register(name::String, repo::String, filename::String)

Resolve dataset metadata from Hugging Face, download `filename` via HuggingFaceHub,
and return the local filesystem path to the downloaded file
"""
function _huggingface_dataset_register(name::String, repo::String, filename::String)

    @info "Resolving Hugging Face metadata for $repo"

    # Try fetching dataset info safely
    dataset = HF.info(HF.Dataset, repo)

    @info "Downloading $filename from $repo via HuggingFaceHub..."
    try
        # Prefer official HuggingFaceHub download if dataset info is available
        if dataset !== nothing
            localpath = HF.file_download(dataset, filename)
        else
            # Direct fallback if HF.info failed
            url = "$repo/resolve/main/$filename"
            tmpdir = mktempdir()
            dest = joinpath(tmpdir, filename)
            @info "Downloading $url -> $dest"
            Downloads.download(url, dest)
            localpath = dest
        end
        @info "Downloaded to $localpath"
        return localpath

    catch e
        msg = string(e)
        if occursin("symlink", msg) || occursin("creating symlinks", msg) ||
           occursin("Administrator", msg) || occursin("operation not permitted", msg)

            @warn "Symlink creation failed (likely Windows privilege issue). Falling back to direct HTTP download: $e"
            url = "$repo/resolve/main/$filename"
            tmpdir = mktempdir()
            dest = joinpath(tmpdir, filename)
            @info "Downloading $url -> $dest (no symlink)"
            Downloads.download(url, dest)
            localpath = dest
            @info "Fallback download complete: $localpath"
            return localpath
        else
            rethrow(e)
        end
    end
end