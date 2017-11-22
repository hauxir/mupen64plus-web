#!/bin/bash
set -e

# pushd ../../../mupen64plus-video-rice/projects/unix/
# ./build_emscripten.sh clean
# ./build_emscripten.sh all
# cp mupen64plus-video-rice.js ../../../mupen64plus-ui-console/projects/unix/plugins/
# popd

# pushd ../../../mupen64plus-rsp-hle/projects/unix/
# ./build_emscripten.sh clean
# ./build_emscripten.sh all
# cp mupen64plus-rsp-hle.js ../../../mupen64plus-ui-console/projects/unix/plugins/
# popd

# pushd ../../../mupen64plus-core/projects/unix/
# ./build_emscripten.sh clean
# ./build_emscripten.sh all
# cp libmupen64plus.so.2.js ../../../mupen64plus-ui-console/projects/unix/plugins/
# popd

# pushd ../../../mupen64plus-video-glide64mk2/projects/unix/
# ./build_emscripten.sh clean
# ./build_emscripten.sh all
# cp mupen64plus-video-glide64mk2.js ../../../mupen64plus-ui-console/projects/unix/plugins/
# popd

# rm mupen64plus.*

# emmake make clean

#export EMCC_FORCE_STDLIBS=1

EMCC_FORCE_STDLIBS=1 emmake make \
  UNAME=Linux \
  EMSCRIPTEN=1 \
  EXEEXT=".html" \
  USE_GLES=1 NO_ASM=1 \
  ZLIB_CFLAGS="-s USE_ZLIB=1" \
  PKG_CONFIG="" \
  LIBPNG_CFLAGS="-s USE_LIBPNG=1" \
  SDL_CFLAGS="-s USE_SDL=2" \
  FREETYPE2_CFLAGS="-s USE_FREETYPE=1" \
  GL_CFLAGS="" \
  GLU_CFLAGS="" \
  V=1 \
  OPTFLAGS="-O0 -g2 -s MAIN_MODULE=1 --preload-file plugins --preload-file data  --preload-file roms --preload-file Glide64mk2.ini -s TOTAL_MEMORY=500000000 --emrun -s ASSERTIONS=2 -s USE_ZLIB=1 -s USE_SDL=2 -s USE_LIBPNG=1 -DEMSCRIPTEN=1" \
  $1
