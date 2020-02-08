file(REMOVE_RECURSE
  "../../lib/libpkg.pdb"
  "../../lib/libpkg.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libpkg-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
