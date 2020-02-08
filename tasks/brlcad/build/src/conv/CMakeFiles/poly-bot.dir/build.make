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
include src/conv/CMakeFiles/poly-bot.dir/depend.make

# Include the progress variables for this target.
include src/conv/CMakeFiles/poly-bot.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/CMakeFiles/poly-bot.dir/flags.make

src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o: src/conv/CMakeFiles/poly-bot.dir/flags.make
src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o: ../src/conv/poly-bot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/poly-bot.dir/poly-bot.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/poly-bot.c

src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/poly-bot.dir/poly-bot.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/poly-bot.c > CMakeFiles/poly-bot.dir/poly-bot.c.i

src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/poly-bot.dir/poly-bot.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/poly-bot.c -o CMakeFiles/poly-bot.dir/poly-bot.c.s

src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.requires:

.PHONY : src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.requires

src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.provides: src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.requires
	$(MAKE) -f src/conv/CMakeFiles/poly-bot.dir/build.make src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.provides.build
.PHONY : src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.provides

src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.provides.build: src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o


# Object files for target poly-bot
poly__bot_OBJECTS = \
"CMakeFiles/poly-bot.dir/poly-bot.c.o"

# External object files for target poly-bot
poly__bot_EXTERNAL_OBJECTS =

bin/poly-bot: src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o
bin/poly-bot: src/conv/CMakeFiles/poly-bot.dir/build.make
bin/poly-bot: lib/libwdb.so.20.0.1
bin/poly-bot: lib/librt.so.20.0.1
bin/poly-bot: lib/libgdiam.so
bin/poly-bot: lib/libvds.so.1.0.1
bin/poly-bot: lib/libbrep.so.20.0.1
bin/poly-bot: lib/libp2t.so.1.0.1
bin/poly-bot: lib/liblz4.so
bin/poly-bot: lib/libnmg.so
bin/poly-bot: lib/libbg.so.20.0.1
bin/poly-bot: lib/libSPSR.so
bin/poly-bot: lib/libbn.so.20.0.1
bin/poly-bot: lib/libbu.so.20.0.1
bin/poly-bot: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/poly-bot: lib/libopenNURBS.so.2012.10.245
bin/poly-bot: lib/libz.so.1.2.11
bin/poly-bot: lib/libregex.so.1.0.4
bin/poly-bot: src/conv/CMakeFiles/poly-bot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/poly-bot"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/poly-bot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/CMakeFiles/poly-bot.dir/build: bin/poly-bot

.PHONY : src/conv/CMakeFiles/poly-bot.dir/build

src/conv/CMakeFiles/poly-bot.dir/requires: src/conv/CMakeFiles/poly-bot.dir/poly-bot.c.o.requires

.PHONY : src/conv/CMakeFiles/poly-bot.dir/requires

src/conv/CMakeFiles/poly-bot.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv && $(CMAKE_COMMAND) -P CMakeFiles/poly-bot.dir/cmake_clean.cmake
.PHONY : src/conv/CMakeFiles/poly-bot.dir/clean

src/conv/CMakeFiles/poly-bot.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/CMakeFiles/poly-bot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/CMakeFiles/poly-bot.dir/depend
