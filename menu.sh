#!/bin/bash
BG_BLU="\033[44;1m" # BG BIRU
BlueCyan='\e[5;36m'
Xark='\e[0m'
GREN="\033[0;32m"
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/JerrySBG/SBG/main/izin"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          ANDA HARUS MENDAFTAR DAHULU UNTUK MENJADI SELLER         \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}DAFTAR DULU BOS !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6685171610141"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
Repo1="https://raw.githubusercontent.com/SBG/main/"
cd izin
export MYIP=$( curl -sS ipv4.icanhazip.com/ )
SELLER=$(curl -sS ${Repo1}ip | grep $MYIP | awk '{print $2}')
Exp100=$(curl -sS ${Repo1}ip | grep $MYIP | awk '{print $3}')
data_ip="https://raw.githubusercontent.com/SBG/main/izin"
cd izin
d2=$(date -d "$date_list" +"+%s")
d1=$(date -d "$Exp" +"+%s")
dayleft=$(( ($d1 - $d2) / 86400 ))

#########################
[[ ! -f /usr/bin/git ]] && apt install git -y &> /dev/null
# COLOR VALIDATION
clear
RED='\033[0;31m'
BG_BLU="\033[44;1m" # BG BIRU
BlueCyan='\e[5;36m'
Xark='\e[0m'
GREN="\033[0;32m"
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;95m"
YELL='\033[1;33m'
BGX="\033[42m"
END='\e[0m'

AKTIF="VERIFIED"
TOKEN="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"
REPO="https://github.com/JerrySBG/SBG.git"
EMAIL="p.layhackbins@gmail.com"
USER="JerrySBG"


