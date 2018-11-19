# Change a line and testy
while ! sudo apt-get update; do sleep 15; done;
while ! sudo apt-get install -y make; do sleep 10; done; 
#while ! sudo apt-get -y install bc make gcc gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf gnuplot jshon ccache curl zip liblapacke-dev libnlopt-dev libssl-dev libfftw3-dev python2.7-dev python-pip python-matplotlib python-numpy python-scipy parallel bsdmainutils libgmp-dev flex bison; do sleep 15; done;
#
## install ImageMagick
#while ! sudo apt-get -y install libpng-dev libfreetype6-dev libjpeg-dev libfontconfig1-dev libwmf-dev libpango1.0-dev librsvg2-dev; do sleep 15; done;
#curl -O http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-10.tar.xz
#tar -xf ImageMagick-7.0.6-10.tar.xz
#cd ImageMagick-7.0.6-10
#./configure
#make
#sudo make install
#sudo ldconfig /usr/local/lib/
#cd ..
#
## install python libraries
#sudo -H pip install --upgrade pip pyserial awscli virtualenv
#cd devops; sudo -H pip install -r requirements.txt; cd ..
#
## install nodejs v8.x and npm
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#while ! sudo apt-get install -y nodejs; do sleep 15; done;
#sudo npm install -g npm
#
## install cross compiler for the GOMspace gateway
#make gateway/gomspace_nanomind_Z7000/install
#
## download arm compiler and add to path for this session
#curl -O https://static.myriota.com/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
#sudo mkdir /opt/gcc-arm
#sudo tar -xjvf gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -C /opt/gcc-arm --strip-components=1
#echo "The ARM compiler at /opt/gcc-arm/bin needs to be added to the PATH to be used."
#
## install Pairing-Based Cryptography Library (PBC), used for BLS signing
#wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
#tar xvzf pbc-0.5.14.tar.gz
#cd pbc-0.5.14
#./configure
#make
#sudo make install
#sudo ldconfig
#cd ..

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

