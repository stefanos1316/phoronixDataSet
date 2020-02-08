#     D I S T C H E C K _ R E P O _ V E R I F Y . C M A K E . I N
#
# BRL-CAD
#
# Copyright (c) 2011-2018 United States Government as represented by
# the U.S. Army Research Laboratory.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following
# disclaimer in the documentation and/or other materials provided
# with the distribution.
#
# 3. The name of the author may not be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
# OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
###
if(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/testing")
  message(FATAL_ERROR "\nThe directory /home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/testing is present.  Remove this directory from the source tree before proceeding with distcheck.")
endif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/src/testing")

set(NOT_DISTCHECK_READY 0)
set(CMAKE_BINARY_DIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build")

# Avoid empty items in lists, so we don't trigger a CMake warning
function(scrub_list SLIST)
  set(NONEMPTY)
  foreach(sf ${${SLIST}})
    if(NOT "${sf}" STREQUAL "")
      list(APPEND NONEMPTY "${sf}")
    endif(NOT "${sf}" STREQUAL "")
  endforeach(sf ${${SLIST}})
  string(REGEX REPLACE "^;" "" NONEMPTY "${NONEMPTY}")
  set(${SLIST} ${NONEMPTY} PARENT_SCOPE)
endfunction(scrub_list SLIST)

# Subversion generates a textual report that we need to convert into a file
# list.  The basic approach is to crush anything that's not what we want down
# to line returns, then replace all line returns with semicolons to create
# a valid CMake lists.
function(SVN_INFO_TO_PATH_LIST SVN_INFO SVN_PATHLIST)
  set(SVN_PROCESSING ${${SVN_INFO}})
  string(REGEX REPLACE "Name: [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "URL: [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Repository [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Text Last[^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Last [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Checksum: [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Copied From [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Revision: [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Schedule: [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Node Kind: [^\r\n]*" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Path: " "" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/" "" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad\r?\n" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Relative[^\r\n]*\r?\n" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "Working Copy Root[^\r\n]*\r?\n" "\n" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "\n" ";" SVN_PROCESSING "${SVN_PROCESSING}")
  string(REGEX REPLACE "/;" ";" SVN_PROCESSING "${SVN_PROCESSING}")
  scrub_list(SVN_PROCESSING)
  set(SVN_FILES)
  foreach(sf ${SVN_PROCESSING})
    if(NOT IS_DIRECTORY "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/${sf}")
      list(APPEND SVN_FILES ${sf})
    endif(NOT IS_DIRECTORY "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/${sf}")
  endforeach(sf ${SVN_PROCESSING})
  set(${SVN_PATHLIST} "${SVN_FILES}" PARENT_SCOPE)
endfunction(SVN_INFO_TO_PATH_LIST)


# Look for Subversion - if we don't have the command, we can't query the
# repository even if it is present.
find_program(SVN_EXEC svn)

# We need the Subversion binary and the source directory must be a
# checkout of the BRL-CAD subversion repository.  If these two conditions
# are met, we can collect information from subversion
if(SVN_EXEC AND EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")

  # By default, assume that nothing has been modified.
  set(SVN_TREE_MODIFIED 0)

  # Get the file list
  set(SVN_FILES "")
  execute_process(COMMAND ${SVN_EXEC} info -R "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad" OUTPUT_VARIABLE SVN_STDOUT ERROR_VARIABLE SVN_STDERR RESULT_VARIABLE RETVAL)
  if (RETVAL)
    message("")
    message("WARNING: Subversion does not seem to be working correctly.")
    message("         Output from ${SVN_EXEC} info -R \"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad\":")
    message("${SVN_STDERR}")
  endif (RETVAL)

  message(" --- Building file list from Subversion manifests: ...")

  SVN_INFO_TO_PATH_LIST(SVN_STDOUT SVN_FILES)

  # Check whether Subversion is reporting modified files.  Also, if any
  # deleted files are reported, remove those from the SVN_FILES list
  execute_process(COMMAND ${SVN_EXEC} status "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad" OUTPUT_VARIABLE SVN_STDOUT ERROR_VARIABLE SVN_STDERR)
  string(REPLACE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/" "" SVN_STDOUT "${SVN_STDOUT}")
  string(REGEX REPLACE "\r?\n" ";" SVN_STATUS "${SVN_STDOUT}")
  foreach(ITEM ${SVN_STATUS})
    if(${ITEM} MATCHES "^M")
      set(SVN_TREE_MODIFIED 1)
    endif(${ITEM} MATCHES "^M")
    if(${ITEM} MATCHES "^D")
      string(REGEX REPLACE "^D[\\t\\ ]*" "" item_path "${ITEM}")
      list(REMOVE_ITEM SVN_FILES ${item_path})
    endif(${ITEM} MATCHES "^D")
  endforeach(ITEM ${SVN_STATUS})

  # Generate a sorted text file with the results of the Subversion list processing.
  scrub_list(SVN_FILES)
  list(SORT SVN_FILES)
  list(REMOVE_DUPLICATES SVN_FILES)

  # If we've got modified files, we shouldn't use resulting tarballs for a distribution -
  # warn accordingly.
  if(SVN_TREE_MODIFIED)
    message("\n**** NOTE:  Subversion reports modified source files present in the source tree.\n     Distcheck proceeding, but archives will not be suitable for release.\n")
    set(NOT_DISTCHECK_READY 1)
  endif(SVN_TREE_MODIFIED)

  message(" --- Building file list from Subversion manifests: Done")

endif(SVN_EXEC AND EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")

# The build system has kindly created lists of files and directories for us,
# but in order to compare the build system's lists to the others generated
# by this script we need the fully expanded list.  Read and expand...
message(" --- Building list of files known to the build system: ...")
file(STRINGS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/cmakefiles.cmake" BUILD_FILES)
foreach(BF ${BUILD_FILES})
  get_filename_component(BFA "${BF}" ABSOLUTE BASE_DIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad")
  string(REPLACE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/" "" BFA "${BFA}")
  list(APPEND BFLS ${BFA})
endforeach(BF ${BUILD_FILES})
set(BUILD_FILES "${BFLS}")
list(SORT BUILD_FILES)
list(REMOVE_DUPLICATES BUILD_FILES)
message(" --- Building list of files known to the build system: Done")

# Get the CPack ignore build path value from the parent CMake build
set(CPACK_IGNORE_BUILD_PATH "")

# Determing what files are actually present on the file system at the
# time this is executed (as opposed to what the build system or
# Subversion *expect* to be present) minus files that CPack knows to
# ignore (i.e., things that will not be included in a source archive.)
message(" --- Building list of files actually present in source tree: ...")
file(GLOB_RECURSE FS_FILE_LIST RELATIVE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/*")
# Start scrubbing...
set(FS_FILES)
foreach(pf ${FS_FILE_LIST})
  if(NOT "${pf}" MATCHES ".*\\.svn/.*")
    if(CPACK_IGNORE_BUILD_PATH)
      if(NOT "${pf}" MATCHES "^${CPACK_IGNORE_BUILD_PATH}.*")
	list(APPEND FS_FILES ${pf})
      endif(NOT "${pf}" MATCHES "^${CPACK_IGNORE_BUILD_PATH}.*")
    else(CPACK_IGNORE_BUILD_PATH)
      list(APPEND FS_FILES ${pf})
    endif(CPACK_IGNORE_BUILD_PATH)
  endif(NOT "${pf}" MATCHES ".*\\.svn/.*")
endforeach(pf ${FS_FILE_LIST})
set(FS_FILE_LIST ${FS_FILES})
if(NOT FS_FILE_LIST)
  message(FATAL_ERROR "FATAL: No files found in file system search?? ")
endif(NOT FS_FILE_LIST)
# Generate a sorted text file with the results of the CMake build system list processing.
list(REMOVE_DUPLICATES FS_FILE_LIST)
list(SORT FS_FILE_LIST)
message(" --- Building list of files actually present in source tree: Done")

# To generate lists of "interesting" files - things the build system knows about but
# subversion doesn't, files the Subversion system knows about that the build system
# doesn't, and files present in the source tree that *neither* system knows about,
# we need to generate relative compliment sets of the various lists.  Using a technique
# from Eric Noulard on the CMake mailing list:
#
# http://www.cmake.org/pipermail/cmake/2011-September/046214.html
message(" --- Performing comparisons...")

# If we have Subversion, we can do lots more interesting comparisons.
# Otherwise, just look for files the build system doesn't know about.
if(SVN_EXEC AND EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")

  # Report file in Subversion but not the build logic:
  set(SVN_FILES_NOT_IN_BUILD ${SVN_FILES})
  list(REMOVE_ITEM SVN_FILES_NOT_IN_BUILD ${BUILD_FILES})
  if(SVN_FILES_NOT_IN_BUILD)
    string(REPLACE ";" "\n" SVN_FILES_NOT_IN_BUILD "${SVN_FILES_NOT_IN_BUILD}")
    message("\nFiles known to subversion are not accounted for in build logic: \n${SVN_FILES_NOT_IN_BUILD}\n")
  endif(SVN_FILES_NOT_IN_BUILD)

  # Report file in the build logic but not Subversion:
  set(BUILD_FILES_NOT_IN_SVN ${BUILD_FILES})
  list(REMOVE_ITEM BUILD_FILES_NOT_IN_SVN ${SVN_FILES})
  if(BUILD_FILES_NOT_IN_SVN)
    string(REPLACE ";" "\n" BUILD_FILES_NOT_IN_SVN "${BUILD_FILES_NOT_IN_SVN}")
    message("\nFiles mentioned in build logic are not checked into the repository: \n${BUILD_FILES_NOT_IN_SVN}\n")
  endif(BUILD_FILES_NOT_IN_SVN)

  # Either of the previous two cases halts distcheck until fixed.
  set(FORCE_DISTCHECK )
  if (SVN_FILES_NOT_IN_BUILD OR BUILD_FILES_NOT_IN_SVN)
    if (NOT FORCE_DISTCHECK)
      message(FATAL_ERROR "ERROR: Distcheck cannot proceed until build files and repo are in sync (set -DFORCE_DISTCHECK=ON to override)")
    endif (NOT FORCE_DISTCHECK)
  endif (SVN_FILES_NOT_IN_BUILD OR BUILD_FILES_NOT_IN_SVN)

endif(SVN_EXEC AND EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")

set(IGNORED_FS_FILES ${FS_FILE_LIST})
list(REMOVE_ITEM IGNORED_FS_FILES ${BUILD_FILES})
if(IGNORED_FS_FILES)
  string(REPLACE ";" "\n" IGNORED_FS_FILES "${IGNORED_FS_FILES}")
  message("\nFiles unknown to both Subversion and the Build logic (will not be incorporated into dist):\n${IGNORED_FS_FILES}\n")
endif(IGNORED_FS_FILES)

# Write out the archive status so the build targets can see it later.
if(NOT_DISTCHECK_READY)
  if("${NOT_DISTCHECK_READY}" STREQUAL "1")
    file(WRITE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_remove_archives_if_invalid" "execute_process(COMMAND /usr/bin/cmake -E echo \"Archive files contain modified sources, NOT suitable for distribution.\")\n")
  endif("${NOT_DISTCHECK_READY}" STREQUAL "1")
  file(APPEND "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_remove_archives_if_invalid" "execute_process(COMMAND /usr/bin/cmake -E remove \"${CPACK_SOURCE_PACKAGE_FILE_NAME}.tar.gz\")\n")
  file(APPEND "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_remove_archives_if_invalid" "execute_process(COMMAND /usr/bin/cmake -E remove \"${CPACK_SOURCE_PACKAGE_FILE_NAME}.tar.bz2\")\n")
  file(APPEND "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_remove_archives_if_invalid" "execute_process(COMMAND /usr/bin/cmake -E remove \"${CPACK_SOURCE_PACKAGE_FILE_NAME}.zip\")\n")
else(NOT_DISTCHECK_READY)
  if(NOT SVN_EXEC OR NOT EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")
    file(WRITE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_remove_archives_if_invalid" "execute_process(COMMAND /usr/bin/cmake -E echo \"Note:  Archive files were generated without being able to compare them to the Subversion archive master file lists..\")\n")
  else(NOT SVN_EXEC OR NOT EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")
    file(WRITE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_remove_archives_if_invalid" "")
  endif(NOT SVN_EXEC OR NOT EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")
endif(NOT_DISTCHECK_READY)

# All done - print result messages and prepare the appropriate final message for the distcheck build.
set(FINAL_DIST_MESSAGE "--- distcheck succeeded ---")
if("${NOT_DISTCHECK_READY}")
  set(FINAL_DIST_MESSAGE "--- distcheck compilation succeeded, archives not ready ---")
endif("${NOT_DISTCHECK_READY}")
if(NOT SVN_EXEC OR NOT EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")
  set(FINAL_DIST_MESSAGE "--- distcheck succeeded ---\n*** Archive files pass available checks, but a distcheck using Subversion is recommended for archive files intended for distribution. ***")
endif(NOT SVN_EXEC OR NOT EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/.svn")
file(WRITE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/distcheck_message" "execute_process(COMMAND /usr/bin/cmake -E echo \"${FINAL_DIST_MESSAGE}\")")

# If we got this far, it worked
message("Source Repository Verification: Passed")

# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8
