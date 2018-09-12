FROM ubuntu:16.04
MAINTAINER vismid

# Install
RUN apt-get update && apt-get -y install sudo coreutils openssh-client
RUN mkdir -p /CI-test-xenial
RUN mkdir -p /keyfile
WORKDIR /CI-test-xenial
