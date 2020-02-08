file(REMOVE_RECURSE
  "../../lib/libbg.pdb"
  "../../lib/libbg.so.20.0.1"
  "../../lib/libbg.so"
  "../../lib/libbg.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libbg.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
