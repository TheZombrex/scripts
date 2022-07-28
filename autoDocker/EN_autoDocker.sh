#!/bin/bash

#Colors

RED="\033[0;31m"
GREEN="\033[0;32m"
NC='\033[0m'

indicator=$(echo -e "${GREEN}[*]${NC}")

set -e

echo
echo -e "$indicator Dependencies will be installed"
echo -e "		The dependencies are: "
echo -e "			curl apt-transport-https software-properties-common ca-certificates"

sudo apt install -y curl apt-transport-https software-properties-common ca-certificates

echo
echo -e "$indicator Installing Docker"

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | \

  sudo tee /etc/apt/sources.list.d/docker-engine.list

sudo apt-get update -y
sudo apt-get install -y docker-ce

echo
echo -e "$indicator Running Docker"

sudo systemctl start docker

sudo systemctl enable docker

echo
echo -e "$indicator Adding user to docker group for using docker without sudo command"
sudo gpasswd -a "${USER}" docker

sudo mkdir /sys/fs/cgroup/systemd

sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd
