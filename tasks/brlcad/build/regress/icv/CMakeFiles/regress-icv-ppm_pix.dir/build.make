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

# Utility rule file for regress-icv-ppm_pix.

# Include the progress variables for this target.
include regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/progress.make

regress/icv/CMakeFiles/regress-icv-ppm_pix: bin/pixcmp
regress/icv/CMakeFiles/regress-icv-ppm_pix: bin/icv
regress/icv/CMakeFiles/regress-icv-ppm_pix: regress/icv/ppm_pix.done


regress/icv/ppm_pix.done: bin/pixcmp
regress/icv/ppm_pix.done: bin/icv
regress/icv/ppm_pix.done: bin/pixcmp
regress/icv/ppm_pix.done: bin/icv
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ppm_pix.done"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv && /usr/bin/cmake -P /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/regress-ppm_pix.cmake

regress-icv-ppm_pix: regress/icv/CMakeFiles/regress-icv-ppm_pix
regress-icv-ppm_pix: regress/icv/ppm_pix.done
regress-icv-ppm_pix: regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/build.make

.PHONY : regress-icv-ppm_pix

# Rule to build all files generated by this target.
regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/build: regress-icv-ppm_pix

.PHONY : regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/build

regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv && $(CMAKE_COMMAND) -P CMakeFiles/regress-icv-ppm_pix.dir/cmake_clean.cmake
.PHONY : regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/clean

regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/regress/icv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : regress/icv/CMakeFiles/regress-icv-ppm_pix.dir/depend

