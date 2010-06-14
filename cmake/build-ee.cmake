#
# Macros to build EE binaries
#
# Copyright (C) 2009-2010 Mathias Lafeldt <misfire@debugon.org>
#
# Externally defined variables:
#
#  EE_CFLAGS   - C compiler flags
#  EE_CXXFLAGS - C++ compiler flags
#  EE_LDFLAGS  - Linker flags
#  EE_ASFLAGS  - Assembler flags
#
#  EE_SRCS     - Source code files
#  EE_LIBS     - Libraries to be linked to EE_BIN
#
#  EE_BIN      - Name of EE ELF to build
#  EE_LIB      - Name of EE library to build
#  EE_ERL      - Name of EE ERL to build
#

LINK_DIRECTORIES("${PS2SDK}/ee/lib/")

INCLUDE_DIRECTORIES("${PS2SDK}/ee/include/" "${PS2SDK}/common/include/")

MACRO(_INIT_EE_FLAGS)
  SET(_EE_CFLAGS "-D_EE -O2 -G0 -Wall ${EE_CFLAGS}")
  SET(_EE_CXXFLAGS "-D_EE -O2 -G0 -Wall ${EE_CXXFLAGS}")
  SET(_EE_LDFLAGS "${EE_LDFLAGS}")
  SET(_EE_ASFLAGS "-G0 ${EE_ASFLAGS}")
  SET(CMAKE_C_FLAGS "${_EE_CFLAGS}")
  SET(CMAKE_CXX_FLAGS "${_EE_CXXFLAGS}")
ENDMACRO(_INIT_EE_FLAGS)

MACRO(EE_BUILD_BIN)
  _INIT_EE_FLAGS()
  SET(_EE_CRT0 "${PS2SDK}/ee/startup/crt0.o")
  SET(_EE_LINKFILE "${PS2SDK}/ee/startup/linkfile")
  SET(_EE_LIBS ${EE_LIBS} c kernel)
  ADD_EXECUTABLE(${EE_BIN} ${EE_SRCS} ${_EE_CRT0})
  SET(CMAKE_EXE_LINKER_FLAGS "-mno-crt0 -T${_EE_LINKFILE} ${_EE_LDFLAGS}")
  TARGET_LINK_LIBRARIES(${EE_BIN} ${_EE_LIBS})
ENDMACRO(EE_BUILD_BIN)

MACRO(EE_BUILD_LIB)
  _INIT_EE_FLAGS()
  ADD_LIBRARY(${EE_LIB} ${EE_SRCS})
ENDMACRO(EE_BUILD_LIB)

MACRO(EE_BUILD_ERL)
  _INIT_EE_FLAGS()
  ADD_EXECUTABLE(${EE_ERL} ${EE_SRCS})
  SET(CMAKE_EXE_LINKER_FLAGS "-mno-crt0 -Wl,-r ${_EE_LDFLAGS}")
  ADD_CUSTOM_COMMAND(TARGET ${EE_ERL} POST_BUILD COMMAND ee-strip
    ARGS --strip-unneeded -R .mdebug.eabi64 -R .reginfo -R .comment ${EE_ERL})
ENDMACRO(EE_BUILD_ERL)
