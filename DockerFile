FROM ubuntu:16.04
MAINTAINER vismid

# Install
RUN apt-get update
RUN mkdir -p /src/
RUN mkdir -p /src/build/
WORKDIR /src/build/

COPY . /src/build

