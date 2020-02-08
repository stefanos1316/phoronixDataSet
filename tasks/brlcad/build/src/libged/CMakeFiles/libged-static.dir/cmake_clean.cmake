file(REMOVE_RECURSE
  "../../lib/libged.pdb"
  "../../lib/libged.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libged-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
