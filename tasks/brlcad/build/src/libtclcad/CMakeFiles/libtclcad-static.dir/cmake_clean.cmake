file(REMOVE_RECURSE
  "../../lib/libtclcad.pdb"
  "../../lib/libtclcad.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libtclcad-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
