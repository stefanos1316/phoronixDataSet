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
include src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/depend.make

# Include the progress variables for this target.
include src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/flags.make

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/flags.make
src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o: ../src/other/gdal/frmts/derived/deriveddataset.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived/deriveddataset.cpp

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/frmt_derived.dir/deriveddataset.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived/deriveddataset.cpp > CMakeFiles/frmt_derived.dir/deriveddataset.cpp.i

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/frmt_derived.dir/deriveddataset.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived/deriveddataset.cpp -o CMakeFiles/frmt_derived.dir/deriveddataset.cpp.s

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.requires:

.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.requires

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.provides: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.requires
	$(MAKE) -f src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/build.make src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.provides.build
.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.provides

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.provides.build: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o


src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/flags.make
src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o: ../src/other/gdal/frmts/derived/derivedlist.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_derived.dir/derivedlist.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived/derivedlist.c

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_derived.dir/derivedlist.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived/derivedlist.c > CMakeFiles/frmt_derived.dir/derivedlist.c.i

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_derived.dir/derivedlist.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived/derivedlist.c -o CMakeFiles/frmt_derived.dir/derivedlist.c.s

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.requires:

.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.requires

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.provides: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/build.make src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.provides.build
.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.provides

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.provides.build: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o


frmt_derived: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o
frmt_derived: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o
frmt_derived: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/build.make

.PHONY : frmt_derived

# Rule to build all files generated by this target.
src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/build: frmt_derived

.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/build

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/requires: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/deriveddataset.cpp.o.requires
src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/requires: src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/derivedlist.c.o.requires

.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/requires

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived && $(CMAKE_COMMAND) -P CMakeFiles/frmt_derived.dir/cmake_clean.cmake
.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/clean

src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/derived /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/gdal/frmts/derived/CMakeFiles/frmt_derived.dir/depend

