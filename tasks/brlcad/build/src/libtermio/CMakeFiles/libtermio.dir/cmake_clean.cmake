file(REMOVE_RECURSE
  "../../lib/libtermio.pdb"
  "../../lib/libtermio.so.20.0.1"
  "../../lib/libtermio.so"
  "../../lib/libtermio.so.20"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/libtermio.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
