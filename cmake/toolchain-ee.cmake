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

SET(EE_CFLAGS "-D_EE -O2 -G0 -Wall" CACHE STRING "EE C compiler flags" FORCE)
SET(EE_LDFLAGS "" CACHE STRING "EE linker flags" FORCE)
SET(EE_ASFLAGS "-G0" CACHE STRING "EE assembler flags" FORCE)

SET(EE_CRT0 "${PS2SDK}/ee/startup/crt0.o" CACHE STRING "EE crt0 file" FORCE)
SET_SOURCE_FILES_PROPERTIES(${EE_CRT0} PROPERTIES EXTERNAL_OBJECT TRUE)

SET(EE_LINKFILE "${PS2SDK}/ee/startup/linkfile" CACHE STRING "EE linkfile" FORCE)

SET(CMAKE_C_COMPILE_OBJECT
    "<CMAKE_C_COMPILER> <DEFINES> ${EE_CFLAGS} <FLAGS> -o <OBJECT> -c <SOURCE>")

# build EE_BIN
SET(CMAKE_C_LINK_EXECUTABLE
    "<CMAKE_C_COMPILER> ${EE_CFLAGS} <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -mno-crt0 -T${EE_LINKFILE} ${EE_CRT0} <OBJECTS> -o <TARGET> <LINK_LIBRARIES> -lc -lkernel")

# build EE_LIB
SET(CMAKE_C_CREATE_STATIC_LIBRARY
    "<CMAKE_AR> cru <TARGET> <LINK_FLAGS> <OBJECTS>")

# build EE_ERL
SET(CMAKE_C_CREATE_SHARED_LIBRARY
    "<CMAKE_C_COMPILER> <CMAKE_SHARED_LIBRARY_C_FLAGS> <LANGUAGE_COMPILE_FLAGS> <LINK_FLAGS> <CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS> <CMAKE_SHARED_LIBRARY_SONAME_C_FLAG><TARGET_SONAME> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")

SET(PS2 1)
SET(EE 1)
