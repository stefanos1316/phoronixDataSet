file(REMOVE_RECURSE
  "../../lib/libfb.pdb"
  "../../lib/libfb.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libfb-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
