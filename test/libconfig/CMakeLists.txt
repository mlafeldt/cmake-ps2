PROJECT("libconfig" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE_DIRECTORIES(include)

SET(EE_LIB config)
SET(EE_SRCS src/grammar.c src/libconfig.c src/scanctx.c src/scanner.c src/strbuf.c)

SET(CMAKE_C_FLAGS "")

ADD_LIBRARY(${EE_LIB} STATIC ${EE_SRCS})

ADD_CUSTOM_COMMAND(TARGET ${EE_LIB} POST_BUILD COMMAND md5sum ARGS libconfig.a)
