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
include src/other/stepcode/src/express/CMakeFiles/check-express.dir/depend.make

# Include the progress variables for this target.
include src/other/stepcode/src/express/CMakeFiles/check-express.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/stepcode/src/express/CMakeFiles/check-express.dir/flags.make

src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o: src/other/stepcode/src/express/CMakeFiles/check-express.dir/flags.make
src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o: ../src/other/stepcode/src/express/fedex.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/check-express.dir/fedex.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express/fedex.c

src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/check-express.dir/fedex.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express/fedex.c > CMakeFiles/check-express.dir/fedex.c.i

src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/check-express.dir/fedex.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express/fedex.c -o CMakeFiles/check-express.dir/fedex.c.s

src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.requires:

.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.requires

src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.provides: src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.requires
	$(MAKE) -f src/other/stepcode/src/express/CMakeFiles/check-express.dir/build.make src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.provides.build
.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.provides

src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.provides.build: src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o


src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o: src/other/stepcode/src/express/CMakeFiles/check-express.dir/flags.make
src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o: ../src/other/stepcode/src/express/inithook.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/check-express.dir/inithook.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express/inithook.c

src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/check-express.dir/inithook.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express/inithook.c > CMakeFiles/check-express.dir/inithook.c.i

src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/check-express.dir/inithook.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express/inithook.c -o CMakeFiles/check-express.dir/inithook.c.s

src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.requires:

.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.requires

src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.provides: src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.requires
	$(MAKE) -f src/other/stepcode/src/express/CMakeFiles/check-express.dir/build.make src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.provides.build
.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.provides

src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.provides.build: src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o


# Object files for target check-express
check__express_OBJECTS = \
"CMakeFiles/check-express.dir/fedex.c.o" \
"CMakeFiles/check-express.dir/inithook.c.o"

# External object files for target check-express
check__express_EXTERNAL_OBJECTS =

bin/check-express: src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o
bin/check-express: src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o
bin/check-express: src/other/stepcode/src/express/CMakeFiles/check-express.dir/build.make
bin/check-express: lib/libexpress.so.2.0.0
bin/check-express: lib/libbase.so.2.0.0
bin/check-express: src/other/stepcode/src/express/CMakeFiles/check-express.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../../../../../bin/check-express"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/check-express.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/other/stepcode/src/express/CMakeFiles/check-express.dir/build: bin/check-express

.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/build

src/other/stepcode/src/express/CMakeFiles/check-express.dir/requires: src/other/stepcode/src/express/CMakeFiles/check-express.dir/fedex.c.o.requires
src/other/stepcode/src/express/CMakeFiles/check-express.dir/requires: src/other/stepcode/src/express/CMakeFiles/check-express.dir/inithook.c.o.requires

.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/requires

src/other/stepcode/src/express/CMakeFiles/check-express.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express && $(CMAKE_COMMAND) -P CMakeFiles/check-express.dir/cmake_clean.cmake
.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/clean

src/other/stepcode/src/express/CMakeFiles/check-express.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/express /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/express/CMakeFiles/check-express.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/stepcode/src/express/CMakeFiles/check-express.dir/depend

