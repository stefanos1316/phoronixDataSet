file(REMOVE_RECURSE
  "scanner.c"
  "PERPLEX_parser/parser.out"
  "PERPLEX_parser/parser.y"
  "CMakeFiles/perplex_template_cp"
  "../../../share/perplex/perplex_template.c"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/perplex_template_cp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
