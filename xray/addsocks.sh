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
stls="$(cat ~/log-install.txt | grep -w "SOCKS5 WS TLS" | cut -d: -f2|sed 's/ //g')"
snontls="$(cat ~/log-install.txt | grep -w "SOCKS5 WS NON TLS" | cut -d: -f2|sed 's/ //g')"
sgrpc="$(cat ~/log-install.txt | grep -w "SOCKS5 GRPC TLS" | cut -d: -f2|sed 's/ //g')"
shttp="$(cat ~/log-install.txt | grep -w "SOCKS5 HTTP TLS" | cut -d: -f2|sed 's/ //g')"
shttpnon="$(cat ~/log-install.txt | grep -w "SOCKS5 HTTP NON TLS" | cut -d: -f2|sed 's/ //g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
read -rp "Password : " -e sandi
user_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
read -rp "Password : " -e sandi
user_EXISTS=$(grep -w $user /etc/xray/xvmess.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
read -rp "Password : " -e sandi
user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
read -rp "Password : " -e sandi
user_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
read -rp "Password : " -e sandi
user_EXISTS=$(grep -w $user /etc/xray/xss.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
base64=$(openssl rand -base64 16)
uuid=$(openssl rand -hex 7)
sandi=$uuid
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#socks-tls$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#socks-tls$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvless.json

sed -i '/#socks-grpc$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#socks-grpc$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvmess.json

sed -i '/#socks-http-tls$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#socks-http-tls$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#socks-http-nontls$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xtrojan.json

sed -i '/#socks-kcp$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$user""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#socks-kcp$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#socks-kcp$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xtrojan.json

sed -i '/#socks-kcp-nontls$/a\### '"$user $exp"'\
},{"user": "'""$user""'","pass": "'""$sandi""'","email": "'""$user""'"' /etc/xray/xtrojan.json

echo $user:$sandi > /tmp/log
socks_base64=$(cat /tmp/log)
echo -n "${socks_base64}" | base64 > /tmp/log1
socks_base641=$(cat /tmp/log1)
socks5tls="socks://${socks_base641}@$domain:$stls?path=%2FWISNU-WS&security=tls&host=$domain&type=ws&sni=$domain#%F0%9F%94%A5SOCKS5+WS+TLS+$user"
socks5nontls="socks://${socks_base641}@$domain:$snontls?path=%2FWISNU-WS&security=none&host=$domain&type=ws#%F0%9F%94%A5SOCKS5+WS+NONTLS+$user"
socks5grpc="socks://${socks_base641}@$domain:$sgrpc?mode=multi&security=tls&type=grpc&serviceName=WISNU-GRPC&sni=$domain#%F0%9F%94%A5SOCKS5+GRPC+TLS+$user"
socks5http="socks://${socks_base641}@$domain:$shttp?path=%2FCOKRO-TCP&security=tls&host=$domain&headerType=http&type=tcp&sni=$domain#%F0%9F%94%A5SOCKS5+HTTP+TLS+$user"
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
echo -e "\033[1;46m🔥AKUN SOCKS5 WEBSOCKET 🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Nama➡️ ${user}"
echo -e "Sandi➡️ $sandi"
echo -e "IP➡️ ${MYIP},$domain2"
echo -e "Host➡️ ${domain}"
echo -e "CF Host➡️ ${domain3}"
echo -e "Protocol➡️ websocket"
echo -e "Path WS➡️ /WISNU-WS"
echo -e "Path GRPC➡️ WISNU-GRPC"
echo -e "Path TCP➡️ /COKRO-TCP"
echo -e "Path KCP➡️ COKRO-KCP"
echo -e "TLS➡️ ${ttls},8443,2096,2087,2083,2053"
echo -e "NONTLS➡️ ${tnontls},2095,2086,2082,2052"
echo -e "Dibuat➡️ $hariini"
echo -e "Kadaluarsa➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS TLS➡️ ${socks5tls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS NONTLS➡️ ${socks5nontls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "GRPC TLS➡️ ${socks5grpc}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TCP TLS➡️ ${socks5http}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔥LUXURY EDITION ZEROSSL🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
ssmenu
