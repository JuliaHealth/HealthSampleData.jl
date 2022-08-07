"""
	Eunomia()

Synthetic OMOP CDM data generated by Synthea available in a single sqlite file.

# Returns

- `path_to_source::String` - a string representing the path to the data source download
"""
function Eunomia()

register(DataDep(
        "Eunomia",
        "Synthetic OMOP CDM data generated by Synthea available in a single sqlite file; link: https://github.com/OHDSI/Eunomia",
        "https://app.box.com/index.php?rm=box_download_shared_file&shared_name=n5a21tbu1rwpilgcm6q9oip30ti86ven&file_id=f_988456839468",
        "cef9f00fe469041cfcdec527fc6f5657e2d0185bc002df38262faa642ee97c82"
))
	
	datadep"Eunomia"

	@info "Eunomia data source is downloaded!"

	return datadep"Eunomia/eunomia.sqlite"
end

export Eunomia
