file(REMOVE_RECURSE
  "../../lib/libbn.pdb"
  "../../lib/libbn.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libbn-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
