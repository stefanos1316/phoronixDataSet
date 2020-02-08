file(REMOVE_RECURSE
  "../../lib/libwdb.pdb"
  "../../lib/libwdb.so.20.0.1"
  "../../lib/libwdb.so"
  "../../lib/libwdb.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libwdb.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
