file(REMOVE_RECURSE
  "../../lib/liboptical.pdb"
  "../../lib/liboptical.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/liboptical-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
