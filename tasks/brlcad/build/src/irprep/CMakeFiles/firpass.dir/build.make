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
include src/irprep/CMakeFiles/firpass.dir/depend.make

# Include the progress variables for this target.
include src/irprep/CMakeFiles/firpass.dir/progress.make

# Include the compile flags for this target's objects.
include src/irprep/CMakeFiles/firpass.dir/flags.make

src/irprep/CMakeFiles/firpass.dir/firpass.c.o: src/irprep/CMakeFiles/firpass.dir/flags.make
src/irprep/CMakeFiles/firpass.dir/firpass.c.o: ../src/irprep/firpass.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/irprep/CMakeFiles/firpass.dir/firpass.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/firpass.dir/firpass.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/firpass.c

src/irprep/CMakeFiles/firpass.dir/firpass.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/firpass.dir/firpass.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/firpass.c > CMakeFiles/firpass.dir/firpass.c.i

src/irprep/CMakeFiles/firpass.dir/firpass.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/firpass.dir/firpass.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/firpass.c -o CMakeFiles/firpass.dir/firpass.c.s

src/irprep/CMakeFiles/firpass.dir/firpass.c.o.requires:

.PHONY : src/irprep/CMakeFiles/firpass.dir/firpass.c.o.requires

src/irprep/CMakeFiles/firpass.dir/firpass.c.o.provides: src/irprep/CMakeFiles/firpass.dir/firpass.c.o.requires
	$(MAKE) -f src/irprep/CMakeFiles/firpass.dir/build.make src/irprep/CMakeFiles/firpass.dir/firpass.c.o.provides.build
.PHONY : src/irprep/CMakeFiles/firpass.dir/firpass.c.o.provides

src/irprep/CMakeFiles/firpass.dir/firpass.c.o.provides.build: src/irprep/CMakeFiles/firpass.dir/firpass.c.o


src/irprep/CMakeFiles/firpass.dir/subroutines.c.o: src/irprep/CMakeFiles/firpass.dir/flags.make
src/irprep/CMakeFiles/firpass.dir/subroutines.c.o: ../src/irprep/subroutines.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/irprep/CMakeFiles/firpass.dir/subroutines.c.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/firpass.dir/subroutines.c.o   -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/subroutines.c

src/irprep/CMakeFiles/firpass.dir/subroutines.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/firpass.dir/subroutines.c.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/subroutines.c > CMakeFiles/firpass.dir/subroutines.c.i

src/irprep/CMakeFiles/firpass.dir/subroutines.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/firpass.dir/subroutines.c.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep/subroutines.c -o CMakeFiles/firpass.dir/subroutines.c.s

src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.requires:

.PHONY : src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.requires

src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.provides: src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.requires
	$(MAKE) -f src/irprep/CMakeFiles/firpass.dir/build.make src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.provides.build
.PHONY : src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.provides

src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.provides.build: src/irprep/CMakeFiles/firpass.dir/subroutines.c.o


# Object files for target firpass
firpass_OBJECTS = \
"CMakeFiles/firpass.dir/firpass.c.o" \
"CMakeFiles/firpass.dir/subroutines.c.o"

# External object files for target firpass
firpass_EXTERNAL_OBJECTS =

bin/firpass: src/irprep/CMakeFiles/firpass.dir/firpass.c.o
bin/firpass: src/irprep/CMakeFiles/firpass.dir/subroutines.c.o
bin/firpass: src/irprep/CMakeFiles/firpass.dir/build.make
bin/firpass: lib/librt.so.20.0.1
bin/firpass: lib/libgdiam.so
bin/firpass: lib/libvds.so.1.0.1
bin/firpass: lib/libbrep.so.20.0.1
bin/firpass: lib/libnmg.so
bin/firpass: lib/libbg.so.20.0.1
bin/firpass: lib/libSPSR.so
bin/firpass: lib/libbn.so.20.0.1
bin/firpass: lib/libbu.so.20.0.1
bin/firpass: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/firpass: lib/libopenNURBS.so.2012.10.245
bin/firpass: lib/libp2t.so.1.0.1
bin/firpass: lib/libz.so.1.2.11
bin/firpass: lib/libregex.so.1.0.4
bin/firpass: lib/liblz4.so
bin/firpass: src/irprep/CMakeFiles/firpass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../../bin/firpass"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/firpass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/irprep/CMakeFiles/firpass.dir/build: bin/firpass

.PHONY : src/irprep/CMakeFiles/firpass.dir/build

src/irprep/CMakeFiles/firpass.dir/requires: src/irprep/CMakeFiles/firpass.dir/firpass.c.o.requires
src/irprep/CMakeFiles/firpass.dir/requires: src/irprep/CMakeFiles/firpass.dir/subroutines.c.o.requires

.PHONY : src/irprep/CMakeFiles/firpass.dir/requires

src/irprep/CMakeFiles/firpass.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep && $(CMAKE_COMMAND) -P CMakeFiles/firpass.dir/cmake_clean.cmake
.PHONY : src/irprep/CMakeFiles/firpass.dir/clean

src/irprep/CMakeFiles/firpass.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/irprep /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/irprep/CMakeFiles/firpass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/irprep/CMakeFiles/firpass.dir/depend