add-ip() {
TIMES="10"
CHATID="833821933"
KEY="5340711015:AAEgC3JCrQZ2fkFqfV40UyqLfyzMmXX9BZI"
URL="https://api.telegram.org/bot$KEY/sendMessage"


    today=`date -d "0 days" +"%Y-%m-%d"`
    git clone ${REPO} /root/scvps/ &> /dev/null
    clear
    echo -e ""
    echo -e ""
    read -p "  Input IP Address : " ip
    CLIENT_EXISTS=$(grep -w $ip /root/scvps/izin | wc -l)
    if [[ ${CLIENT_EXISTS} == '1' ]]; then
    echo "IP Already Exist !"
    exit 0
    fi
    echo -e ""
   # read -p "  Input Username IP (Example : Lt) : " name
    name=H6EFctYeZ3DqOWSaiXjtT1u8`</dev/urandom tr -dc A-Z0-9 | head -c4`
    echo -e ""
    clear
    echo -e ""
    echo -e ""
    echo "  How Much Days Do You Want ?"
    echo "  [1] 30 Days"
    echo "  [2] 60 Days"
    echo "  [3] 90 Days"
    echo "  [4] Lifetime"
    echo "  [5] Custom Expiration Date"
    echo -e ""
    read -p "  Input Menu Number : " exp

    if [[ ${exp} == '1' ]]; then
    exp2=`date -d "30 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/scvps/izin
    elif [[ ${exp} == '2' ]]; then
    exp2=`date -d "60 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/scvps/izin
    elif [[ ${exp} == '3' ]]; then
    exp2=`date -d "90 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/scvps/izin
    elif [[ ${exp} == '4' ]]; then
    exp2="Lifetime"
    echo "### ${name} ${exp2} ${ip}" >> /root/scvps/izin
    elif [[ ${exp} == '5' ]]; then
    read -p "Input Expired Days : " exp11
    exp2=`date -d "$exp11 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/scvps/izin
    fi
    cd /root/scvps
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/JerrySBG/SBG.git
    git push origin -f main
    #git push -f https://${USER}@github.com/JerrySBG/SBG.git &> /dev/null
    cd izinIp
    rm -rf /root/scvps
    clear
    sleep 1
    echo "  Registering IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
    clear
TEXT="
<code>───────────────────────────</code>
<code>    SUCCES  REGISTERED IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ip</code>
<code>Registered On  : $today</code>
<code>Expired On     : $exp2</code>
<code>───────────────────────────</code>
"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo -e "               \e[1;97mSuccesfully Add IP Address${NC}"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"

    echo -e ""
    echo -e "  ${YELL}Username${NC}      : $name"
    echo -e "  ${YELL}IP Address${NC}    : $ip"
    echo -e "  ${YELL}Registered On${NC} : $today"
    echo -e "  ${YELL}Expired On${NC}    : $exp2"
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"

    read -n 1 -s -r -p "  Press any key to back on menu"
    menu
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

del-ip() {
TIMES="10"
CHATID="833821933"
KEY="5340711015:AAEgC3JCrQZ2fkFqfV40UyqLfyzMmXX9BZI"
URL="https://api.telegram.org/bot$KEY/sendMessage"

    rm -rf /root/scvps
    git clone ${REPO} /root/scvps/ &> /dev/null
    clear
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo -e "          \e[1;97mList IP Address Have Been Registered${NC}"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo ""
    grep -E "^###"    "/root/scvps/izin" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    grep -E "^#&"    "/root/scvps/izin" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"

    read -p "   Input IP Address To Delete : " ipdel
    name=$(cat /root/scvps/izin | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/scvps/izin | grep $ipdel | awk '{print $3}')
    if [[ ${exp} == 'Lifetime' ]]; then
    sed -i "/^#&   $name   $exp $ipdel/,/^},{/d" /root/scvps/izinIP
    else
    sed -i "/^### $name $exp $ipdel/,/^},{/d" /root/scvps/izinIP
    fi
    cd /root/scvps
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/JerrySBG/SBG
    git push -f https://${USER}@github.com/JerrySBG/SBG.git &> /dev/null
    rm -rf /root/scvps
    clear
    sleep 1
    echo "  Delete IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
    clear
TEXT1="
<code>───────────────────────────</code>
<code>    SUCCES DELETE  IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipdel</code>
<code>Expired On     : $exp</code>
<code>───────────────────────────</code>
"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo -e "          \e[1;97mSuccesfully Deleted The IP Address${NC}"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo ""
    echo -e "  ${YELL}Username${NC}   : $name"
    echo -e "  ${YELL}IP Address${NC} : $ipdel"
    echo -e "  ${YELL}Expired On${NC} : $exp"
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"

    read -n 1 -s -r -p "  Press any key to back on menu"
    menu
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT1&parse_mode=html" $URL >/dev/null
}

renew-ip() {
TIMES="10"
CHATID="833821933"
KEY="5340711015:AAEgC3JCrQZ2fkFqfV40UyqLfyzMmXX9BZI"
URL="https://api.telegram.org/bot$KEY/sendMessage"

    rm -rf /root/ipvps
    git clone ${REPO} /root/Script-VPN/ &> /dev/null
    clear
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo -e "          \e[1;97mList IP Address Have Been Registered${NC}"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo ""
    grep -E "^###" "/root/scvps/izin" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo ""
    read -p "  Input IP Address To Renew : " ipdel
    read -p "  Input Days  : " days
    name=$(cat /root/scvps/izin | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/scvps/izin | grep $ipdel | awk '{print $3}')
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $days))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
    sed -i "s/### $name $exp $ipdel/### $name $exp4 $ipdel/g" /root/scvps/izin
    cd /root/scvps
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/JerrySBG/SBG
    git push -f https://${USER}@github.com/JerrySBG/SBG.git &> /dev/null
    rm -rf /root/scvps
    clear
    sleep 1
    echo "  Renew IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
    clear
TEXT2="
<code>───────────────────────────</code>
<code>    SUCCES RENEW  IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipdel</code>
<code>Expired On     : $exp4</code>
<code>───────────────────────────</code>
"
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"
    echo -e "          \e[1;97mSuccesfully Renew The IP Address${NC}"
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"

   echo ""
    echo -e "  ${YELL}Username${NC}   : $name"
    echo -e "  ${YELL}IP Address${NC} : $ipdel"
    echo -e "  ${YELL}Expired On${NC} : $exp4"
    echo ""
    echo -e "${BlueCyan} ———————————————————————————————————————${Xark}"


    read -n 1 -s -r -p "Press any key to back on menu"
    menu
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL >/dev/null
}

clear

echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  [ REGISTER IP MENU ]${NC}"
echo -e "   SELLER NAME   : $SELLER "
echo -e "   SELLER STATUS : $AKTIF "
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "  ${grenbo}[1]$NC  ${YELL}Add IP VPS"$NC
echo -e "  ${grenbo}[2]$NC  ${YELL}Delete IP VPS"$NC
echo -e "  ${grenbo}[3]$NC  ${YELL}Renew IP VPS"$NC
echo -e "  ${grenbo}[4]$NC  ${YELL}EXIT ADD IP"$NC
echo -e ""
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -p "  Please Input Menu Number : " menu
case $menu in
1 | 01)
clear
add-ip
;;
2 | 02)
clear
del-ip
;;
3 | 03)
clear
renew-ip
;;

4 | 04)
clear
exit
;;

*)
echo "Please Input An Correct Menu !"
sleep 1
menu
;;
esac
