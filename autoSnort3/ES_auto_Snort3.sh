#!/bin/bash

user=$(whoami)

#Colores

RED="\033[0;31m"
GREEN="\033[0;32m"
NC='\033[0m'

indicador=$(echo -e "${GREEN}[*]${NC}")

echo
echo -e "$indicador Buscando y eliminando versiones anteriores de snort"

sudo apt purge snort
sudo rm -rf /etc/snort

echo
echo -e "$indicador Se van a instalar las dependencias"
echo -e "		Las dependencias son: "
echo -e "			build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev"

sudo apt install build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev -y

echo
echo -e "$indicador Instalando libdaq"
mkdir ~/apps
cd ~/apps
git clone https://github.com/snort3/libdaq.git
cd libdaq
./bootstrap
./configure
make
sudo make install

echo
echo -e "$indicador Instalando gperftools"
cd ~/apps
git clone https://github.com/gperftools/gperftools.git
cd gperftools
./autogen.sh
./configure
make
sudo make install

echo
echo -e "$indicador Instalando snort3"
cd ~/apps
git clone https://github.com/snort3/snort3.git
cd snort3
./configure_cmake.sh --prefix=$my_path
cd build
sudo make -j $(nproc) install
sudo ln -s /usr/local/lib/libdaq.so.3 /lib/

echo
echo -e "$indicador Comprobando versión"
snort --version
