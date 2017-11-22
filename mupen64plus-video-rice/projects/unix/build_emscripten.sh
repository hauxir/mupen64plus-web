#!/bin/bash

emmake make \
  UNAME=Linux \
  USE_FRAMESKIPPER=1 \
  EMSCRIPTEN=1 \
  SO_EXTENSION="js" \
  USE_GLES=1 NO_ASM=1 \
  ZLIB_CFLAGS="-s USE_ZLIB=1" \
  PKG_CONFIG="" \
  LIBPNG_CFLAGS="-s USE_LIBPNG=1" \
  SDL_CFLAGS="-s USE_SDL=2" \
  FREETYPE2_CFLAGS="-s USE_FREETYPE=1" \
  GL_CFLAGS="" \
  GLU_CFLAGS="" \
  V=1 \
  LOADLIBES="../../../boost_1_59_0/stage/lib/libboost_filesystem.a ../../../boost_1_59_0/stage/lib/libboost_system.a" \
  OPTFLAGS="-O0 -g2 -s FULL_ES2=1 -s SIDE_MODULE=1 -s ASSERTIONS=1 -I../../../boost_1_59_0 -DEMSCRIPTEN=1 -DNO_FILTER_THREAD=1 -DUSE_FRAMESKIPPER=1" \
  $1
