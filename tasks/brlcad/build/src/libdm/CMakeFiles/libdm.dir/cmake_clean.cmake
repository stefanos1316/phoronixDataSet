file(REMOVE_RECURSE
  "../../lib/libdm.pdb"
  "../../lib/libdm.so.20.0.1"
  "../../lib/libdm.so"
  "../../lib/libdm.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libdm.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
