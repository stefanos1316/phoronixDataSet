file(REMOVE_RECURSE
  "../../lib/librt.pdb"
  "../../lib/librt.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/librt-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
