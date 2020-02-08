file(REMOVE_RECURSE
  "../../lib/libtermio.pdb"
  "../../lib/libtermio.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libtermio-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
