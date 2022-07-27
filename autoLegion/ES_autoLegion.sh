#!/bin/bash

user=$(whoami)

#Colores

RED="\033[0;31m"
GREEN="\033[0;32m"
NC='\033[0m'

indicador=$(echo -e "${GREEN}[*]${NC}")


echo -e "$indicador Cambiando al directorio actual al directorio de instalción"
echo -e "		Directorio de instalación: /usr/bin"

cd /usr/bin/

echo -e "$indicador Se van a instalar las dependencias"
echo -e "		Las dependencias son: "
echo -e "			python3-pyfiglet python3-pyshodan python3-pandas python3-pyexploitdb python3-quamash"

sudo apt install python3-pyfiglet python3-pyshodan python3-pandas python3-pyexploitdb python3-quamash -y 2>&1 | grep Progress: 

echo
echo -e "$indicador Se va a clonar el repositorio de Legion"
echo -e "		Ruta final del directorio: /usr/bin/legion"

sudo git clone https://github.com/GoVanguard/legion.git

echo -e "$indicador Cambiando propietario del directorio legion"
sudo chown $user:$user legion/ -v
sudo chown $user:$user legion/* -v

echo -e "$indicador Cambiando el directorio actual a legion"
cd legion

#Script adicional
echo -e "$indicador Creando un script adicional"

echo "#!/bin/bash" > legion.sh
echo "cd /usr/bin/legion" >> legion.sh
echo "sudo python3 legion.py" >> legion.sh
#--------------
echo
echo -e "$indicador Cambiando permisos de Legion"
sudo chmod +x *
ls -la /usr/bin/legion

echo
echo -e "$indicador Puedes añadir el alias de legion pegando el siguiente comando en .zshrc o .bashrc"
echo -e "               alias legion='sudo bash /usr/bin/legion/legion.sh &>/dev/null &'"

echo
echo -e "$indicador Ejecutando legion"

sudo bash startLegion.sh

echo
echo -e "$indicador Puedes añadir el alias de legion pegando el siguiente comando en .zshrc o .bashrc"
echo -e "               alias legion='sudo bash /usr/bin/legion/legion.sh &>/dev/null &'"
