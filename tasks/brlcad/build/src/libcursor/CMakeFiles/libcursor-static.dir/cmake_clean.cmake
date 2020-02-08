file(REMOVE_RECURSE
  "../../lib/libcursor.pdb"
  "../../lib/libcursor.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libcursor-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
