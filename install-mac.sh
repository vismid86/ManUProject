#!/bin/bash

# Copyright 2016-2018
# Myriota Pty Ltd
# Myriota Confidential

# check if installation of homebrew necessary
if [ -z $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install ARM compiler
brew tap caskroom/cask
brew cask install gcc-arm-embedded

# various other dependencies
brew install git clang-format doxygen libjpeg fftw nlopt iproute2mac ccache pkg-config openssl pbc jshon
brew install gnuplot --with-cairo
brew tap jlhonora/lsusb && brew install lsusb

# valgrind was problematic on macOS newer than Sierra
# -> use --HEAD option, see https://www.gungorbudak.com/blog/2018/04/28/how-to-install-valgrind-on-macos-high-sierra
brew install --HEAD valgrind

# install dependencies for satellite tools
brew install ffmpeg
brew install lapack

# install tools for micro-gateway
brew install parallel librtlsdr

# install GNU utilities and create symbolic links for relevant tools
brew install coreutils
ln -s /usr/local/opt/coreutils/libexec/gnubin/shuf /usr/local/bin/shuf
ln -s /usr/local/opt/coreutils/libexec/gnubin/tr /usr/local/bin/tr
ln -s /usr/local/opt/coreutils/libexec/gnubin/date /usr/local/bin/date

# install Python packages, including AWS dependencies
brew install python
pip install --upgrade pip pyserial awscli virtualenv

# require gcc major version 7 (brew install gcc is version 8)
brew install gcc@7
# gcc defaults to clang on macOS -> create symbolic links for the real thing
ln -sf /usr/local/bin/gcc-7 /usr/local/bin/cc
ln -sf /usr/local/bin/g++-7 /usr/local/bin/c++
ln -sf /usr/local/bin/gcc-7 /usr/local/bin/gcc
ln -sf /usr/local/bin/g++-7 /usr/local/bin/g++

# now build ImageMagick from source (will be build with gcc 7 from above)
#ImageMagickVer=7.0.6-10
#curl -O http://www.imagemagick.org/download/releases/ImageMagick-${ImageMagickVer}.tar.xz
#tar xf ImageMagick-${ImageMagickVer}.tar.xz
#cd ImageMagick-${ImageMagickVer}
#./configure
#make
#sudo make install

