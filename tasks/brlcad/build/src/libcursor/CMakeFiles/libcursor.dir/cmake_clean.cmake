file(REMOVE_RECURSE
  "../../lib/libcursor.pdb"
  "../../lib/libcursor.so.20.0.1"
  "../../lib/libcursor.so"
  "../../lib/libcursor.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libcursor.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
