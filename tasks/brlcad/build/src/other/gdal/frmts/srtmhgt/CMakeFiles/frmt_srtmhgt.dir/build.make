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
include src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/depend.make

# Include the progress variables for this target.
include src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/flags.make

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o: src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/flags.make
src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o: ../src/other/gdal/frmts/srtmhgt/srtmhgtdataset.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/srtmhgt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/srtmhgt/srtmhgtdataset.cpp

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/srtmhgt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/srtmhgt/srtmhgtdataset.cpp > CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.i

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/srtmhgt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/srtmhgt/srtmhgtdataset.cpp -o CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.s

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.requires:

.PHONY : src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.requires

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.provides: src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.requires
	$(MAKE) -f src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/build.make src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.provides.build
.PHONY : src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.provides

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.provides.build: src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o


frmt_srtmhgt: src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o
frmt_srtmhgt: src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/build.make

.PHONY : frmt_srtmhgt

# Rule to build all files generated by this target.
src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/build: frmt_srtmhgt

.PHONY : src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/build

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/requires: src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/srtmhgtdataset.cpp.o.requires

.PHONY : src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/requires

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/srtmhgt && $(CMAKE_COMMAND) -P CMakeFiles/frmt_srtmhgt.dir/cmake_clean.cmake
.PHONY : src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/clean

src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/srtmhgt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/srtmhgt /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/gdal/frmts/srtmhgt/CMakeFiles/frmt_srtmhgt.dir/depend
