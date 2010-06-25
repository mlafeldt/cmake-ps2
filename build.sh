#!/bin/bash

arch=${1:?"arch missing"}
dir=${2:?"source directory missing"}

cd build || exit 1
rm -rf *
cmake -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-${arch}.cmake \
    "../${dir}" || exit 1
make
