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
include src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/depend.make

# Include the progress variables for this target.
include src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/flags.make

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/flags.make
src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o: ../src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdriver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdriver.cpp

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdriver.cpp > CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.i

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdriver.cpp -o CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.s

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.requires:

.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.requires

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.provides: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.requires
	$(MAKE) -f src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/build.make src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.provides.build
.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.provides

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.provides.build: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o


src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/flags.make
src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o: ../src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdatasource.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdatasource.cpp

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdatasource.cpp > CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.i

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvdatasource.cpp -o CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.s

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.requires:

.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.requires

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.provides: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.requires
	$(MAKE) -f src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/build.make src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.provides.build
.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.provides

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.provides.build: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o


src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/flags.make
src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o: ../src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvlayer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvlayer.cpp

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvlayer.cpp > CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.i

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv/ogrcsvlayer.cpp -o CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.s

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.requires:

.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.requires

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.provides: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.requires
	$(MAKE) -f src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/build.make src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.provides.build
.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.provides

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.provides.build: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o


ogr_frmt_csv: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o
ogr_frmt_csv: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o
ogr_frmt_csv: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o
ogr_frmt_csv: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/build.make

.PHONY : ogr_frmt_csv

# Rule to build all files generated by this target.
src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/build: ogr_frmt_csv

.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/build

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/requires: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdriver.cpp.o.requires
src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/requires: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvdatasource.cpp.o.requires
src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/requires: src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/ogrcsvlayer.cpp.o.requires

.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/requires

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv && $(CMAKE_COMMAND) -P CMakeFiles/ogr_frmt_csv.dir/cmake_clean.cmake
.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/clean

src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/ogr/ogrsf_frmts/csv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/gdal/ogr/ogrsf_frmts/csv/CMakeFiles/ogr_frmt_csv.dir/depend

