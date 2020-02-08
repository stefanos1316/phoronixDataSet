file(REMOVE_RECURSE
  "../../../../lib/libgcv_plugins/libgcv_rhino.pdb"
  "../../../../lib/libgcv_plugins/libgcv_rhino.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libgcv_rhino.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
