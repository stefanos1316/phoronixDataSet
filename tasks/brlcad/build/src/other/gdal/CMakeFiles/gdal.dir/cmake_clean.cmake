file(REMOVE_RECURSE
  "../../../lib/libgdal.pdb"
  "../../../lib/libgdal.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/gdal.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
