file(REMOVE_RECURSE
  "../../../../lib/libgcv_plugins/libgcv_obj.pdb"
  "../../../../lib/libgcv_plugins/libgcv_obj.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libgcv_obj.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
