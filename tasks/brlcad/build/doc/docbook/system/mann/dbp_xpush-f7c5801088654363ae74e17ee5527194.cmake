#                D O C B O O K . C M A K E . I N
# BRL-CAD
#
# Copyright (c) 2012-2018 United States Government as represented by
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

# Use the mechanism created to allow multiconfig builds to
# know what the current build type is to configure the script -
# depending on build type, output goes to different dirs.
if(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")
  set(BUILD_TYPE "Release")
elseif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Debug")
  set(BUILD_TYPE "Debug")
else(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")
  set(BUILD_TYPE)
endif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/CMakeTmp/CURRENT_PATH/Release")

set(XSLTPROC_EXECUTABLE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/bin/xsltproc")
set(XMLLINT_EXECUTABLE "")

macro(XSLTPROC stylesheet filename outfile extras)

  # If we're trying to do this but XSLTPROC_EXECUTABLE was unset somehow, fatal error
  if ("${XSLTPROC_EXECUTABLE}" STREQUAL "")
    message(FATAL_ERROR "xsltproc processing requested, but XSLTPROC_EXECUTABLE is not set.")
  endif ("${XSLTPROC_EXECUTABLE}" STREQUAL "")

  set(ENV{XML_DEBUG_CATALOG} 1)
  # It is necessary to ensure that the target directory exists *before* calling xsltproc
  # when building in parallel, due to a bug/limitation in xsltproc
  get_filename_component(output_dir "${outfile}" PATH)
  execute_process(COMMAND "/usr/bin/cmake" -E make_directory "${output_dir}/")
  execute_process(COMMAND "${XSLTPROC_EXECUTABLE}" -nonet -xinclude -o "${outfile}" "${stylesheet}" "${filename}"
    RESULT_VARIABLE CMDRESULT OUTPUT_VARIABLE CMDOUT ERROR_VARIABLE CMDERR)

  # For some reason, xsltproc doesn't always seem to respect the
  # output variable when doing man pages.  Add a backup check
  # to move the man page to the right location if xsltproc insists
  # on putting it in the current directory.
  get_filename_component(base_output_name "${outfile}" NAME)
  get_filename_component(base_output_path "${outfile}" PATH)
  set(output_names ${base_output_name} ${extras})
  foreach(output_name ${output_names})
    if(NOT "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${output_name}" STREQUAL "${base_output_path}/${output_name}")
      if(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${output_name}")
	execute_process(COMMAND "/usr/bin/cmake" -E copy "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${output_name}" "${base_output_path}/${output_name}")
	execute_process(COMMAND "/usr/bin/cmake" -E remove "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${output_name}" )
      endif(EXISTS "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${output_name}")
    endif(NOT "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${output_name}" STREQUAL "${base_output_path}/${output_name}")
  endforeach(output_name ${output_names})
  if(CMDRESULT)
    message(FATAL_ERROR "xsltproc build failure: ${CMDRESULT}\n${CMDOUT}\n${CMDERR}")
  endif(CMDRESULT)
endmacro(XSLTPROC)



# NOTE: Need to set filename to the full path of the source filename - relative
# paths won't work.
set(filename "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/system/mann/xpush.xml")
get_filename_component(filename_root "${filename}" NAME_WE)

# First step: validate the file.

set(VE "")
set(SCHEMA_DIR "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/docbook-schema")

if (NOT "${VE}" STREQUAL "")
  if ("xmllint" MATCHES "${VE}")

    if ("${XMLLINT_EXECUTABLE}" STREQUAL "")
      message(FATAL_ERROR "Validation failure: xmllint validation requested, but XMLLINT_EXECUTABLE is not set.")
    endif ("${XMLLINT_EXECUTABLE}" STREQUAL "")

    execute_process(COMMAND "${XMLLINT_EXECUTABLE}" --xinclude --schema "${SCHEMA_DIR}/xsd/docbook.xsd" --noout --nonet "${filename}"
      RESULT_VARIABLE CMDRESULT OUTPUT_VARIABLE CMDOUT ERROR_VARIABLE CMDERR)

  elseif ("rnv" MATCHES "${VE}")

    execute_process(COMMAND rnv "${SCHEMA_DIR}/rng/docbookxi.rnc" "${filename}"
      RESULT_VARIABLE CMDRESULT OUTPUT_VARIABLE CMDOUT ERROR_VARIABLE CMDERR)

  elseif ("msv" MATCHES "${VE}")

    execute_process(COMMAND msv -warning "${SCHEMA_DIR}/rng/docbookxi.rng" "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/system/mann/xpush.xml"
      RESULT_VARIABLE CMDRESULT OUTPUT_VARIABLE CMDOUT ERROR_VARIABLE CMDERR)

  else ("xmllint" MATCHES "${VE}")

    message(FATAL_ERROR "Unsupported XML validator specified: ${VE}")

  endif("xmllint" MATCHES "${VE}")

  # If we're not valid, we're done.
  if(CMDRESULT)
    message(FATAL_ERROR "${VE} validation failure on file ${filename}: ${CMDRESULT}\n${CMDOUT}\n${CMDERR}")
  endif(CMDRESULT)

endif (NOT "${VE}" STREQUAL "")

# Reset result variables.
set(CMDRESULT)
set(CMDOUT)
set(CMDERR)

# List the output formats we want for this file
set(CURRENT_OUTPUT_FORMATS HTML;MANN)

# Output files for each format
set(HTML_OUTFILE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/html/mann/xpush.html")
set(PHP_OUTFILE "")
set(PPT_OUTFILE "")
set(MAN1_OUTFILE "")
set(MAN3_OUTFILE "")
set(MAN5_OUTFILE "")
set(MANN_OUTFILE "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/share/doc/../man/mann/xpush.nged")
set(PDF_OUTFILE "")

# Extra outputs
set(HTML_EXTRAS "")
set(PHP_EXTRAS "")
set(PPT_EXTRAS "")
set(MAN1_EXTRAS "")
set(MAN3_EXTRAS "")
set(MAN5_EXTRAS "")
set(MANN_EXTRAS "")
set(PDF_EXTRAS "")

# stylesheets
set(XSL_HTML_STYLESHEET "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/brlcad-man-xhtml-stylesheet.xsl")
set(XSL_PHP_STYLESHEET  "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/wordpress.xsl")
set(XSL_PPT_STYLESHEET  "")
set(XSL_MAN1_STYLESHEET "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/brlcad-man-stylesheet.xsl")
set(XSL_MAN3_STYLESHEET "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/brlcad-man-stylesheet.xsl")
set(XSL_MAN5_STYLESHEET "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/brlcad-man-stylesheet.xsl")
set(XSL_MANN_STYLESHEET "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/brlcad-man-stylesheet.xsl")
set(XSL_FO_STYLESHEET   "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/../resources/brlcad/brlcad-man-fo-stylesheet.xsl")

set(XE "xsltproc")
set(target_deps)
foreach(fmt ${CURRENT_OUTPUT_FORMATS})
  set(CURRENT_XSL_STYLESHEET ${XSL_${fmt}_STYLESHEET})
  set(EXTRAS ${${fmt}_EXTRAS})
  set(outfile "${${fmt}_OUTFILE}")

  # TODO: Handle multi-config output paths, probably something similar to the regress solution...

  # Process the file

  if(NOT "${fmt}" STREQUAL "PDF")

    # If we don't have to handle PDF, things are fairly simple
    if("xsltproc" MATCHES "${XE}")
      XSLTPROC("${XSL_${fmt}_STYLESHEET}" "${filename}" "${outfile}" "${${fmt}_EXTRAS}")
    else("xsltproc" MATCHES "${XE}")
      message(FATAL_ERROR "Unsupported XML validator specified: ${XE}")
    endif ("xsltproc" MATCHES "${XE}")

  else(NOT "${fmt}" STREQUAL "PDF")

    set(fo_outfile "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/system/mann/${filename_root}.fo")
    if ("xsltproc" MATCHES "${XE}")
      XSLTPROC("${XSL_FO_STYLESHEET}" "${filename}" "${fo_outfile}" "")
    else("xsltproc" MATCHES "${XE}")
      message(FATAL_ERROR "Unsupported XML validator specified: ${XE}")
    endif ("xsltproc" MATCHES "${XE}")

    # Apache FOP executable
    set(APACHE_FOP APACHE_FOP-NOTFOUND)
    # Apache FOP version from parent CMake build system
    set(APACHE_FOP_VERSION )

    # fop hyphenation path (fop version >= 1.0)
    # need v2 hyphenation
    if(APACHE_FOP_VERSION VERSION_LESS 1.0)
      #set(FOP_HYPH "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/offo-old/binary/fop-hyph.jar")
    else(APACHE_FOP_VERSION VERSION_LESS 1.0)
      set(FOP_HYPH "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/resources/other/offo/binary/fop-hyph.jar")
    endif(APACHE_FOP_VERSION VERSION_LESS 1.0)

    # FOP uses environment variables - set them.
    set(ENV{FOP_HYPHENATION_PATH} "${FOP_HYPH}")

    set(ENV{CLASSPATH} "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook")

    # Keep FOP headless on OSX and specify the log4j config
    set(ENV{FOP_OPTS} "-Djava.awt.headless=true  -Dlog4j.configuration=\"/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/doc/docbook/log4j.properties\"")

    # Make sure the target directory exists
    get_filename_component(output_dir "${PDF_OUTFILE}" PATH)
    execute_process(COMMAND "/usr/bin/cmake" -E make_directory "${output_dir}")

    # If we're trying to do this but APACHE_FOP was unset somehow, fatal error
    if ("${APACHE_FOP}" STREQUAL "")
      message(FATAL_ERROR "Apache FOP processing requested, but APACHE_FOP is not set.")
    endif ("${APACHE_FOP}" STREQUAL "")

    # Run FOP to actually generate the PDF
    execute_process(COMMAND "APACHE_FOP-NOTFOUND" -c "/home/sgeorgiou/GitHub/phoronixDataSet/tasks/brlcad/build/doc/docbook/fop.xconf" "${fo_outfile}" -pdf "${PDF_OUTFILE}" RESULT_VARIABLE CMDRESULT)

    # Fatal error if FOP didn't succeed, so the parent CMake build knows something went wrong and can halt.
    if(CMDRESULT)
      message(FATAL_ERROR "Apache FOP build failure: ${CMDRESULT}")
    endif(CMDRESULT)

  endif(NOT "${fmt}" STREQUAL "PDF")

endforeach(fmt ${CURRENT_OUTPUT_FORMATS})


# Local Variables:
# tab-width: 8
# mode: cmake
# indent-tabs-mode: t
# End:
# ex: shiftwidth=2 tabstop=8

