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
include src/conv/intaval/CMakeFiles/tgf-g.dir/depend.make

# Include the progress variables for this target.
include src/conv/intaval/CMakeFiles/tgf-g.dir/progress.make

# Include the compile flags for this target's objects.
include src/conv/intaval/CMakeFiles/tgf-g.dir/flags.make

src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o: src/conv/intaval/CMakeFiles/tgf-g.dir/flags.make
src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o: ../src/conv/intaval/read_dra.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tgf-g.dir/read_dra.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/read_dra.cpp

src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgf-g.dir/read_dra.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/read_dra.cpp > CMakeFiles/tgf-g.dir/read_dra.cpp.i

src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgf-g.dir/read_dra.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/read_dra.cpp -o CMakeFiles/tgf-g.dir/read_dra.cpp.s

src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.requires:

.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.requires

src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.provides: src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.requires
	$(MAKE) -f src/conv/intaval/CMakeFiles/tgf-g.dir/build.make src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.provides.build
.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.provides

src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.provides.build: src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o


src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o: src/conv/intaval/CMakeFiles/tgf-g.dir/flags.make
src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o: ../src/conv/intaval/regtab.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tgf-g.dir/regtab.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/regtab.cpp

src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgf-g.dir/regtab.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/regtab.cpp > CMakeFiles/tgf-g.dir/regtab.cpp.i

src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgf-g.dir/regtab.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/regtab.cpp -o CMakeFiles/tgf-g.dir/regtab.cpp.s

src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.requires:

.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.requires

src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.provides: src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.requires
	$(MAKE) -f src/conv/intaval/CMakeFiles/tgf-g.dir/build.make src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.provides.build
.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.provides

src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.provides.build: src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o


src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o: src/conv/intaval/CMakeFiles/tgf-g.dir/flags.make
src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o: ../src/conv/intaval/tgf-g.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tgf-g.dir/tgf-g.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/tgf-g.cpp

src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgf-g.dir/tgf-g.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/tgf-g.cpp > CMakeFiles/tgf-g.dir/tgf-g.cpp.i

src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgf-g.dir/tgf-g.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/tgf-g.cpp -o CMakeFiles/tgf-g.dir/tgf-g.cpp.s

src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.requires:

.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.requires

src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.provides: src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.requires
	$(MAKE) -f src/conv/intaval/CMakeFiles/tgf-g.dir/build.make src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.provides.build
.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.provides

src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.provides.build: src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o


src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o: src/conv/intaval/CMakeFiles/tgf-g.dir/flags.make
src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o: ../src/conv/intaval/write_brl.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tgf-g.dir/write_brl.cpp.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/write_brl.cpp

src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tgf-g.dir/write_brl.cpp.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/write_brl.cpp > CMakeFiles/tgf-g.dir/write_brl.cpp.i

src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tgf-g.dir/write_brl.cpp.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval/write_brl.cpp -o CMakeFiles/tgf-g.dir/write_brl.cpp.s

src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.requires:

.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.requires

src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.provides: src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.requires
	$(MAKE) -f src/conv/intaval/CMakeFiles/tgf-g.dir/build.make src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.provides.build
.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.provides

src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.provides.build: src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o


# Object files for target tgf-g
tgf__g_OBJECTS = \
"CMakeFiles/tgf-g.dir/read_dra.cpp.o" \
"CMakeFiles/tgf-g.dir/regtab.cpp.o" \
"CMakeFiles/tgf-g.dir/tgf-g.cpp.o" \
"CMakeFiles/tgf-g.dir/write_brl.cpp.o"

# External object files for target tgf-g
tgf__g_EXTERNAL_OBJECTS =

bin/tgf-g: src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o
bin/tgf-g: src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o
bin/tgf-g: src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o
bin/tgf-g: src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o
bin/tgf-g: src/conv/intaval/CMakeFiles/tgf-g.dir/build.make
bin/tgf-g: lib/libwdb.so.20.0.1
bin/tgf-g: lib/librt.so.20.0.1
bin/tgf-g: lib/libgdiam.so
bin/tgf-g: lib/libvds.so.1.0.1
bin/tgf-g: lib/libbrep.so.20.0.1
bin/tgf-g: lib/libp2t.so.1.0.1
bin/tgf-g: lib/liblz4.so
bin/tgf-g: lib/libnmg.so
bin/tgf-g: lib/libbg.so.20.0.1
bin/tgf-g: lib/libSPSR.so
bin/tgf-g: lib/libbn.so.20.0.1
bin/tgf-g: lib/libbu.so.20.0.1
bin/tgf-g: /usr/lib/x86_64-linux-gnu/libuuid.so
bin/tgf-g: lib/libopenNURBS.so.2012.10.245
bin/tgf-g: lib/libz.so.1.2.11
bin/tgf-g: lib/libregex.so.1.0.4
bin/tgf-g: src/conv/intaval/CMakeFiles/tgf-g.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable ../../../bin/tgf-g"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tgf-g.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/conv/intaval/CMakeFiles/tgf-g.dir/build: bin/tgf-g

.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/build

src/conv/intaval/CMakeFiles/tgf-g.dir/requires: src/conv/intaval/CMakeFiles/tgf-g.dir/read_dra.cpp.o.requires
src/conv/intaval/CMakeFiles/tgf-g.dir/requires: src/conv/intaval/CMakeFiles/tgf-g.dir/regtab.cpp.o.requires
src/conv/intaval/CMakeFiles/tgf-g.dir/requires: src/conv/intaval/CMakeFiles/tgf-g.dir/tgf-g.cpp.o.requires
src/conv/intaval/CMakeFiles/tgf-g.dir/requires: src/conv/intaval/CMakeFiles/tgf-g.dir/write_brl.cpp.o.requires

.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/requires

src/conv/intaval/CMakeFiles/tgf-g.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval && $(CMAKE_COMMAND) -P CMakeFiles/tgf-g.dir/cmake_clean.cmake
.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/clean

src/conv/intaval/CMakeFiles/tgf-g.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/conv/intaval /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/conv/intaval/CMakeFiles/tgf-g.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/conv/intaval/CMakeFiles/tgf-g.dir/depend

