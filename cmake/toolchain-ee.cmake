#
# CMake toolchain file for PS2 EE processor
#
# Copyright (C) 2009-2010 Mathias Lafeldt <misfire@debugon.org>
#

INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)
SET(CMAKE_SYSTEM_PROCESSOR ee)

CMAKE_FORCE_C_COMPILER(ee-gcc GNU)
CMAKE_FORCE_CXX_COMPILER(ee-g++ GNU)

SET(PS2DEV "$ENV{PS2DEV}")
IF (NOT PS2DEV)
    MESSAGE(FATAL_ERROR "PS2DEV env var not set.")
ENDIF (NOT PS2DEV)

SET(CMAKE_FIND_ROOT_PATH "${PS2DEV}/ee")
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(PS2SDK "$ENV{PS2SDK}")
IF (NOT PS2SDK)
    MESSAGE(FATAL_ERROR "PS2SDK env var not set.")
ENDIF (NOT PS2SDK)

INCLUDE_DIRECTORIES("${PS2SDK}/ee/include")
INCLUDE_DIRECTORIES("${PS2SDK}/common/include")

LINK_DIRECTORIES("${PS2SDK}/ee/lib")

SET(EE_CRT0 "${PS2SDK}/ee/startup/crt0.o")
SET_SOURCE_FILES_PROPERTIES(${EE_CRT0} PROPERTIES EXTERNAL_OBJECT TRUE)
SET(EE_LINKFILE "${PS2SDK}/ee/startup/linkfile")

SET(PS2 1)
SET(EE 1)
