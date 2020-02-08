file(REMOVE_RECURSE
  "../../lib/libbrep.pdb"
  "../../lib/libbrep.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libbrep-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
