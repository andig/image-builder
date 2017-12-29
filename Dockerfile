#FROM resin/rpi-raspbian:stretch
FROM debian:stretch

RUN apt-get -q update
RUN apt install -y wget unzip zip
RUN apt install -y nano

COPY src/* /
RUN chmod +x /build.sh

RUN mkdir /build
VOLUME /build
WORKDIR /build

CMD /build.sh
#https://downloads.raspberrypi.org/raspbian_lite_latest
