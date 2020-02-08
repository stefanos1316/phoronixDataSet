file(REMOVE_RECURSE
  "../../lib/libbrep.pdb"
  "../../lib/libbrep.so.20.0.1"
  "../../lib/libbrep.so"
  "../../lib/libbrep.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libbrep.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
