file(REMOVE_RECURSE
  "../../lib/liboptical.pdb"
  "../../lib/liboptical.so.20.0.1"
  "../../lib/liboptical.so"
  "../../lib/liboptical.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/liboptical.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
