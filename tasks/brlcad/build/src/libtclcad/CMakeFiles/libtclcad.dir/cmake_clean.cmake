file(REMOVE_RECURSE
  "../../lib/libtclcad.pdb"
  "../../lib/libtclcad.so.20.0.1"
  "../../lib/libtclcad.so"
  "../../lib/libtclcad.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libtclcad.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
