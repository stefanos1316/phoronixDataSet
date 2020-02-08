file(REMOVE_RECURSE
  "../../lib/libbn.pdb"
  "../../lib/libbn.so.20.0.1"
  "../../lib/libbn.so"
  "../../lib/libbn.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libbn.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
