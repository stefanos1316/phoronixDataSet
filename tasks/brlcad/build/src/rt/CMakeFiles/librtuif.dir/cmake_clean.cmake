file(REMOVE_RECURSE
  "../../lib/librtuif.pdb"
  "../../lib/librtuif.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/librtuif.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
