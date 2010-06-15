#
# CMake toolchain file for PS2 IOP processor
#
# Copyright (C) 2009-2010 Mathias Lafeldt <misfire@debugon.org>
#

INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR iop)

CMAKE_FORCE_C_COMPILER(iop-gcc GNU)
CMAKE_FORCE_CXX_COMPILER(iop-g++ GNU)

SET(PS2DEV $ENV{PS2DEV})
IF (NOT PS2DEV)
    SET(PS2DEV /usr/local/ps2dev)
ENDIF (NOT PS2DEV)

IF (NOT EXISTS ${PS2DEV}/iop)
    MESSAGE(FATAL_ERROR "IOP dev tools not found.")
ENDIF (NOT EXISTS ${PS2DEV}/iop)

SET(CMAKE_FIND_ROOT_PATH ${PS2DEV}/iop)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
