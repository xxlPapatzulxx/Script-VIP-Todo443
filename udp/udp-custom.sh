#!/bin/bash
cd
rm -rf /etc/udp
mkdir -p /etc/udp

# change to time UTC-6
echo "change to time Mexico"
ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -q -O /etc/udp/udp-custom "https://raw.githubusercontent.com/JerrySBG/SBG/main/udp/udp-custom-linux-amd64"
chmod +x /etc/udp/udp-custom
echo downloading default config
wget -q -O /etc/udp/config.json "https://raw.githubusercontent.com/JerrySBG/SBG/main/udp/config.json"
chmod 644 /etc/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/etc/udp/udp-custom server
WorkingDirectory=/etc/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/etc/udp/udp-custom server -exclude $1
WorkingDirectory=/etc/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl daemon-reload
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo restart service udp-custom
systemctl restart udp-custom &>/dev/null
iptables -t nat -A PREROUTING -i $(ip -4 route ls|grep default|grep -Po '(?<=dev )(\S+)'|head -1) -p udp --dport 40000:65535 -j DNAT --to-destination :36712
ufw allow 40000:65535/udp
ufw allow 36712/udp
clear
