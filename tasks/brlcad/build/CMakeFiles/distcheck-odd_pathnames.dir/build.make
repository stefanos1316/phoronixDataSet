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

# Utility rule file for distcheck-odd_pathnames.

# Include the progress variables for this target.
include CMakeFiles/distcheck-odd_pathnames.dir/progress.make

CMakeFiles/distcheck-odd_pathnames:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "[distcheck-odd_pathnames] Performing distcheck - odd_pathnames configuration..."
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Extracting\ TGZ\ archive...
	/usr/bin/cmake -E remove distcheck_odd_pathnames.log
	/usr/bin/cmake -E remove_directory distcheck-odd_pathnames
	/usr/bin/cmake -E make_directory distcheck-odd_pathnames
	/usr/bin/cmake -E chdir distcheck-odd_pathnames /usr/bin/cmake -E tar xzf ../brlcad-7.28.0.tar.gz
	/usr/bin/cmake -E rename distcheck-odd_pathnames/brlcad-7.28.0 distcheck-odd_pathnames/1\ Odd_\ source\ dir\ ++
	/usr/bin/cmake -E make_directory distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Extracting\ TGZ\ archive...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Configuring...\ 
	/usr/bin/cmake -E chdir distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++ /usr/bin/cmake ../1\ Odd_\ source\ dir\ ++ -DCMAKE_BUILD_TYPE=Debug -DBRLCAD_BUNDLED_LIBS=BUNDLED -DCMAKE_INSTALL_PREFIX=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/distcheck-odd_pathnames/1\ Odd_\ install\ dir\ ++ >> distcheck-odd_pathnames.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Configuring...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Compiling\ using\ source\ from\ TGZ\ archive...
	/usr/bin/cmake -E chdir distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++ $(MAKE) >> distcheck-odd_pathnames.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Compiling\ using\ source\ from\ TGZ\ archive...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Run\ build-directory\ unit,\ benchmark\ and\ regression\ testing...
	/usr/bin/cmake -E chdir distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++ /usr/bin/cmake --build . --target check >> distcheck-odd_pathnames.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Run\ build-directory\ unit,\ benchmark\ and\ regression\ testing...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Install\ from\ tgz\ build\ directory...
	/usr/bin/cmake -E make_directory distcheck-odd_pathnames/1\ Odd_\ install\ dir\ ++
	/usr/bin/cmake -E chdir distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++ $(MAKE) install >> distcheck-odd_pathnames.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Install\ from\ tgz\ build\ directory...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Test\ distclean\ rule...
	/usr/bin/cmake -E remove -f distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++/bench/summary
	/usr/bin/cmake -E chdir distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++ /usr/bin/cmake --build . --target distclean >> distcheck-odd_pathnames.log 2>&1
	/usr/bin/cmake -P /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck-odd_pathnames-eval_distclean.cmake
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Test\ distclean\ rule...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Clear\ tgz\ archive\ sources\ and\ build\ directory...
	/usr/bin/cmake -E remove_directory distcheck-odd_pathnames/1\ Odd_\ source\ dir\ ++
	/usr/bin/cmake -E remove_directory distcheck-odd_pathnames/1\ Odd_\ build\ dir\ ++
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Clear\ tgz\ archive\ sources\ and\ build\ directory...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Run\ benchmark\ testing\ from\ tgz\ archive\ installed\ build...
	/usr/bin/cmake -E chdir distcheck-odd_pathnames/1\ Odd_\ install\ dir\ ++ bin/benchmark run TIMEFRAME=1 >> distcheck-odd_pathnames.log 2>&1
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Run\ benchmark\ testing\ from\ installed\ build...\ Done.
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Cleanup...
	/usr/bin/cmake -E remove_directory distcheck-odd_pathnames
	/usr/bin/cmake -E echo --\ distcheck-odd_pathnames\ -\ Cleanup...\ Done.

distcheck-odd_pathnames: CMakeFiles/distcheck-odd_pathnames
distcheck-odd_pathnames: CMakeFiles/distcheck-odd_pathnames.dir/build.make

.PHONY : distcheck-odd_pathnames

# Rule to build all files generated by this target.
CMakeFiles/distcheck-odd_pathnames.dir/build: distcheck-odd_pathnames

.PHONY : CMakeFiles/distcheck-odd_pathnames.dir/build

CMakeFiles/distcheck-odd_pathnames.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/distcheck-odd_pathnames.dir/cmake_clean.cmake
.PHONY : CMakeFiles/distcheck-odd_pathnames.dir/clean

CMakeFiles/distcheck-odd_pathnames.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles/distcheck-odd_pathnames.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/distcheck-odd_pathnames.dir/depend

