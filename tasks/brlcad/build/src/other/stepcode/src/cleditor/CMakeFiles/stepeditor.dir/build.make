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
include src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/depend.make

# Include the progress variables for this target.
include src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/progress.make

# Include the compile flags for this target's objects.
include src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o: ../src/other/stepcode/src/cleditor/STEPfile.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/STEPfile.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/STEPfile.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.cc > CMakeFiles/stepeditor.dir/STEPfile.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/STEPfile.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.cc -o CMakeFiles/stepeditor.dir/STEPfile.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o


src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o: ../src/other/stepcode/src/cleditor/STEPfile.inline.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.inline.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/STEPfile.inline.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.inline.cc > CMakeFiles/stepeditor.dir/STEPfile.inline.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/STEPfile.inline.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/STEPfile.inline.cc -o CMakeFiles/stepeditor.dir/STEPfile.inline.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o


src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o: ../src/other/stepcode/src/cleditor/cmdmgr.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/cmdmgr.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/cmdmgr.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/cmdmgr.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/cmdmgr.cc > CMakeFiles/stepeditor.dir/cmdmgr.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/cmdmgr.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/cmdmgr.cc -o CMakeFiles/stepeditor.dir/cmdmgr.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o


src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o: ../src/other/stepcode/src/cleditor/SdaiHeaderSchema.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchema.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchema.cc > CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchema.cc -o CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o


src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o: ../src/other/stepcode/src/cleditor/SdaiHeaderSchemaAll.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchemaAll.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchemaAll.cc > CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchemaAll.cc -o CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o


src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o: ../src/other/stepcode/src/cleditor/SdaiHeaderSchemaInit.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchemaInit.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchemaInit.cc > CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiHeaderSchemaInit.cc -o CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o


src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/flags.make
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o: ../src/other/stepcode/src/cleditor/SdaiSchemaInit.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o -c /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiSchemaInit.cc

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.i"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiSchemaInit.cc > CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.i

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.s"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor/SdaiSchemaInit.cc -o CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.s

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.requires:

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.provides: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.requires
	$(MAKE) -f src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.provides.build
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.provides

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.provides.build: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o


# Object files for target stepeditor
stepeditor_OBJECTS = \
"CMakeFiles/stepeditor.dir/STEPfile.cc.o" \
"CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o" \
"CMakeFiles/stepeditor.dir/cmdmgr.cc.o" \
"CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o" \
"CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o" \
"CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o" \
"CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o"

# External object files for target stepeditor
stepeditor_EXTERNAL_OBJECTS =

lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build.make
lib/libstepeditor.so.2.0.0: lib/libstepcore.so.2.0.0
lib/libstepeditor.so.2.0.0: lib/libstepdai.so.2.0.0
lib/libstepeditor.so.2.0.0: lib/libsteputils.so.2.0.0
lib/libstepeditor.so.2.0.0: lib/libbase.so.2.0.0
lib/libstepeditor.so.2.0.0: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX shared library ../../../../../lib/libstepeditor.so"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stepeditor.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && $(CMAKE_COMMAND) -E cmake_symlink_library ../../../../../lib/libstepeditor.so.2.0.0 ../../../../../lib/libstepeditor.so.2 ../../../../../lib/libstepeditor.so

lib/libstepeditor.so.2: lib/libstepeditor.so.2.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libstepeditor.so.2

lib/libstepeditor.so: lib/libstepeditor.so.2.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libstepeditor.so

# Rule to build all files generated by this target.
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build: lib/libstepeditor.so

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/build

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.cc.o.requires
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/STEPfile.inline.cc.o.requires
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/cmdmgr.cc.o.requires
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchema.cc.o.requires
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaAll.cc.o.requires
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiHeaderSchemaInit.cc.o.requires
src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires: src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/SdaiSchemaInit.cc.o.requires

.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/requires

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor && $(CMAKE_COMMAND) -P CMakeFiles/stepeditor.dir/cmake_clean.cmake
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/clean

src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/other/stepcode/src/cleditor /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/other/stepcode/src/cleditor/CMakeFiles/stepeditor.dir/depend

