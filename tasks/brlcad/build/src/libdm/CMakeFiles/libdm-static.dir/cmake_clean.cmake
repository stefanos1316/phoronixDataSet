file(REMOVE_RECURSE
  "../../lib/libdm.pdb"
  "../../lib/libdm.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libdm-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
