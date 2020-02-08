file(REMOVE_RECURSE
  "../../lib/librender.pdb"
  "../../lib/librender.so.20.0.1"
  "../../lib/librender.so"
  "../../lib/librender.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/librender.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
