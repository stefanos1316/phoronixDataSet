file(REMOVE_RECURSE
  "../../../lib/libopenNURBS.pdb"
  "../../../lib/libopenNURBS.so.2012.10.245"
  "../../../lib/libopenNURBS.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/openNURBS.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
