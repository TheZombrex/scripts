#!/bin/bash

#Colors

RED="\033[0;31m"
GREEN="\033[0;32m"
NC='\033[0m'

indicador=$(echo -e "${GREEN}[*]${NC}")

set -e

echo
echo -e "$indicador Se van a instalar las dependencias"
echo -e "		Las dependencias son: "
echo -e "			curl apt-transport-https software-properties-common ca-certificates"

sudo apt install -y curl apt-transport-https software-properties-common ca-certificates

echo
echo -e "$indicador Instalando Docker"

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | \

  sudo tee /etc/apt/sources.list.d/docker-engine.list

sudo apt-get update -y
sudo apt-get install -y docker-ce

echo
echo -e "$indicador Ejecutando Docker"

sudo systemctl start docker

sudo systemctl enable docker

echo
echo -e "$indicador Añadiendo el usuario al grupo docker para poder usar docker sin usar sudo"
sudo gpasswd -a "${USER}" docker

sudo mkdir /sys/fs/cgroup/systemd

sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd
