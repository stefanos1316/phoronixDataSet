# ====================================================================
# The primesieve CMake configuration file
#
# Usage from an external project:
#     In your CMakeLists.txt, add these lines:
#
#     find_package(primesieve REQUIRED)
#     target_link_libraries(your_target primesieve::primesieve)
#
#     To link against the static libprimesieve use:
#
#     find_package(primesieve REQUIRED static)
#     target_link_libraries(your_target primesieve::primesieve)
#
# ====================================================================

include(CMakeFindDependencyMacro)
find_dependency(Threads QUIET)

if(ON AND OFF)
    if(primesieve_FIND_COMPONENTS)
        string(TOLOWER "${primesieve_FIND_COMPONENTS}" LOWER_COMPONENTS)
        if(LOWER_COMPONENTS STREQUAL "static")
            set(primesieve_STATIC TRUE)
        endif()
    endif()
elseif(ON)
    set(primesieve_STATIC TRUE)
endif()

if(primesieve_STATIC)
    include("${CMAKE_CURRENT_LIST_DIR}/primesieveStatic.cmake")
    add_library(primesieve::primesieve INTERFACE IMPORTED)
    set_target_properties(primesieve::primesieve PROPERTIES INTERFACE_LINK_LIBRARIES "primesieve::libprimesieve-static")
else()
    include("${CMAKE_CURRENT_LIST_DIR}/primesieveShared.cmake")
    add_library(primesieve::primesieve INTERFACE IMPORTED)
    set_target_properties(primesieve::primesieve PROPERTIES INTERFACE_LINK_LIBRARIES "primesieve::libprimesieve")
endif()
