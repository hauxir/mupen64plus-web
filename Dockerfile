FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install wget python git automake autogen libtool shtool build-essential cmake libglib2.0-dev closure-compiler pkg-config libfreetype6-dev
RUN cd /root && wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz && tar xzvf emsdk-portable.tar.gz && cd emsdk-portable && ./emsdk update && ./emsdk install latest && ./emsdk activate latest
ENV C_INCLUDE_PATH="${C_INCLUDE_PATH}"

WORKDIR /app
CMD bash -c "source /root/emsdk-portable/emsdk_env.sh && make config=releasei"
