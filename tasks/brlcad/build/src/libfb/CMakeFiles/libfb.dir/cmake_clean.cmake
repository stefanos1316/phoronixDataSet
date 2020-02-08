file(REMOVE_RECURSE
  "../../lib/libfb.pdb"
  "../../lib/libfb.so.20.0.1"
  "../../lib/libfb.so"
  "../../lib/libfb.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libfb.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
