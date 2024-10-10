#!/bin/bash
function CEKIP () {
MYIP=$(curl -sS ipv4.icanhazip.com)
IPVPS=$(curl -sS https://raw.githubusercontent.com/JerrySBG/permission/main/ip | grep $MYIP | awk '{print $4}')
if [[ $MYIP == $IPVPS ]]; then
SBGINSTALL
SBGINSTALL2
fi
}
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
BIBlue='\033[1;94m'       # Blue
BGCOLOR='\e[1;97;101m'    # WHITE RED
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
secs_to_human() {
echo "TIEMPO DE INSTALACION : $(( ${1} / 3600 )) horas $(( (${1} / 60) % 60 )) minutos $(( ${1} % 60 )) segundos"
}
rm -rf /etc/rmbl
mkdir -p /etc/rmbl
mkdir -p /etc/rmbl/theme
mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
clear

function SBGINSTALL(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mActualizando Dominio.. \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mActualizando Dominio... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Con Exito !\033[1;37m"
    tput cnorm
}
res1() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/dom/dom.sh && chmod +x dom.sh && ./dom.sh
clear
}
res2() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/dom/dom2.sh && chmod +x dom2.sh && ./dom2.sh
clear
}
res3() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/dom/dom3.sh && chmod +x dom3.sh && ./dom3.sh
clear
}
res4() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/dom/dom4.sh && chmod +x dom4.sh && ./dom4.sh
clear
}
res5() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/dom/dom5.sh && chmod +x dom5.sh && ./dom5.sh
clear
}
res6() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/dom/dom6.sh && chmod +x dom6.sh && ./dom6.sh
clear
}
clear
#cd  
echo -e "${BIBlue}╭═══════════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│     \033[1;37mSeleccione Opcion para Configurar Dominio     ${BIBlue}│${NC}"
echo -e "${BIBlue}╰═══════════════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭═══════════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mTu propio Dominio      ${NC}"
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominio que tiene el Script  ${NC}"
#echo -e "${BIBlue}│  [ 3 ]  \033[1;37mTu propio Dominio y tu Propio Dominio SlowDNS    ${NC}"
echo -e "${BIBlue}╰═══════════════════════════════════════════════════╯${NC}"
until [[ $domain =~ ^[1-2]+$ ]]; do 
read -p "   Por favor seleccione los números 1 o 2 : " domain
done
if [[ $domain == "1" ]]; then
clear 
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│            \033[1;37mDOMINIO O SUBDOMINIO          ${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│               \033[1;37mGRACIAS POR                ${BIBlue}│${NC}"
echo -e  "${BIBlue}│        \033[1;37mUSAR MI AUTOSCRIPT PREMIUM        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│                \033[1;37mBY JERRY 2024             ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do 
read -rp "Introduce tu Sub/Dominio aquí : " -e dnss
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dnss" > /root/domain
echo "$dnss" > /root/scdomain
echo "$dnss" > /etc/xray/scdomain
echo "$dnss" > /etc/v2ray/scdomain
echo "$dnss" > /etc/xray/domain
echo "$dnss" > /etc/v2ray/domain
echo "IP=$dnss" > /var/lib/ipvps.conf
echo ""
clear
elif  [[ $domain == "2" ]]; then
clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ \033[1;37mSeleccione Opcion para Configurar Dominio${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mDominio xxx.tepllovpn.eu.org          ${NC}"  
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominio xxx.berurat.cloud                ${NC}"  
echo -e "${BIBlue}│  [ 3 ]  \033[1;37mDominio xxx.xnxxms.cloud               ${NC}"  
echo -e "${BIBlue}│  [ 4 ]  \033[1;37mDominio xxx.vvpnstore.my.id               ${NC}"  
echo -e "${BIBlue}│  [ 5 ]  \033[1;37mDominio xxx.yogzvpn.cloud              ${NC}"  
#echo -e "${BIBlue}│  [ 6 ]  \033[1;37mDominio xxx.jerrysbg.com              ${NC}"                                        
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
until [[ $domain2 =~ ^[1-5]+$ ]]; do 
read -p "   Por favor seleccione los números 1 al 5 : " domain2
done
elif [[ $domain2 == "1" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.tepllovpn.eu.org   ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn1
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn1" > /root/subdomainx
cd
sleep 1
fun_bar 'res1'
clear
rm /root/subdomainx
fi
if [[ $domain2 == "2" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.berurat.cloud         ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn2
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn2" > /root/subdomainx
cd
sleep 1
fun_bar 'res2'
clear
rm /root/subdomainx
fi
if [[ $domain2 == "3" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.xnxxms.cloud        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn3 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn3
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn3" > /root/subdomainx
cd
sleep 1
fun_bar 'res3'
clear
rm /root/subdomainx
fi
if [[ $domain2 == "4" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.vvpnstore.my.id        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn4
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn4" > /root/subdomainx
cd
sleep 1
fun_bar 'res4'
clear
rm /root/subdomainx
fi
if [[ $domain2 == "5" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.yogzvpn.cloud        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn5 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn5
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn5" > /root/subdomainx
cd
sleep 1
fun_bar 'res5'
clear
rm /root/subdomainx
fi
if [[ $domain2 == "6" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.jerrysbg.com       ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn6 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn6
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn6" > /root/subdomainx
cd
sleep 1
fun_bar 'res6'
fi
}
cat <<EOF>> /etc/rmbl/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/rmbl/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/rmbl/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/rmbl/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/rmbl/theme/magenta
BG : \E[40;1;45m
TEXT : \033[0;35m
EOF
cat <<EOF>> /etc/rmbl/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/rmbl/theme/lightgray
BG : \E[40;1;47m
TEXT : \033[0;37m
EOF
cat <<EOF>> /etc/rmbl/theme/darkgray
BG : \E[40;1;100m
TEXT : \033[0;90m
EOF
cat <<EOF>> /etc/rmbl/theme/lightred
BG : \E[40;1;101m
TEXT : \033[0;91m
EOF
cat <<EOF>> /etc/rmbl/theme/lightgreen
BG : \E[40;1;102m
TEXT : \033[0;92m
EOF
cat <<EOF>> /etc/rmbl/theme/lightyellow
BG : \E[40;1;103m
TEXT : \033[0;93m
EOF
cat <<EOF>> /etc/rmbl/theme/lightblue
BG : \E[40;1;104m
TEXT : \033[0;94m
EOF
cat <<EOF>> /etc/rmbl/theme/lightmagenta
BG : \E[40;1;105m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/rmbl/theme/lightcyan
BG : \E[40;1;106m
TEXT : \033[0;96m
EOF
cat <<EOF>> /etc/rmbl/theme/color.conf
lightcyan
EOF
function SBGINSTALL2(){
cd
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/tools.sh &> /dev/null
chmod +x tools.sh 
bash tools.sh
clear
start=$(date +%s)
ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
}
function SBGINSTALL3(){
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}  PROCESANDO A INSTALAR SSH & OVVPN     ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}       PROCESANDO A INSTALAR XRAY       ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}     PROCESANDO A INSTALAR WEBSOCKET SSH${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}     PROCESANDO A INSTALAR BACKUP MENU  ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}     PROCESANDO A INSTALAR SHADOWSOCK   ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/shadowsocks/ss.sh && chmod +x ss.sh && ./ss.sh
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/shadowsocks/ssr.sh && chmod +x ssr.sh && ./ssr.sh
clear

#echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
#echo -e "${BIBlue}│ ${BGCOLOR}        PROCESANDO A INSTALAR OHP       ${NC}${BIBlue} │${NC}"
#echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/ohp.sh && chmod +x ohp.sh && ./ohp.sh
#clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO EXTRA MENU         ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
clear
    wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/menu/menu.zip
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -rf menu.zip
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/menu/update.sh && chmod +x update.sh && ./update.sh
clear

#echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
#echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO SLOW DNS           ${NC}${BIBlue} │${NC}"
#echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/slowdns && chmod +x slowdns && bash slowdns
#clear

#echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
#echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO UDP COSTUM         ${NC}${BIBlue} │${NC}"
#echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/udp-custom.sh && chmod +x udp-custom.sh && bash udp-custom.sh
#clear

#echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
#echo -e "${BIBlue}│ ${BGCOLOR}    PROCESANDO A INSTALAR NOOBZVPNS     ${NC}${BIBlue} │${NC}"
#echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/noobz/noobzvpns.zip
#unzip noobzvpns.zip
#chmod +x noobzvpns/*
#cd noobzvpns
#bash install.sh
#rm -rf noobzvpns
#systemctl restart noobzvpns
#clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}    PROCESANDO A INSTALAR LIMIT XRAY    ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/bin/limit.sh && chmod +x limit.sh && ./limit.sh
clear

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}    PROCESANDO A INSTALAR TROJAN-GO     ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/ins-trgo.sh && chmod +x ins-trgo.sh && bash ./ins-trgo.sh
clear

}

function iinfo(){
domain=$(cat /etc/xray/domain)
TIMES="10"
CHATID="833821933"
KEY="5340711015:AAEgC3JCrQZ2fkFqfV40UyqLfyzMmXX9BZI"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain) 
TIME=$(date +'%d-%m-%Y %I:%M')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIN=$(curl -sS https://raw.githubusercontent.com/JerrySBG/permission/main/ip | grep $MYIP | awk '{print $3}' )
d1=$(date -d "$IZIN" +%s)
d2=$(date -d "$today" +%s)
EXP=$(( (d1 - d2) / 86400 ))
author=$(cat /etc/profil)
TEXT="
<code>◇━━━━━━━━━━━━━━━━━━━━━━━━━━◇</code>
💻🆂🅲🆁🅸🅿🆃 🅹🅴🆁🆁🆈|🆂🅱🅶 💻
<code>◇━━━━━━━━━━━━━━━━━━━━━━━━━━◇</code>
<code>𝙐𝙨𝙚𝙧 𝙎𝙘𝙧𝙞𝙥𝙩 : </code><code>${author}</code>
<code>𝘾𝙍𝙀𝘼𝘿𝙊    : </code><code>${TIME} HORA</code>
<code>𝘿𝙤𝙢𝙞𝙣𝙞𝙤    : </code><code>${domain}</code>
<code>𝙄𝙋 𝙑𝙋𝙎     : </code><code>${MYIP}</code>
<code>𝘾𝙊𝙈𝙋𝘼Ñ𝙄𝘼  : </code><code>${ISP} $CITY</code>
<code>𝙊𝙎 𝙑𝙋𝙎     : </code><code>${MODEL2}</code>
<code>𝙍𝙖𝙢        : </code><code>${RAMMS} MB</code>
<code>𝙀𝙭𝙥 𝙎𝙘𝙧𝙞𝙥𝙩  : </code><code>$EXP Dias</code>
<code>◇━━━━━━━━━━━━━━━━━━━━━━━━━━◇</code>
<i> ᴀᴜᴛᴏꜱᴄʀɪᴘᴛ ɪɴꜱᴛᴀʟᴀᴅᴏ ᴄᴏʀʀᴇᴄᴛᴀᴍᴇɴᴛᴇ...</i>
"'&reply_markup={"inline_keyboard":[[{"text":"🔥 𝙒𝙝𝙖𝙩𝙨𝙖𝙥𝙥 𝙊𝙛𝙞𝙘𝙞𝙖𝙡 🔥","url":"https://wa.me/+529241293310"},{"text":"🔥 𝙏𝙚𝙡𝙚𝙜𝙧𝙖𝙢 𝙊𝙛𝙞𝙘𝙞𝙖𝙡 🔥","url":"https://t.me/Jerry_SBG"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
}

CEKIP
SBGINSTALL3
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/JerrySBG/SBG2/main/versi)
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
cd
curl -sS ifconfig.me > /etc/myipvps
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 >> /etc/xray/isp
rm /root/setup.sh >/dev/null 2>&1
rm /root/slhost.sh >/dev/null 2>&1
rm /root/ssh-vpn.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm /root/set-br.sh >/dev/null 2>&1
#rm /root/ohp.sh >/dev/null 2>&1
rm /root/update.sh >/dev/null 2>&1
rm /root/installsl.sh >/dev/null 2>&1
rm /root/slowdns.sh >/dev/null 2>&1
rm -rf /etc/noobz
mkdir -p /etc/noobz
echo "" > /etc/xray/noob
iinfo

secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 3
echo  ""
cd
rm -rf * 
timedatectl set-timezone America/Mexico_City
ntpdate 0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org 0.south-america.pool.ntp.org
echo "------------------------------------------------------------"
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - SlowDNS           : Todos los Puertos" | tee -a log-install.txt
echo "   - OpenSSH           : 22"  | tee -a log-install.txt
echo "   - SSH Websocket     : 8008, 8080, 8090, 8280" | tee -a log-install.txt
echo "   - SSH SSL Websocket : 8443" | tee -a log-install.txt
echo "   - Stunnel4          : 443" | tee -a log-install.txt
echo "   - Dropbear          : 109, 110, 143" | tee -a log-install.txt
echo "   - Badvpn            : 7100-7300" | tee -a log-install.txt
echo "   - Nginx             : 81" | tee -a log-install.txt
echo "   - Vmess TLS         : 443" | tee -a log-install.txt
echo "   - Vmess None TLS    : 80, 8080" | tee -a log-install.txt
echo "   - Vless TLS         : 443" | tee -a log-install.txt
echo "   - Vless None TLS    : 80, 8080" | tee -a log-install.txt
echo "   - Trojan GRPC       : 443" | tee -a log-install.txt
echo "   - Trojan WS         : 443" | tee -a log-install.txt
echo "   - Trojan Go         : 443" | tee -a log-install.txt
echo "   - UDP Custom        : 1-65535" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Informacion del Servidor & Otras Configuraciones"  | tee -a log-install.txt
echo "   - Zona Horaria      : Mexico (UTC -6)"  | tee -a log-install.txt
echo "   - Fail2Ban          : [ON]"  | tee -a log-install.txt
echo "   - Dflate            : [ON]"  | tee -a log-install.txt
echo "   - IPtables          : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reinicio     : [ON]"  | tee -a log-install.txt
echo "   - IPv6              : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On     : 12:00 $gg UTC -6" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
#echo "   - Change port" | tee -a log-install.txt
echo "   - Elaborado por: JerrySBG"  | tee -a log-install.txt
echo "   - Whatsapp: +529241293310" | tee -a log-install.txt
echo "   - Telegram: @Jerry_SBG" | tee -a log-install.txt
echo ""
echo "------------------------------------------------------------"
echo -e "${BIBlue}╭════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│${BGCOLOR}    INSTALACION DEL SCRIPT FINALIZADO..     ${NC}${BIBlue}│${NC}"
echo -e "${BIBlue}│${BGCOLOR}    TU VPS SE REINCIARA EN 10 SEGUNDOS..    ${NC}${BIBlue}│${NC}"
echo -e "${BIBlue}╰════════════════════════════════════════════╯${NC}"
echo  ""
#echo -e "[ ${yell}ADVERTENCIA${NC} ] ¿Quieres Reiniciar Ahora? ? (s/n)? "; read answer
#if [ "$answer" == "${answer#[Ss]}" ] ;then
#exit 0
#else
sleep 10
rm /root/log-install.txt >/dev/null 2>&1
reboot
#fi
