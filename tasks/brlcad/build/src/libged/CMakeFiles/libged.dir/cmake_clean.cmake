file(REMOVE_RECURSE
  "../../lib/libged.pdb"
  "../../lib/libged.so.20.0.1"
  "../../lib/libged.so"
  "../../lib/libged.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libged.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
