#!/bin/bash

user=$(whoami)

#Colors

RED="\033[0;31m"
GREEN="\033[0;32m"
NC='\033[0m'

indicator=$(echo -e "${GREEN}[*]${NC}")


echo -e "$indicator Changing the actual directory to the installation directory"
echo -e "		Installation directory: /usr/bin"

cd /usr/bin/

echo -e "$indicator Dependencies will be installed"
echo -e "		The dependencies are: "
echo -e "			python3-pyfiglet python3-pyshodan python3-pandas python3-pyexploitdb python3-quamash"

sudo apt install python3-pyfiglet python3-pyshodan python3-pandas python3-pyexploitdb python3-quamash -y 

echo
echo -e "$indicator The Legion repository is going to be cloned"
echo -e "		Final directory: /usr/bin/legion"

sudo git clone https://github.com/GoVanguard/legion.git

echo -e "$indicator Changing Legion directory propietary"
sudo chown $user:$user legion/ -v
sudo chown $user:$user legion/* -v

echo -e "$indicator Changing the actual directory to legion/"
cd legion

#Script adicional
echo -e "$indicator Creating an additional script"

echo "#!/bin/bash" > legion.sh
echo "cd /usr/bin/legion" >> legion.sh
echo "sudo python3 legion.py" >> legion.sh
#--------------
echo
echo -e "$indicator Changing Legion permissions"
sudo chmod +x *
ls -la /usr/bin/legion

echo
echo -e "$indicator You can add a legion alias copying the following command to your .zshrc or .bashrc"
echo -e "               alias legion='sudo bash /usr/bin/legion/legion.sh &>/dev/null &'"

echo
echo -e "$indicator Executing Legion"

sudo bash startLegion.sh

echo
echo -e "$indicator You can add a legion alias copying the following command to your .zshrc or .bashrc"
echo -e "               alias legion='sudo bash /usr/bin/legion/legion.sh &>/dev/null &'"
