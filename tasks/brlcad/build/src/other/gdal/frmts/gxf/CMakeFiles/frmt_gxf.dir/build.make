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
include src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/depend.make

# Include the progress variables for this target.
include src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/flags.make

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/flags.make
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o: ../src/other/gdal/frmts/gxf/gxfdataset.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxfdataset.cpp

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxfdataset.cpp > CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.i

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxfdataset.cpp -o CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.s

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.requires:

.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.requires

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.provides: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.requires
	$(MAKE) -f src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build.make src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.provides.build
.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.provides

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.provides.build: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o


src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/flags.make
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o: ../src/other/gdal/frmts/gxf/gxfopen.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_gxf.dir/gxfopen.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxfopen.c

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_gxf.dir/gxfopen.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxfopen.c > CMakeFiles/frmt_gxf.dir/gxfopen.c.i

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_gxf.dir/gxfopen.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxfopen.c -o CMakeFiles/frmt_gxf.dir/gxfopen.c.s

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.requires:

.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.requires

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.provides: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build.make src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.provides.build
.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.provides

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.provides.build: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o


src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/flags.make
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o: ../src/other/gdal/frmts/gxf/gxf_proj4.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxf_proj4.c

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_gxf.dir/gxf_proj4.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxf_proj4.c > CMakeFiles/frmt_gxf.dir/gxf_proj4.c.i

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_gxf.dir/gxf_proj4.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxf_proj4.c -o CMakeFiles/frmt_gxf.dir/gxf_proj4.c.s

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.requires:

.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.requires

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.provides: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build.make src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.provides.build
.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.provides

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.provides.build: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o


src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/flags.make
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o: ../src/other/gdal/frmts/gxf/gxf_ogcwkt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxf_ogcwkt.c

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxf_ogcwkt.c > CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.i

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf/gxf_ogcwkt.c -o CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.s

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.requires:

.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.requires

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.provides: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.requires
	$(MAKE) -f src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build.make src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.provides.build
.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.provides

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.provides.build: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o


frmt_gxf: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o
frmt_gxf: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o
frmt_gxf: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o
frmt_gxf: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o
frmt_gxf: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build.make

.PHONY : frmt_gxf

# Rule to build all files generated by this target.
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build: frmt_gxf

.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/build

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/requires: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfdataset.cpp.o.requires
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/requires: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxfopen.c.o.requires
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/requires: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_proj4.c.o.requires
src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/requires: src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/gxf_ogcwkt.c.o.requires

.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/requires

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf && $(CMAKE_COMMAND) -P CMakeFiles/frmt_gxf.dir/cmake_clean.cmake
.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/clean

src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/gdal/frmts/gxf /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/gdal/frmts/gxf/CMakeFiles/frmt_gxf.dir/depend

