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
include src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/depend.make

# Include the progress variables for this target.
include src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/flags.make

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/flags.make
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o: ../src/other/gdal/frmts/aigrid/aigdataset.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigdataset.cpp

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigdataset.cpp > CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.i

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigdataset.cpp -o CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.s

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.requires:

.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.requires

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.provides: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.requires
	$(MAKE) -f src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build.make src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.provides.build
.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.provides

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.provides.build: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o


src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/flags.make
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o: ../src/other/gdal/frmts/aigrid/gridlib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_aigrid.dir/gridlib.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/gridlib.c

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_aigrid.dir/gridlib.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/gridlib.c > CMakeFiles/frmt_aigrid.dir/gridlib.c.i

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_aigrid.dir/gridlib.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/gridlib.c -o CMakeFiles/frmt_aigrid.dir/gridlib.c.s

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.requires:

.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.requires

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.provides: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build.make src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.provides.build
.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.provides

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.provides.build: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o


src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/flags.make
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o: ../src/other/gdal/frmts/aigrid/aigopen.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_aigrid.dir/aigopen.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigopen.c

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_aigrid.dir/aigopen.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigopen.c > CMakeFiles/frmt_aigrid.dir/aigopen.c.i

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_aigrid.dir/aigopen.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigopen.c -o CMakeFiles/frmt_aigrid.dir/aigopen.c.s

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.requires:

.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.requires

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.provides: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build.make src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.provides.build
.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.provides

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.provides.build: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o


src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/flags.make
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o: ../src/other/gdal/frmts/aigrid/aigccitt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_aigrid.dir/aigccitt.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigccitt.c

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_aigrid.dir/aigccitt.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigccitt.c > CMakeFiles/frmt_aigrid.dir/aigccitt.c.i

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_aigrid.dir/aigccitt.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid/aigccitt.c -o CMakeFiles/frmt_aigrid.dir/aigccitt.c.s

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.requires:

.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.requires

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.provides: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build.make src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.provides.build
.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.provides

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.provides.build: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o


frmt_aigrid: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o
frmt_aigrid: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o
frmt_aigrid: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o
frmt_aigrid: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o
frmt_aigrid: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build.make

.PHONY : frmt_aigrid

# Rule to build all files generated by this target.
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build: frmt_aigrid

.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/build

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/requires: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigdataset.cpp.o.requires
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/requires: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/gridlib.c.o.requires
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/requires: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigopen.c.o.requires
src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/requires: src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/aigccitt.c.o.requires

.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/requires

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid && $(CMAKE_COMMAND) -P CMakeFiles/frmt_aigrid.dir/cmake_clean.cmake
.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/clean

src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/aigrid /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/gdal/frmts/aigrid/CMakeFiles/frmt_aigrid.dir/depend

