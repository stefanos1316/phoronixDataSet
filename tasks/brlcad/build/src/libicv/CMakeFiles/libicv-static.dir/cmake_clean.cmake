file(REMOVE_RECURSE
  "../../lib/libicv.pdb"
  "../../lib/libicv.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libicv-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
