#!/bin/bash

user=$(whoami)

#Colors

RED="\033[0;31m"
GREEN="\033[0;32m"
NC='\033[0m'

indicator=$(echo -e "${GREEN}[*]${NC}")

echo
echo -e "$indicator Removing libhwloc15 and libpcap0.8-dev"

sudo apt remove -y libhwloc15
sudo apt remove -y libpcap0.8

echo
echo -e "$indicator Installing libpcap-dev and libhwloc-dev"

sudo apt install -y libpcap-dev libhwloc-dev


echo
echo -e "$indicator Installing libpcap0.8-dev with libhwloc15"

sudo apt remove -y nmap-common


#sudo apt install -y aircrack-ng airgeddon bully fern-wifi-cracker hashcat hwloc libhwloc-plugins libhwloc15 libpocl2 mdk3 mdk4 pocl-opencl-icd reaver wifi-honey wifite

echo
echo -e "$indicator Reinstalling programs that have been removed due to libhwloc15 and libpcap0.8-dev removal"

sudo apt install -y 0trace aircrack-ng airgeddon arp-scan arping arpwatch asleap
  bettercap bettercap-caplets bettercap-ui bully changeme
  cowpatty crackle darkstat driftnet dsniff eapmd5pass etherape
  ettercap-common ettercap-graphical fern-wifi-cracker gsad gvm
  gvm-tools gvmd hexinject hping3 iftop impacket-scripts irpas
  john johnny libfindrtp libnids1.21 libpcap0.8 mdk3 mdk4
  netdiscover netsniff-ng network-manager-fortisslvpn
  network-manager-fortisslvpn-gnome network-manager-l2tp
  network-manager-l2tp-gnome network-manager-pptp
  network-manager-pptp-gnome ngrep nmap nmapsi4 ohrwurm
  openfortivpn openvas-scanner ospd-openvas p0f ppp pptp-linux
  ptunnel python3-gvm python3-libnmap python3-pcapy reaver
  rtpbreak rtpinsertsound rtpmixsound sipcrack sipp sniffjoke
  ssldump sslsplit tcpdump tcpflow tcpreplay thc-ipv6 thc-ssl-dos
  tshark wifi-honey wifite wireshark wireshark-common aircrack-ng
 airgeddon bully fern-wifi-cracker hashcat hwloc libhwloc-plugins libhwloc15 libpocl2 mdk3 mdk4 pocl-openc-opencl-icd reaver wifi-honey wifite

