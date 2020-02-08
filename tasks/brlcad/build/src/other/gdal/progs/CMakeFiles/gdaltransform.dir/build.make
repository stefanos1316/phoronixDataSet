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
include src/other/gdal/progs/CMakeFiles/gdaltransform.dir/depend.make

# Include the progress variables for this target.
include src/other/gdal/progs/CMakeFiles/gdaltransform.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/gdal/progs/CMakeFiles/gdaltransform.dir/flags.make

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/flags.make
src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o: ../src/other/gdal/progs/gdaltransform.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/progs/gdaltransform.cpp

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gdaltransform.dir/gdaltransform.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/progs/gdaltransform.cpp > CMakeFiles/gdaltransform.dir/gdaltransform.cpp.i

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gdaltransform.dir/gdaltransform.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/progs/gdaltransform.cpp -o CMakeFiles/gdaltransform.dir/gdaltransform.cpp.s

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.requires:

.PHONY : src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.requires

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.provides: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.requires
	$(MAKE) -f src/other/gdal/progs/CMakeFiles/gdaltransform.dir/build.make src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.provides.build
.PHONY : src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.provides

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.provides.build: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o


# Object files for target gdaltransform
gdaltransform_OBJECTS = \
"CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o"

# External object files for target gdaltransform
gdaltransform_EXTERNAL_OBJECTS =

bin/gdaltransform: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o
bin/gdaltransform: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/build.make
bin/gdaltransform: lib/libgdal.so
bin/gdaltransform: lib/libproj.so.12.0.0
bin/gdaltransform: lib/libpng16.so.16.29.0
bin/gdaltransform: lib/libz.so.1.2.11
bin/gdaltransform: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../bin/gdaltransform"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gdaltransform.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/gdal/progs/CMakeFiles/gdaltransform.dir/build: bin/gdaltransform

.PHONY : src/other/gdal/progs/CMakeFiles/gdaltransform.dir/build

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/requires: src/other/gdal/progs/CMakeFiles/gdaltransform.dir/gdaltransform.cpp.o.requires

.PHONY : src/other/gdal/progs/CMakeFiles/gdaltransform.dir/requires

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs && $(CMAKE_COMMAND) -P CMakeFiles/gdaltransform.dir/cmake_clean.cmake
.PHONY : src/other/gdal/progs/CMakeFiles/gdaltransform.dir/clean

src/other/gdal/progs/CMakeFiles/gdaltransform.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/progs /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/progs/CMakeFiles/gdaltransform.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/gdal/progs/CMakeFiles/gdaltransform.dir/depend
