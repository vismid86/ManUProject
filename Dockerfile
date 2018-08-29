FROM ubuntu:16.04
MAINTAINER vismid

# Install
RUN apt-get update
RUN mkdir -p /CI-test
WORKDIR /CI-test

#COPY . /src/build

