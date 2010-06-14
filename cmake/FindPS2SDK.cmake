#
# CMake module to find PS2SDK
#
# Copyright (C) 2009-2010 Mathias Lafeldt <misfire@debugon.org>
#

SET(PS2SDK $ENV{PS2SDK})

IF (NOT PS2SDK)
    SET(PS2SDK /usr/local/ps2dev/ps2sdk)
ENDIF (NOT PS2SDK)

IF (NOT EXISTS ${PS2SDK})
    MESSAGE(FATAL_ERROR "PS2SDK not found.")
ENDIF (NOT EXISTS ${PS2SDK})

MESSAGE(STATUS "PS2SDK: ${PS2SDK}")
