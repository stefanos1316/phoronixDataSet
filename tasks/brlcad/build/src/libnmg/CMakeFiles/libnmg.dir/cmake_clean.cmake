file(REMOVE_RECURSE
  "../../lib/libnmg.pdb"
  "../../lib/libnmg.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libnmg.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
