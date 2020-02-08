file(REMOVE_RECURSE
  "../../lib/libgcv.pdb"
  "../../lib/libgcv.so.20.0.1"
  "../../lib/libgcv.so"
  "../../lib/libgcv.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libgcv.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
