file(REMOVE_RECURSE
  "../../lib/libwdb.pdb"
  "../../lib/libwdb.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libwdb-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
