file(REMOVE_RECURSE
  "../../lib/libbu.pdb"
  "../../lib/libbu.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/libbu-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
