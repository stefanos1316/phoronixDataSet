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
include src/libicv/CMakeFiles/libicv-obj.dir/depend.make

# Include the progress variables for this target.
include src/libicv/CMakeFiles/libicv-obj.dir/progress.make

# Include the compile flags for this target's objects.
include src/libicv/CMakeFiles/libicv-obj.dir/flags.make

src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o: ../src/libicv/fileformat.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/fileformat.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/fileformat.c

src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/fileformat.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/fileformat.c > CMakeFiles/libicv-obj.dir/fileformat.c.i

src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/fileformat.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/fileformat.c -o CMakeFiles/libicv-obj.dir/fileformat.c.s

src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o


src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o: ../src/libicv/rot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/rot.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/rot.c

src/libicv/CMakeFiles/libicv-obj.dir/rot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/rot.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/rot.c > CMakeFiles/libicv-obj.dir/rot.c.i

src/libicv/CMakeFiles/libicv-obj.dir/rot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/rot.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/rot.c -o CMakeFiles/libicv-obj.dir/rot.c.s

src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o


src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o: ../src/libicv/color_space.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/color_space.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/color_space.c

src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/color_space.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/color_space.c > CMakeFiles/libicv-obj.dir/color_space.c.i

src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/color_space.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/color_space.c -o CMakeFiles/libicv-obj.dir/color_space.c.s

src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o


src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o: ../src/libicv/crop.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/crop.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/crop.c

src/libicv/CMakeFiles/libicv-obj.dir/crop.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/crop.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/crop.c > CMakeFiles/libicv-obj.dir/crop.c.i

src/libicv/CMakeFiles/libicv-obj.dir/crop.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/crop.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/crop.c -o CMakeFiles/libicv-obj.dir/crop.c.s

src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o


src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o: ../src/libicv/filter.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/filter.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/filter.c

src/libicv/CMakeFiles/libicv-obj.dir/filter.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/filter.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/filter.c > CMakeFiles/libicv-obj.dir/filter.c.i

src/libicv/CMakeFiles/libicv-obj.dir/filter.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/filter.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/filter.c -o CMakeFiles/libicv-obj.dir/filter.c.s

src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o


src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o: ../src/libicv/encoding.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/encoding.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/encoding.c

src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/encoding.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/encoding.c > CMakeFiles/libicv-obj.dir/encoding.c.i

src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/encoding.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/encoding.c -o CMakeFiles/libicv-obj.dir/encoding.c.s

src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o


src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o: ../src/libicv/operations.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/operations.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/operations.c

src/libicv/CMakeFiles/libicv-obj.dir/operations.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/operations.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/operations.c > CMakeFiles/libicv-obj.dir/operations.c.i

src/libicv/CMakeFiles/libicv-obj.dir/operations.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/operations.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/operations.c -o CMakeFiles/libicv-obj.dir/operations.c.s

src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o


src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o: ../src/libicv/stat.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/stat.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/stat.c

src/libicv/CMakeFiles/libicv-obj.dir/stat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/stat.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/stat.c > CMakeFiles/libicv-obj.dir/stat.c.i

src/libicv/CMakeFiles/libicv-obj.dir/stat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/stat.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/stat.c -o CMakeFiles/libicv-obj.dir/stat.c.s

src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o


src/libicv/CMakeFiles/libicv-obj.dir/size.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/size.c.o: ../src/libicv/size.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/size.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/size.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/size.c

src/libicv/CMakeFiles/libicv-obj.dir/size.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/size.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/size.c > CMakeFiles/libicv-obj.dir/size.c.i

src/libicv/CMakeFiles/libicv-obj.dir/size.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/size.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/size.c -o CMakeFiles/libicv-obj.dir/size.c.s

src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/size.c.o


src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o: ../src/libicv/pix.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/pix.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/pix.c

src/libicv/CMakeFiles/libicv-obj.dir/pix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/pix.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/pix.c > CMakeFiles/libicv-obj.dir/pix.c.i

src/libicv/CMakeFiles/libicv-obj.dir/pix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/pix.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/pix.c -o CMakeFiles/libicv-obj.dir/pix.c.s

src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o


src/libicv/CMakeFiles/libicv-obj.dir/png.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/png.c.o: ../src/libicv/png.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/png.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/png.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/png.c

src/libicv/CMakeFiles/libicv-obj.dir/png.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/png.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/png.c > CMakeFiles/libicv-obj.dir/png.c.i

src/libicv/CMakeFiles/libicv-obj.dir/png.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/png.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/png.c -o CMakeFiles/libicv-obj.dir/png.c.s

src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/png.c.o


src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o: ../src/libicv/ppm.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/ppm.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/ppm.c

src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/ppm.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/ppm.c > CMakeFiles/libicv-obj.dir/ppm.c.i

src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/ppm.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/ppm.c -o CMakeFiles/libicv-obj.dir/ppm.c.s

src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o


src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o: ../src/libicv/bw.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/bw.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/bw.c

src/libicv/CMakeFiles/libicv-obj.dir/bw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/bw.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/bw.c > CMakeFiles/libicv-obj.dir/bw.c.i

src/libicv/CMakeFiles/libicv-obj.dir/bw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/bw.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/bw.c -o CMakeFiles/libicv-obj.dir/bw.c.s

src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o


src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o: src/libicv/CMakeFiles/libicv-obj.dir/flags.make
src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o: ../src/libicv/dpix.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/libicv-obj.dir/dpix.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/dpix.c

src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libicv-obj.dir/dpix.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/dpix.c > CMakeFiles/libicv-obj.dir/dpix.c.i

src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libicv-obj.dir/dpix.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv/dpix.c -o CMakeFiles/libicv-obj.dir/dpix.c.s

src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.requires:

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.requires

src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.provides: src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.requires
	$(MAKE) -f src/libicv/CMakeFiles/libicv-obj.dir/build.make src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.provides.build
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.provides

src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.provides.build: src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o


libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/size.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/png.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o
libicv-obj: src/libicv/CMakeFiles/libicv-obj.dir/build.make

.PHONY : libicv-obj

# Rule to build all files generated by this target.
src/libicv/CMakeFiles/libicv-obj.dir/build: libicv-obj

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/build

src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/fileformat.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/rot.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/color_space.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/crop.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/filter.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/encoding.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/operations.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/stat.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/size.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/pix.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/png.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/ppm.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/bw.c.o.requires
src/libicv/CMakeFiles/libicv-obj.dir/requires: src/libicv/CMakeFiles/libicv-obj.dir/dpix.c.o.requires

.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/requires

src/libicv/CMakeFiles/libicv-obj.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv && $(CMAKE_COMMAND) -P CMakeFiles/libicv-obj.dir/cmake_clean.cmake
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/clean

src/libicv/CMakeFiles/libicv-obj.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libicv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libicv/CMakeFiles/libicv-obj.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libicv/CMakeFiles/libicv-obj.dir/depend

