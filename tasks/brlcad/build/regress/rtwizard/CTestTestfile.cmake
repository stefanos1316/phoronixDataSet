# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/rtwizard
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(regress-rtwizard-rtwiz_m35_A "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_A.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_A PROPERTIES  LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_B "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_B.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_B PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A" LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_C "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_C.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_C PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A;regress-rtwizard-rtwiz_m35_B" LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_D "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_D.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_D PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A;regress-rtwizard-rtwiz_m35_B;regress-rtwizard-rtwiz_m35_C" LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_E "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_E.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_E PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A;regress-rtwizard-rtwiz_m35_B;regress-rtwizard-rtwiz_m35_C;regress-rtwizard-rtwiz_m35_D" LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_F "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_F.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_F PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A;regress-rtwizard-rtwiz_m35_B;regress-rtwizard-rtwiz_m35_C;regress-rtwizard-rtwiz_m35_D;regress-rtwizard-rtwiz_m35_E" LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_edge_only "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_edge_only.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_edge_only PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A;regress-rtwizard-rtwiz_m35_B;regress-rtwizard-rtwiz_m35_C;regress-rtwizard-rtwiz_m35_D;regress-rtwizard-rtwiz_m35_E;regress-rtwizard-rtwiz_m35_F" LABELS "NOT_WORKING" TIMEOUT "60")
add_test(regress-rtwizard-rtwiz_m35_edge_only_color "/usr/bin/cmake" "-P" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/rtwizard/regress-rtwiz_m35_edge_only_color.cmake")
set_tests_properties(regress-rtwizard-rtwiz_m35_edge_only_color PROPERTIES  DEPENDS "regress-rtwizard-rtwiz_m35_A;regress-rtwizard-rtwiz_m35_B;regress-rtwizard-rtwiz_m35_C;regress-rtwizard-rtwiz_m35_D;regress-rtwizard-rtwiz_m35_E;regress-rtwizard-rtwiz_m35_F;regress-rtwizard-rtwiz_m35_edge_only" LABELS "NOT_WORKING" TIMEOUT "60")
