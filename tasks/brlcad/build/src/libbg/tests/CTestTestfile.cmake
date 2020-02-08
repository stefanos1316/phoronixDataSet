# CMake generated Testfile for 
# Source directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbg/tests
# Build directory: /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(bg_polygon_triangulate "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_polygon_triangulate")
add_test(bg_tri_tri_isect_coplanar_null_noarea "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1.00001,0,0" "2,0,0" "1.00001,1,0" "0" "0")
add_test(bg_tri_tri_isect_coplanar_vertex_noarea "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1.00001,0,0" "2,0,0" "1,1,0" "0" "1")
add_test(bg_tri_tri_isect_coplanar_edge_noarea "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1,0,0" "2,0,0" "1,1,0" "0" "1")
add_test(bg_tri_tri_isect_coplanar_full_noarea "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1,0,0" "2,0,0" "0.7,0.8,0" "0" "1")
add_test(bg_tri_tri_isect_coplanar_null_area "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1.00001,0,0" "2,0,0" "1.00001,1,0" "1" "0")
add_test(bg_tri_tri_isect_coplanar_vertex_area "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1.00001,0,0" "2,0,0" "1,1,0" "1" "0")
add_test(bg_tri_tri_isect_coplanar_edge_area "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1,0,0" "2,0,0" "1,1,0" "1" "0")
add_test(bg_tri_tri_isect_coplanar_full_area "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect_coplanar" "0,0,0" "1,0,0" "1,1,0" "1,0,0" "2,0,0" "0.7,0.8,0" "1" "1")
add_test(bg_tri_tri_isect_cp_null "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect" "0,0,0" "1,0,0" "1,1,0" "1.00001,0,0" "2,0,0" "1.00001,1,0" "0")
add_test(bg_tri_tri_isect_cp_vertex "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect" "0,0,0" "1,0,0" "1,1,0" "1.00001,0,0" "2,0,0" "1,1,0" "1")
add_test(bg_tri_tri_isect_cp_edge "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect" "0,0,0" "1,0,0" "1,1,0" "1,0,0" "2,0,0" "1,1,0" "1")
add_test(bg_tri_tri_isect_cp_full "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect" "0,0,0" "1,0,0" "1,1,0" "1,0,0" "2,0,0" "0.7,0.8,0" "1")
add_test(bg_tri_tri_isect_null "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/tests/bg_tri_tri_isect" "0,0,0" "1,0,0" "1,1,0" "1,0,1" "1,0,1" "1,1,1" "0")
