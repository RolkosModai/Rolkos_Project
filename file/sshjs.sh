#!/bin/bash
clear

echo "=============== INSTALL WS ==============="

mkdir /etc/rolka
wget -O /etc/rolka/sh.js https://raw.githubusercontent.com/RolkosModai/Rolkos_Project/master/file/proxy3.js
chmod +x /etc/rolka/sh.js
clear

apt -y install nodejs
rm -rf /etc/systemd/system/nodews.service
cat > /etc/systemd/system/nodews.service <<-END
[Unit]
Description=fas-wsssl
After=network.target nss-lookup.target
[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/node --expose-gc /etc/rolka/sh.js -dhost 127.0.0.1 -dport 109 -mport 80
Restart=on-failure
RestartPreventExitStatus=1
[Install]
WantedBy=multi-user.target
END
clear

echo "=============== RUN EVERYTHING ==============="
cd $home
systemctl enable nodews
systemctl start nodews
x
rm -rf key.pem cert.pem sshjs.sh
clear
