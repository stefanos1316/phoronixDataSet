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

# Utility rule file for embedded_licenses_cp.

# Include the progress variables for this target.
include doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/progress.make

doc/legal/embedded/CMakeFiles/embedded_licenses_cp: doc/legal/embedded/embedded_licenses.sentinel


doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/ayam_icons.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/bullet.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/chull2d.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/chull3d.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/db_faa-info.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/db_nist-info.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/dehumanize.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/DejaVu_Fonts.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/ear_clipping.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/fnmatch.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/fontstash.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/gct.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/gdal_gcv_plugin.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/humanize.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/hv3.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/hv3_combobox.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/hv3_snit.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/msinttypes.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/nurbs_fit.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/obr.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/openimageio.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/OpenNURBS.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/osg.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/osl.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/pbrt.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/point_in_polygon.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/polygonizer.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/pstdint.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/qsort.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/randmt.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/realpath.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/scriptsort.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/search.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/sh_wood.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/sobolseq.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/SPSR.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/sscanf.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/STIX_Font_License_2010.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/tcl.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/tinythread.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/tkcon.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/uce_dirent.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/x24.txt
doc/legal/embedded/embedded_licenses.sentinel: ../doc/legal/embedded/y2038.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating embedded_licenses.sentinel"
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/legal/embedded && /usr/bin/cmake -E touch /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/legal/embedded/embedded_licenses.sentinel

embedded_licenses_cp: doc/legal/embedded/CMakeFiles/embedded_licenses_cp
embedded_licenses_cp: doc/legal/embedded/embedded_licenses.sentinel
embedded_licenses_cp: doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/build.make

.PHONY : embedded_licenses_cp

# Rule to build all files generated by this target.
doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/build: embedded_licenses_cp

.PHONY : doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/build

doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/clean:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/legal/embedded && $(CMAKE_COMMAND) -P CMakeFiles/embedded_licenses_cp.dir/cmake_clean.cmake
.PHONY : doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/clean

doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/depend:
	cd /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/legal/embedded /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/legal/embedded /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/legal/embedded/CMakeFiles/embedded_licenses_cp.dir/depend

