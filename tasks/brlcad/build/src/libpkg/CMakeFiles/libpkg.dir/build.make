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
include src/libpkg/CMakeFiles/libpkg.dir/depend.make

# Include the progress variables for this target.
include src/libpkg/CMakeFiles/libpkg.dir/progress.make

# Include the compile flags for this target's objects.
include src/libpkg/CMakeFiles/libpkg.dir/flags.make

# Object files for target libpkg
libpkg_OBJECTS =

# External object files for target libpkg
libpkg_EXTERNAL_OBJECTS = \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o" \
"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o"

lib/libpkg.so.20.0.1: src/libpkg/CMakeFiles/libpkg-obj.dir/pkg.c.o
lib/libpkg.so.20.0.1: src/libpkg/CMakeFiles/libpkg-obj.dir/vers.c.o
lib/libpkg.so.20.0.1: src/libpkg/CMakeFiles/libpkg.dir/build.make
lib/libpkg.so.20.0.1: lib/libbu.so.20.0.1
lib/libpkg.so.20.0.1: /usr/lib/x86_64-linux-gnu/libuuid.so
lib/libpkg.so.20.0.1: lib/libregex.so.1.0.4
lib/libpkg.so.20.0.1: src/libpkg/CMakeFiles/libpkg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C shared library ../../lib/libpkg.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libpkg.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libpkg.so.20.0.1 ../../lib/libpkg.so.20 ../../lib/libpkg.so

lib/libpkg.so.20: lib/libpkg.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libpkg.so.20

lib/libpkg.so: lib/libpkg.so.20.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libpkg.so

# Rule to build all files generated by this target.
src/libpkg/CMakeFiles/libpkg.dir/build: lib/libpkg.so

.PHONY : src/libpkg/CMakeFiles/libpkg.dir/build

src/libpkg/CMakeFiles/libpkg.dir/requires:

.PHONY : src/libpkg/CMakeFiles/libpkg.dir/requires

src/libpkg/CMakeFiles/libpkg.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg && $(CMAKE_COMMAND) -P CMakeFiles/libpkg.dir/cmake_clean.cmake
.PHONY : src/libpkg/CMakeFiles/libpkg.dir/clean

src/libpkg/CMakeFiles/libpkg.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/libpkg /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/libpkg/CMakeFiles/libpkg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libpkg/CMakeFiles/libpkg.dir/depend

