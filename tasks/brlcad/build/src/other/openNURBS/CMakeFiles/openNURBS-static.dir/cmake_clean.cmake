file(REMOVE_RECURSE
  "../../../lib/libopenNURBS.pdb"
  "../../../lib/libopenNURBS.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/openNURBS-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
