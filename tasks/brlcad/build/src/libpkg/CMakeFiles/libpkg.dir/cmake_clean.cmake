file(REMOVE_RECURSE
  "../../lib/libpkg.pdb"
  "../../lib/libpkg.so.20.0.1"
  "../../lib/libpkg.so"
  "../../lib/libpkg.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libpkg.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
