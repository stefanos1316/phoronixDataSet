# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build

# Include any dependencies generated for this target.
include src/libbg/CMakeFiles/libbg-static.dir/depend.make

# Include the progress variables for this target.
include src/libbg/CMakeFiles/libbg-static.dir/progress.make

# Include the compile flags for this target's objects.
include src/libbg/CMakeFiles/libbg-static.dir/flags.make

# Object files for target libbg-static
libbg__static_OBJECTS =

# External object files for target libbg-static
libbg__static_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/chull.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/chull3d.cpp.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/obr.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/polygon.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/polygon_ear_clipping.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/polygon_point_in.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/spsr.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/tri_ray.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/tri_tri.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/trimesh.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-obj.dir/util.c.o"

lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/chull.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/chull3d.cpp.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/obr.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/polygon.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/polygon_ear_clipping.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/polygon_point_in.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/spsr.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/tri_ray.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/tri_tri.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/trimesh.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-obj.dir/util.c.o
lib/libbg.a: src/libbg/CMakeFiles/libbg-static.dir/build.make
lib/libbg.a: src/libbg/CMakeFiles/libbg-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX static library ../../lib/libbg.a"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg && $(CMAKE_COMMAND) -P CMakeFiles/libbg-static.dir/cmake_clean_target.cmake
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libbg-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libbg/CMakeFiles/libbg-static.dir/build: lib/libbg.a

.PHONY : src/libbg/CMakeFiles/libbg-static.dir/build

src/libbg/CMakeFiles/libbg-static.dir/requires:

.PHONY : src/libbg/CMakeFiles/libbg-static.dir/requires

src/libbg/CMakeFiles/libbg-static.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg && $(CMAKE_COMMAND) -P CMakeFiles/libbg-static.dir/cmake_clean.cmake
.PHONY : src/libbg/CMakeFiles/libbg-static.dir/clean

src/libbg/CMakeFiles/libbg-static.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libbg /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libbg/CMakeFiles/libbg-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libbg/CMakeFiles/libbg-static.dir/depend

