FROM alpine:3.20

RUN apk update && \
apk upgrade && \
apk add --no-cache git \
patch \
python3 \
build-base \
libusb-dev \
bsd-compat-headers \
newlib-arm-none-eabi \
make \
cmake \
pkgconfig \
gcc-arm-none-eabi \
g++-arm-none-eabi \
rm -rf /var/cache/apk/*

# Ubuntu:
# libstdc++-arm-none-eabi-newlib
# gcc++-arm-none-eabi
# libnewlib-arm-none-eabi
# build-essential
# pkg-config

WORKDIR /app/

ARG SDK_PATH=/app/pico-sdk
RUN git clone --depth 1 --branch 1.5.1 https://github.com/raspberrypi/pico-sdk $SDK_PATH && \
cd $SDK_PATH && \
git submodule update --init


ENV PICO_SDK_PATH=$SDK_PATH
# ENV FIRMWARE_PATH=/app/firmware
# ENV BOOTLOADER_PATH=/app/bootloader
