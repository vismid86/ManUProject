FROM ubuntu:16.04
MAINTAINER vismid

# Install
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get -y install sudo coreutils openssh-client git vim-common wget curl apt-transport-https ca-certificates gnupg2 software-properties-common 
RUN mkdir -p /CI-test-xenial
RUN mkdir -p /keyfile
WORKDIR /CI-test-xenial
