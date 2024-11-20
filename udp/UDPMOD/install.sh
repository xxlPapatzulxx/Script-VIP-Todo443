#!/bin/bash
NC='\e[0m'
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
rm -rf $(pwd)/$0

clear  
echo -e "$COLOR1╭═══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│$NC     \e[1;32mCONFIGURA IP/SUBDOMINIO/DOMINIO       $COLOR1│${NC}"  
echo -e "$COLOR1╰═══════════════════════════════════════════╯${NC}"
echo -e " "
read -p "   Ingresa tu Ip/Subdominio/Dominio : " domain
echo -e "$COLOR1╭═══════════════════════════════════════════╮${NC}" 
echo -e "$COLOR1│           \e[1;32mCREAR OBFS PERSONALIZADO        $COLOR1│${NC}"  
echo -e "$COLOR1╰═══════════════════════════════════════════╯${NC}"
echo -e " "
read -p "   Ingresa tu OBFS o ENTER para una Aletorio : " OBFS
    [[ -z "$OBFS" ]] && OBFS=`head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 8`



#read -p " ingresa tu dominio: " domain

apt update -y; apt upgrade -y; apt install git -y

git clone https://github.com/rudi9999/UDPMOD.git

dir=$(pwd)

#OBFS=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 8)

interfas=$(ip -4 route ls|grep default|grep -Po '(?<=dev )(\S+)'|head -1)

sys=$(which sysctl)

ip4t=$(which iptables)
ip6t=$(which ip6tables)

openssl genrsa -out ${dir}/UDPMOD/udpmod.ca.key 2048
openssl req -new -x509 -days 3650 -key ${dir}/UDPMOD/udpmod.ca.key -subj "/C=CN/ST=GD/L=SZ/O=Udpmod, Inc./CN=Udpmod Root CA" -out ${dir}/UDPMOD/udpmod.ca.crt
openssl req -newkey rsa:2048 -nodes -keyout ${dir}/UDPMOD/udpmod.server.key -subj "/C=CN/ST=GD/L=SZ/O=Udpmod, Inc./CN=${domain}" -out ${dir}/UDPMOD/udpmod.server.csr
openssl x509 -req -extfile <(printf "subjectAltName=DNS:${domain},DNS:${domain}") -days 3650 -in ${dir}/UDPMOD/udpmod.server.csr -CA ${dir}/UDPMOD/udpmod.ca.crt -CAkey ${dir}/UDPMOD/udpmod.ca.key -CAcreateserial -out ${dir}/UDPMOD/udpmod.server.crt

sed -i "s/36712/36715/" ${dir}/UDPMOD/config.json
sed -i "s/100/600/" ${dir}/UDPMOD/config.json
sed -i "s/setobfs/${OBFS}/" ${dir}/UDPMOD/config.json
sed -i "s#instDir#${dir}#g" ${dir}/UDPMOD/config.json
sed -i "s#instDir#${dir}#g" ${dir}/UDPMOD/udpmod.service
sed -i "s#iptb#${interfas}#g" ${dir}/UDPMOD/udpmod.service
sed -i "s#sysb#${sys}#g" ${dir}/UDPMOD/udpmod.service
sed -i "s#ip4tbin#${ip4t}#g" ${dir}/UDPMOD/udpmod.service
sed -i "s#ip6tbin#${ip6t}#g" ${dir}/UDPMOD/udpmod.service

chmod +x ${dir}/UDPMOD/*

install -Dm644 ${dir}/UDPMOD/udpmod.service /etc/systemd/system

sed -i 's/10000:65000/20000:39999/g' /root/UDPMOD/udpmod.service
sed -i 's/36712/36715/g' /root/UDPMOD/udpmod.service
ufw allow 20000:39999/udp
ufw allow 36715/udp

systemctl daemon-reload
systemctl restart udpmod
systemctl start udpmod
systemctl enable udpmod

echo " \e[1;32mOBFS: ${OBFS}" > ${dir}/UDPMOD/data
echo " \e[1;32mPuerto: 36715" >> ${dir}/UDPMOD/data
echo " \e[1;32mRango de Puertos: 20000:39999" >> ${dir}/UDPMOD/data
cat ${dir}/UDPMOD/data
read -p " \e[1;32mPresione [Enter] para Continuar"
rm -f /root/UDPMOD/install.sh
rm -f /root/UDPMOD/README.md
menu