#!/bin/sh
cd "$(dirname "$0")"
. ./_ins_utilities.sh

ins_deb_require python-dev python-setuptools &&
  ins_git_get https://github.com/maumueller/annoy

 gcc -O3 -march=native -ffast-math -c -o frontend.o ../../protocol/c/frontend.c
 g++ -O3 -march=native -ffast-math -std=c++14 -o fr-annoy-hamming frontend.o ../lib-annoy-hamming.cpp -pthread
