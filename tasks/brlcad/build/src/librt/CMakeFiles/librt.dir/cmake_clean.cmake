file(REMOVE_RECURSE
  "../../lib/librt.pdb"
  "../../lib/librt.so.20.0.1"
  "../../lib/librt.so"
  "../../lib/librt.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/librt.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
