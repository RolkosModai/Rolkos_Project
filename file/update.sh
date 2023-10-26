#!/bin/bash
# Auther  : Rolka
# =========================================

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8' >/dev/null 2>&1
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
grenbo="\e[92;1m"
NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
clear
date
echo ""
echo -e "${GREEN}To Perform This Action, You Must Report To The Admin First.$NC"
echo -e "${GREEN}To Be Granted Update Access To Your VPS Script!$NC"
read -p "Already Reported? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo -e "${CYAN}Action Continued! $NC"
  echo -e "${GREEN}START. . . $NC"
elif [[ $arg == 'y' ]]; then
  echo -e "${CYAN}Action Continued! $NC"
  clear
  echo -e "${CYAN}START . . .$NC"
elif [[ $arg == 'N' ]]; then
  echo -e "${RED}Action Stopped! $NC"
  sleep 1
  clear
  neofetch
  exit 0
elif [[ $arg == 'n' ]]; then
  echo -e "${RED}Action Stopped! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
else
  echo -e "${RED}Unknown Argument! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
fi
##########

clear
wget -O ~/menu.zip "https://raw.githubusercontent.com/RolkosModai/Rolkos_Project/master/menu/menu.zip" >/dev/null 2>&1
mkdir /root/menu
7z e  ~/menu.zip -o/root/menu/ >/dev/null 2>&1
chmod +x /root/menu/*
mv /root/menu/* /usr/bin/
  
sleep 2
clear
echo -e "[ ${GREEN}INFO${NC} ] Download File Script "
sleep 2
rm -f update.sh
rm -f menu.zip
rm -rf /root/menu
clear
menu
