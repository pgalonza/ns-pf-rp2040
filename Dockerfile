FROM alpine:3.20

RUN apk update && \
apk upgrade && \
apk add git \
patch \
python3 \
build-base \
libusb-dev \
bsd-compat-headers \
newlib-arm-none-eabi \
make \
pkg-config \
cmake \
build-essential \
libnewlib-arm-none-eabi \
gcc-arm-none-eabi \
libstdc++-arm-none-eabi-newlib \
rm -rf /var/cache/apk/*

WORKDIR /app/

ARG SDK_PATH=/app/pico-sdk
RUN git clone --depth 1 --branch 1.5.1 https://github.com/raspberrypi/pico-sdk $SDK_PATH && \
cd $SDK_PATH && \
git submodule update --init


ENV PICO_SDK_PATH=$SDK_PATH
ENV FIRMWARE_PATH=/app/firmware
ENV BOOTLOADER_PATH=/app/bootloader
