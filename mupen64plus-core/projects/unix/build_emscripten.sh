#!/bin/bash

emmake make \
  UNAME=Linux \
  TARGET="libmupen64plus.so.2.js" \
  SONAME="" \
  USE_GLES=1 NO_ASM=1 \
  ZLIB_CFLAGS="-s USE_ZLIB=1" \
  PKG_CONFIG="" \
  LIBPNG_CFLAGS="-s USE_LIBPNG=1" \
  SDL_CFLAGS="-s USE_SDL=2" \
  FREETYPE2_CFLAGS="-s USE_FREETYPE=1" \
  GL_CFLAGS="" \
  GLU_CFLAGS="" \
  V=1 \
  OPTFLAGS="-O0 -g2 -s SIDE_MODULE=1 -s ASSERTIONS=1 -DEMSCRIPTEN=1" \
  $1
