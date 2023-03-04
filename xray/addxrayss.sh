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
sstls="$(cat ~/log-install.txt | grep -w "SS XRAY WS TLS" | cut -d: -f2|sed 's/ //g')"
ssnontls="$(cat ~/log-install.txt | grep -w "SS XRAY WS NON TLS" | cut -d: -f2|sed 's/ //g')"
ssgrpc="$(cat ~/log-install.txt | grep -w "SS XRAY GRPC TLS" | cut -d: -f2|sed 's/ //g')"
sshttp="$(cat ~/log-install.txt | grep -w "SS XRAY TCP HTTP TLS" | cut -d: -f2|sed 's/ //g')"
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
#uuid=$(openssl rand -base64 16)
#uuid=$(openssl rand -hex 7)
uuid=$(cat /proc/sys/kernel/random/uuid)
cipher="aes-128-gcm"
cipher2="aes-256-gcm"
cipher3="chacha20-poly1305"
cipher4="chacha20-ietf-poly1305"
cipher5="xchacha20-poly1305"
cipher6="xchacha20-ietf-poly1305"
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher2""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher3""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher4""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher5""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher6""'","email": "'""$user""'"' /etc/xray/xvless.json

sed -i '/#xray-ss-ws/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher2""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher3""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-ws/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher4""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher5""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-ws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher6""'","email": "'""$user""'"' /etc/xray/xvmess.json

sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher2""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher3""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher4""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher5""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher6""'","email": "'""$user""'"' /etc/xray/xvless.json

sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher2""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher3""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher4""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher5""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-grpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher6""'","email": "'""$user""'"' /etc/xray/xvmess.json

sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher2""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher3""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher4""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher5""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher6""'","email": "'""$user""'"' /etc/xray/xvless.json

sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher2""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher3""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher4""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher5""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#xray-ss-http$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher6""'","email": "'""$user""'"' /etc/xray/xvmess.json

echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base641=$(cat /tmp/log1)
xraysstls="ss://${shadowsocks_base641}@${domain}:443?type=ws&security=tls&host=$domain&path=%2fBEKTI-WS&sni=$domain3#%F0%9F%94%A5SS+LAWAS+WS+TLS+${user}"
xrayssnontls="ss://${shadowsocks_base641}@${domain}:80?type=ws&security=none&host=$domain&path=%2fBEKTI-WS#%F0%9F%94%A5SS+LAWAS+WS+NONTLS+${user}"
xrayssworry="ss://${shadowsocks_base641}@${domain}:80?type=ws&security=none&host=twitter.com&path=http://tsel.me/worryfree#%F0%9F%94%A5SS+LAWAS+WS+NONTLS+${user}"
xraysshabis="ss://${shadowsocks_base641}@${domain}:80?type=ws&security=none&host=myorbit.id&path=http://myorbit.id/kuota-habis#%F0%9F%94%A5SS+LAWAS+WS+NONTLS+${user}"
xraysshttp="ss://${shadowsocks_base641}@$domain:443?path=/BEKTI-TCPsecurity=tls&host=$domain&headerType=http&type=tcp&sni=$domain#%F0%9F%94%A5SS+LAWAS+TCP+TLS+$user"
xrayssgrpc="ss://${shadowsocks_base641}@s.gandring.my.id:443?mode=gun&security=tls&type=grpc&serviceName=BEKTI-GRPC&sni=$domain#%F0%9F%94%A5SS+LAWAS+GRPC+TLS+$user"
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
echo -e "\033[1;46m🔥AKUN SS LAWAS KOMPLET 🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Nama➡️ ${user}"
echo -e "IP➡️ ${MYIP},$domain2"
echo -e "Host➡️ ${domain}"
echo -e "CF Host➡️ ${domain3}"
echo -e "Protocol➡️ websocket"
echo -e "Path➡️ /BEKTI-WS,/worryfree/,/kuota-habis/"
echo -e "TLS➡️ 443,8443,2096,2087,2083,2053"
echo -e "NONTLS➡️ 80,2095,2086,2082,2052"
echo -e "Sandi➡️ ${uuid}"
echo -e "Dibuat➡️ $hariini"
echo -e "Kadaluarsa➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS TLS➡️ ${xraysstls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS NONTLS➡️ ${xrayssnontls}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WORRY➡️ ${xrayssworry}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "HABIS➡️ ${xraysshabis}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "GRPC TLS➡️ ${xrayssgrpc}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "TCP TLS➡️ ${xraysshttp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔥LUXURY EDITION ZEROSSL🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
ssmenu
