#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install neofetch -y
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/JerrySBG/SBG/main/bot/sbg.zip
unzip sbg.zip
pip3 install -r kyt/requirements.txt
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG/main/bot/bot2.zip
unzip bot2.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
rm -rf sbg.zip


clear
echo ""
figlet 'MODs By JERRY-SBG' | lolcat
echo -e "\e[32;1m ╭════════════════════════════════════════════════╮\e[0m"
echo -e "\e[1;97;101m                       ADD BOT PANEL                 ${NC} ${u}│${NC}"
echo -e "\e[32;1m ╰════════════════════════════════════════════════╯\e[0m"
echo -e "\e[32;1m ╭════════════════════════════════════════════════╮\e[0m"
echo -e "\e[1;97;101m      Tutorial Crear Bot and ID Telegram                   ${NC}"
echo -e "\e[1;97;101m    Crear Bot y Token Bot usa : @BotFather                 ${NC}"
echo -e "\e[1;97;101m   Info Id Telegram : @MissRose_bot teclea /info      ${NC}"
echo -e "\e[32;1m ╰════════════════════════════════════════════════╯\e[0m"
echo -e ""
read -e -p "  [*] Ingresa Tu Token de Bot : " bottoken
read -e -p "  [*] Ingresa tu Id de Telegram : " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

if [ -e /etc/systemd/system/kyt.service ]; then
echo ""
else
rm -fr /etc/systemd/system/kyt.service
fi

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple Bot Tele By - @ByJERRY
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start kyt
systemctl enable kyt
systemctl restart kyt
cd 

# // STATUS SERVICE BOT
bot_service2=$(systemctl status kyt | grep active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $bot_service2 == "running" ]]; then 
   sts_bot="${g}[ON]${NC}"
else
   sts_bot="${r}[OFF]${NC}"
fi

rm -rf kyt2.sh
clear
neofetch
echo -e "  ${y} Tu Informacion del BOT"
echo -e "\e[32;1m ╭══════════════════════════════════════════╮\e[0m"
echo -e "  \e[1;97;101m Status BOT ${y}=$NC $sts_bot "
echo -e "      \e[1;97;101m Token BOT  ${y}=$NC $bottoken "
echo -e "      \e[1;97;101m Admin ID   ${y}=$NC $admin "
echo -e "      \e[1;97;101m Domain     ${y}=$NC $domain "
echo -e "\e[32;1m ╰══════════════════════════════════════════╯\e[0m"
echo -e ""
history -c
read -p "  Presione [ Enter ] para regresar al menú"
menu
python3 -m http.server 8888 &