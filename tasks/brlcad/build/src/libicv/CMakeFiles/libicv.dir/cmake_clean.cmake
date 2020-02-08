file(REMOVE_RECURSE
  "../../lib/libicv.pdb"
  "../../lib/libicv.so.20.0.1"
  "../../lib/libicv.so"
  "../../lib/libicv.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libicv.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
