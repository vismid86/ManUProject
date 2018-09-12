FROM ubuntu:18.04
MAINTAINER vismid

# Install
RUN apt-get update && apt-get -y install sudo coreutils openssh-client
# Set Timezone for tzdata installation
ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Australia/Adelaide'
RUN echo $TZ > /etc/timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN mkdir -p /CI-test-bionic
RUN mkdir -p /keyfile
WORKDIR /CI-test-bionic
