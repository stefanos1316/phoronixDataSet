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

# Utility rule file for distcheck-enableall_debug.

# Include the progress variables for this target.
include CMakeFiles/distcheck-enableall_debug.dir/progress.make

CMakeFiles/distcheck-enableall_debug:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "[distcheck-enableall_debug] Performing distcheck - enableall_debug configuration..."
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Extracting\ TGZ\ archive...
	/usr/bin/cmake -E remove distcheck_enableall_debug.log
	/usr/bin/cmake -E remove_directory distcheck-enableall_debug
	/usr/bin/cmake -E make_directory distcheck-enableall_debug
	/usr/bin/cmake -E chdir distcheck-enableall_debug /usr/bin/cmake -E tar xzf ../brlcad-7.28.0.tar.gz
	/usr/bin/cmake -E rename distcheck-enableall_debug/brlcad-7.28.0 distcheck-enableall_debug/brlcad-7.28.0
	/usr/bin/cmake -E make_directory distcheck-enableall_debug/build
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Extracting\ TGZ\ archive...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Configuring...\ 
	/usr/bin/cmake -E chdir distcheck-enableall_debug/build /usr/bin/cmake ../brlcad-7.28.0 -DCMAKE_BUILD_TYPE=Debug -DBRLCAD_BUNDLED_LIBS=BUNDLED -DCMAKE_INSTALL_PREFIX=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-enableall_debug/install >> distcheck-enableall_debug.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Configuring...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Compiling\ using\ source\ from\ TGZ\ archive...
	/usr/bin/cmake -E chdir distcheck-enableall_debug/build $(MAKE) >> distcheck-enableall_debug.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Compiling\ using\ source\ from\ TGZ\ archive...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Run\ build-directory\ unit,\ benchmark\ and\ regression\ testing...
	/usr/bin/cmake -E chdir distcheck-enableall_debug/build /usr/bin/cmake --build . --target check >> distcheck-enableall_debug.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Run\ build-directory\ unit,\ benchmark\ and\ regression\ testing...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Install\ from\ tgz\ build\ directory...
	/usr/bin/cmake -E make_directory distcheck-enableall_debug/install
	/usr/bin/cmake -E chdir distcheck-enableall_debug/build $(MAKE) install >> distcheck-enableall_debug.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Install\ from\ tgz\ build\ directory...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Test\ distclean\ rule...
	/usr/bin/cmake -E remove -f distcheck-enableall_debug/build/bench/summary
	/usr/bin/cmake -E chdir distcheck-enableall_debug/build /usr/bin/cmake --build . --target distclean >> distcheck-enableall_debug.log 2>&1
	/usr/bin/cmake -P /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck-enableall_debug-eval_distclean.cmake
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Test\ distclean\ rule...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Clear\ tgz\ archive\ sources\ and\ build\ directory...
	/usr/bin/cmake -E remove_directory distcheck-enableall_debug/brlcad-7.28.0
	/usr/bin/cmake -E remove_directory distcheck-enableall_debug/build
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Clear\ tgz\ archive\ sources\ and\ build\ directory...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Run\ benchmark\ testing\ from\ tgz\ archive\ installed\ build...
	/usr/bin/cmake -E chdir distcheck-enableall_debug/install bin/benchmark run TIMEFRAME=1 >> distcheck-enableall_debug.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Run\ benchmark\ testing\ from\ installed\ build...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Cleanup...
	/usr/bin/cmake -E remove_directory distcheck-enableall_debug
	/usr/bin/cmake -E echo --\ distcheck-enableall_debug\ -\ Cleanup...\ Done.

distcheck-enableall_debug: CMakeFiles/distcheck-enableall_debug
distcheck-enableall_debug: CMakeFiles/distcheck-enableall_debug.dir/build.make

.PHONY : distcheck-enableall_debug

# Rule to build all files generated by this target.
CMakeFiles/distcheck-enableall_debug.dir/build: distcheck-enableall_debug

.PHONY : CMakeFiles/distcheck-enableall_debug.dir/build

CMakeFiles/distcheck-enableall_debug.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/distcheck-enableall_debug.dir/cmake_clean.cmake
.PHONY : CMakeFiles/distcheck-enableall_debug.dir/clean

CMakeFiles/distcheck-enableall_debug.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles/distcheck-enableall_debug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/distcheck-enableall_debug.dir/depend

