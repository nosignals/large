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
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date=`date +"%Y-%m-%d" -d "$dateFromServer"`
#MYIP=$(wget -qO- ipinfo.io/ip);
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
domain=$(cat /etc/xray/domain)
domain2=$(cat /etc/xray/domain2)
domain3=$(cat /etc/xray/domain3)
tls="$(cat ~/log-install.txt | grep -w "VMESS WS TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "VMESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xvmess.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Username : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xss.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
#uuid=$(cat /proc/sys/kernel/random/uuid)
#uuid=$(openssl rand -base64 16)
uuid=$(openssl rand -hex 7)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xss.json
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "1",
      "ps": "🔥VMESS WS TLS ${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/SHANUM",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF

cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "🔥VMESS WS NONTLS ${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/SHANUM",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF

cat>/etc/xray/vmess-$user-worry.json<<EOF
      {
      "v": "3",
      "ps": "🔥VMESS WS NONTLS ${user}",
      "add": "${domain}",
      "port": "4040",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "http://tsel.me/worryfree",
      "type": "none",
      "host": "twitter.com",
      "tls": "none"
}
EOF

cat>/etc/xray/vmess-$user-habis.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS WS NONTLS ${user}",
      "add": "${domain}",
      "port": "4041",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "http://myorbit.id/kuota-habis",
      "type": "none",
      "host": "myorbit.id",
      "tls": "none"
}
EOF

vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmess_base644=$( base64 -w 0 <<< $vmess_json4)
vmess1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
vmess2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
vmess3="vmess://$(base64 -w 0 /etc/xray/vmess-$user-worry.json)"
vmess4="vmess://$(base64 -w 0 /etc/xray/vmess-$user-habis.json)"

rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json
rm -rf /etc/xray/vmess-$user-worry.json
rm -rf /etc/xray/vmess-$user-habis.json

systemctl restart xray.service
systemctl restart xvmess
systemctl restart xvless
systemctl restart xtrojan
systemctl restart xss
#systemctl restart nginx
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔥AKUN VMESS WEBSOCKET🔥 \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Nama➡️ ${user}"
echo -e "IP➡️ ${MYIP},$domain2"
echo -e "Alamat➡️ ${domain}"
echo -e "CF Host➡️${domain3}"
echo -e "TLS➡️ ${tls},8443,2096,2087,2083,2053"
echo -e "NONTLS➡️ ${nontls},2095,2086,2082,2052"
echo -e "Protokol➡️ WEBSOCKET"
echo -e "Path➡️ /SHANUM"
echo -e "UserID➡️ ${uuid}"
echo -e "Dibuat➡️ $hariini"
echo -e "Kadaluarsa➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS TLS➡️ ${vmess1}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS NONTLS➡️ ${vmess2}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "WORRY➡️ ${vmess3}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "ORBIT➡️ ${vmess4}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔥LUXURY EDITION ZEROSSL🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
vmessmenu
