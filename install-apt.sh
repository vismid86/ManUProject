while ! sudo apt-get update; do sleep 15; done;
while ! sudo apt-get -y install bc make gcc gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf gnuplot jshon ccache curl zip liblapacke-dev libnlopt-dev libssl-dev libfftw3-dev python2.7-dev python-pip python-matplotlib python-numpy python-scipy parallel bsdmainutils; do sleep 15; done;

# install ImageMagick
while ! sudo apt-get -y install libpng-dev libfreetype6-dev libjpeg-dev libfontconfig1-dev libwmf-dev libpango1.0-dev librsvg2-dev; do sleep 15; done;
curl -O http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-10.tar.xz
tar -xf ImageMagick-7.0.6-10.tar.xz
cd ImageMagick-7.0.6-10
./configure
make
sudo make install
sudo ldconfig /usr/local/lib/
cd ..
#gdkjgfkj

# install python libraries
sudo -H pip install --upgrade pip pyserial awscli virtualenv
cd devops; sudo -H pip install -r requirements.txt; cd ..

# install nodejs v8.x and npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
while ! sudo apt-get install -y nodejs; do sleep 15; done;
sudo npm install -g npm

# download arm compiler and add to path for this session
curl -OL https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
sudo mkdir -p /opt/gcc-arm
sudo tar -xjvf gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -C /opt/gcc-arm --strip-components=1
echo "The ARM compiler at /opt/gcc-arm/bin needs to be added to the PATH to be used."
