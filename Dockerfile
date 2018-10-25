FROM ubuntu:16.04

RUN apt-get update && apt-get -y install sudo coreutils usbutils
WORKDIR /home/root
