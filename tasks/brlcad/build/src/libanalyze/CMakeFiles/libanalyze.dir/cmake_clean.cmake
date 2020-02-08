file(REMOVE_RECURSE
  "../../lib/libanalyze.pdb"
  "../../lib/libanalyze.so.20.0.1"
  "../../lib/libanalyze.so"
  "../../lib/libanalyze.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libanalyze.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
