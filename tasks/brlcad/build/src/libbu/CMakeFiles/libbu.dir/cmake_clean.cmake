file(REMOVE_RECURSE
  "../../lib/libbu.pdb"
  "../../lib/libbu.so.20.0.1"
  "../../lib/libbu.so"
  "../../lib/libbu.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libbu.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
