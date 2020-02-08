file(REMOVE_RECURSE
  "../../lib/libnmg.pdb"
  "../../lib/libnmg.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libnmg-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
