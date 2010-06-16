#!/bin/bash

dir=${1:?"source directory missing"}

cd build || exit 1
rm -rf *
cmake -DCMAKE_VERBOSE_MAKEFILE=TRUE -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-ee.cmake "../${dir}" || exit 1
make
