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
include src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/depend.make

# Include the progress variables for this target.
include src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/progress.make

# Include the compile flags for this target's objects.
include src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/flags.make

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/flags.make
src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o: ../src/libgcv/plugins/stl/stl_read.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl/stl_read.c

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libgcv_stl-obj.dir/stl_read.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl/stl_read.c > CMakeFiles/libgcv_stl-obj.dir/stl_read.c.i

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libgcv_stl-obj.dir/stl_read.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl/stl_read.c -o CMakeFiles/libgcv_stl-obj.dir/stl_read.c.s

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.requires:

.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.requires

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.provides: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.requires
	$(MAKE) -f src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/build.make src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.provides.build
.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.provides

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.provides.build: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o


src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/flags.make
src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o: ../src/libgcv/plugins/stl/stl_write.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl/stl_write.c

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libgcv_stl-obj.dir/stl_write.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl/stl_write.c > CMakeFiles/libgcv_stl-obj.dir/stl_write.c.i

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libgcv_stl-obj.dir/stl_write.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl/stl_write.c -o CMakeFiles/libgcv_stl-obj.dir/stl_write.c.s

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.requires:

.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.requires

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.provides: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.requires
	$(MAKE) -f src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/build.make src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.provides.build
.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.provides

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.provides.build: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o


libgcv_stl-obj: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o
libgcv_stl-obj: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o
libgcv_stl-obj: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/build.make

.PHONY : libgcv_stl-obj

# Rule to build all files generated by this target.
src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/build: libgcv_stl-obj

.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/build

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/requires: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_read.c.o.requires
src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/requires: src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/stl_write.c.o.requires

.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/requires

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl && $(CMAKE_COMMAND) -P CMakeFiles/libgcv_stl-obj.dir/cmake_clean.cmake
.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/clean

src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libgcv/plugins/stl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libgcv/plugins/stl/CMakeFiles/libgcv_stl-obj.dir/depend

