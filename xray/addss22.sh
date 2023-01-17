#!/bin/bash
# My Telegram : https://t.me/zerossl
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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /etc/xray/domain)
domain2=$(cat /etc/xray/domain2)
domain3=$(cat /etc/xray/domain3)
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date=`date +"%Y-%m-%d" -d "$dateFromServer"`
#uuid=$(cat /proc/sys/kernel/random/uuid)
sstls="$(cat ~/log-install.txt | grep -w "SS 2022 WS TLS" | cut -d: -f2|sed 's/ //g')"
ssnontls="$(cat ~/log-install.txt | grep -w "SS 2022 WS NON TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xvmess.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
l
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xss.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
base64=$(openssl rand -base64 16)
#uuid=$(openssl rand -hex 7)
uuid=$base64
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ss-tls$/a\### '"$user $exp"'\
},{"password": "$uuid","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#ss-tls$/a\### '"$user $exp"'\
},{"password": "$uuid","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#ss-tls$/a\### '"$user $exp"'\
},{"password": "$uuid","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#ss-nontls$/a\### '"$user $exp"'\
},{"password": "$uuid","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#ss-nontls$/a\### '"$user $exp"'\
},{"password": "$uuid","email": "'""$user""'"' /etc/xray/config.json

echo 2022-blake3-aes-128-gcm:GANdRinGcq34MSCDTOck0g==:$base64 > /tmp/log
ss_base64=$(cat /tmp/log)
echo -n "${ss_base64}" | base64 > /tmp/log1
ss_base641=$(cat /tmp/log1)
sstls="ss://${ss_base641}@$domain:$sstls?path=%2Fworryfree%2F&security=tls&host=$domain&type=ws&sni=$domain#%F0%9F%94%A5SS+2022+WS+TLS+$user"
ssnontls="ss://${ss_base641}@$domain:$ssnontls?path=%2Fworryfree%2F&security=none&host=$domain&type=ws#%F0%9F%94%A5SS+2022+WS+NON+TLS+$user"
systemctl restart xvmess
systemctl restart xray.service
systemctl restart xtrojan.service
systemctl restart xvless
systemctl restart xss
#systemctl restart nginx
service cron restart
clear
echo -e ""
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔥AKUN SS2022 WEBSOCKET 🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Nama➡️ ${user}"
echo -e "IP➡️ ${MYIP},$domain2"
echo -e "Host➡️ ${domain}"
echo -e "CF Host➡️ ${domain3}"
echo -e "Protocol➡️ websocket"
echo -e "Path➡️ /GANDRING-WS ,/worryfree/ ,/kuota-habis/"
echo -e "TLS➡️ ${sstls},8443,2096,2087,2083,2053"
echo -e "NONTLS➡️ ${ssnontls},2095,2086,2082,2052"
echo -e "Sandi➡️ GANdRinGcq34MSCDTOck0g==:$base64"
echo -e "Dibuat➡️ $hariini"
echo -e "Kadaluarsa➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS TLS➡️ ${sstls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS NONTLS➡️ ${ssnontls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔥LUXURY EDITION ZEROSSL🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
ssmenu
