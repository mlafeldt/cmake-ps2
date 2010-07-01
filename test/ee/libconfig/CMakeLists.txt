PROJECT("libconfig" C)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE_DIRECTORIES(include)

SET(EE_LIB config)

ADD_LIBRARY(${EE_LIB} STATIC src/grammar.c src/libconfig.c src/scanctx.c src/scanner.c src/strbuf.c)

ADD_CUSTOM_COMMAND(TARGET ${EE_LIB} POST_BUILD COMMAND md5sum ARGS lib${EE_LIB}.a)
