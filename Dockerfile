FROM ubuntu:16.04
MAINTAINER vismid

# Install
RUN apt-get update && apt-get -y install sudo coreutils
RUN mkdir -p /CI-test
WORKDIR /CI-test
