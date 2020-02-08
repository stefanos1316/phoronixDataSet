file(REMOVE_RECURSE
  "../../lib/librender.pdb"
  "../../lib/librender.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/librender-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
