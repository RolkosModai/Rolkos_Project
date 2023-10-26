#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
#fi
#if [ "$(systemd-detect-virt)" == "openvz" ]; then
		#echo "OpenVZ is not supported"
		#exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear
echo ""
echo -e "Detecting Operating System is `lsb_release -i | awk '{print $3}'` ..."
sleep 3
#Instal Pesan Box
apt-get install ruby -y
apt install boxes
apt install lolcat -y
# ==========================================
# Link Hosting SSH 
rolkosvpn="raw.githubusercontent.com/RolkosModai/Rolkos_Project/master/file"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/lakmalstorevpn;
echo "IP=" >> /var/lib/lakmalstorevpn/ipvps.conf
echo -e "${GREEN}INSTALLING DOMAIN${NC}"
sleep 3
wget https://${rolkosvpn}/cf.sh && chmod +x cf.sh && ./cf.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup v2ray
echo -e "${GREEN}INSTALLING XRAY${NC}"
sleep 3
wget https://${rolkosvpn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup ssh ovpn
echo -e "${GREEN}INSTALLING SSH-VPN${NC}"
sleep 3
wget https://${rolkosvpn}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://${rolkosvpn}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup ssr
echo -e "${GREEN}INSTALLING SSR${NC}"
sleep 3
wget https://${rolkosvpn}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://${rolkosvpn}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup wg
echo -e "${GREEN}INSTALLING WG${NC}"
sleep 3
wget https://${rolkosvpn}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup L2TP
echo -e "${GREEN}INSTALLING L2TP${NC}"
sleep 3
wget https://${rolkosvpn}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://${rolkosvpn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup Websocket
echo -e "${GREEN}INSTALLING WEBSOCKET${NC}"
sleep 3
wget https://${rolkosvpn}/sshjs.sh && chmod +x sshjs.sh && ./sshjs.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
# // Setup OHP
echo -e "${GREEN}INSTALLING OHP${NC}"
sleep 3
wget https://${rolkosvpn}/ohp.sh && chmod +x ohp.sh && screen -S ohp ./ohp.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
systemctl start nginx > /dev/null 2>&1


# // Remove Not Used Files
rm -f /root/install.sh > /dev/null 2>&1
rm -f /root/setup.sh > /dev/null 2>&1
rm -r /root/menu > /dev/null 2>&1
rm -r /root/menu.zip > /dev/null 2>&1
rm -r -f *.sh > /dev/null 2>&1
rm cat /dev/null > ~/.bash_history && history -c /dev/null 2>&1

echo " "
echo "Installation has been completed!!" 
echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 80"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP_SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP_Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP_OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Europe/Vilnius (GMT +3)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +3" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 5 Sec"
sleep 5
rm -f setup.sh
reboot
