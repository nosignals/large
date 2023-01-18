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
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
domain=$(cat /etc/xray/domain)
domain2=$(cat /etc/xray/domain2)
domain3=$(cat /etc/xray/domain3)
tls="$(cat ~/log-install.txt | grep -w "VMESS WS TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "VMESS WS NON TLS" | cut -d: -f2|sed 's/ //g')"
vmhttp="$(cat ~/log-install.txt | grep -w "VMESS HTTP TLS" | cut -d: -f2|sed 's/ //g')"
vmhttpnon="$(cat ~/log-install.txt | grep -w "VMESS HTTP NON TLS" | cut -d: -f2|sed 's/ //g')"
vmgrpc="$(cat ~/log-install.txt | grep -w "VMESS GRPC TLS" | cut -d: -f2|sed 's/ //g')"
vmgrpcnon="$(cat ~/log-install.txt | grep -w "VMESS GRPC NON TLS" | cut -d: -f2|sed 's/ //g')"
vmhdua="$(cat ~/log-install.txt | grep -w "VMESS H2C TLS" | cut -d: -f2|sed 's/ //g')"
vmquic="$(cat ~/log-install.txt | grep -w "VMESS QUIC TLS" | cut -d: -f2|sed 's/ //g')"
vmkcp="$(cat ~/log-install.txt | grep -w "VMESS KCP TLS" | cut -d: -f2|sed 's/ //g')"
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
},{"id": "'""$uuid""'"' /etc/xray/xvmess.json
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/xvless.json
sed -i '/#vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
sed -i '/#vmess-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmess-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vmess-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-grpc-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-grpc-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmess-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-quic$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vmess-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmess-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vmess-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vmess-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vmess-kcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xtrojan.json

sed -i '/#vmess-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vmess-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-http-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-http-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vmess-http-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vmess-http-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
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
      "v": "4",
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
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
vmess2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json

cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS GRPC TLS ${user}",
      "add": "${domain}",
      "port": "${vmgrpc}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "AYESHA",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS GRPC NONTLS ${user}",
      "add": "${domain}",
      "port": "${vmgrpcnon}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "AYESHA",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmessgrpc="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
vmessgrpcnon="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json

cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS QUIC TLS ${user}",
      "add": "${MYIP}",
      "port": "${vmquic}",
      "id": "${uuid}",
      "aid": "0",
      "net": "quic",
      "path": "SHANUM-QUIC",
      "type": "none",
      "host": "$domain",
      "tls": "tls"
}
EOF
vmessquic=$( base64 -w 0 <<< $vmess_json1)
#vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmessquic="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
#vmessgrpclink2="vmess://$(base64 -w 0 /etc/xray/$user-none.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-hdua-$user-nontls.json

cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS H2C TLS ${user}",
      "add": "${domain}",
      "port": "${vmhdua}",
      "id": "${uuid}",
      "aid": "0",
      "net": "http",
      "path": "SHANUM-HTTP",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
vmesshdua=$( base64 -w 0 <<< $vmess_json1)
#vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesshdua="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
#vmessgrpclink2="vmess://$(base64 -w 0 /etc/xray/$user-none.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-hdua-$user-nontls.json

cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS KCP TLS ${user}",
      "add": "${domain}",
      "port": "${vmkcp}",
      "id": "${uuid}",
      "aid": "0",
      "net": "kcp",
      "path": "SHANUM-KCP",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesskcp="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"

rm -rf /etc/xray/vmess-$user-tls.json

cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS HTTP TLS ${user}",
      "add": "${domain}",
      "port": "${vmhttp}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/SHANUM-TCP",
      "type": "http",
      "host": "${domain}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesshttp="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
rm -rf /etc/xray/vmess-$user-tls.json

cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "4",
      "ps": "🔥VMESS HTTP NONTLS ${user}",
      "add": "${domain}",
      "port": "${vmhttpnon}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/",
      "type": "http",
      "host": "$domain",
      "tls": "none"
}
EOF
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesshttpnon="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-nontls.json

systemctl restart xvless
systemctl restart xray.service
systemctl restart xvmess
systemctl restart xtrojan
systemctl restart xss
#systemctl restart nginx
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m  🔥AKUN VMESS TESTER🔥   \e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "IP➡️ ${MYIP},$domain"
echo -e "HOST➡️ $domain2"
echo -e "CF Host➡️ ${domain3}"
echo -e "NAMA➡️ ${user}"
echo -e "WS TLS➡️ ${tls},8443,2096,2087,2083,2053"
echo -e "WS NONTLS➡️ ${nontls},2095,2086,2082,2052"
echo -e "GRPC➡️ ${vmgrpc},8443,2096,2087,2083,2053"
echo -e "TCP HTTP➡️ ${vmhttp},8443,2096"
echo -e "H2C➡️ ${vmhdua}"
echo -e "HTTP➡️ ${vmhttpnon}"
echo -e "QUIC➡️ ${vmquic}"
echo -e "Protokol➡️ WS,GRPC,QUIC,KCP,H2C,HTTP"
echo -e "Path GRPC➡️ AYESHA"
echo -e "Path HTTP➡️ /SHANUM-TCP"
echo -e "Path H2C➡️ SHANUM-HTTP"
echo -e "Path WS➡️ /SHANUM"
echo -e "Path QUIC➡️ SHANUM-QUIC"
echo -e "UserID➡️ ${uuid}"
echo -e "Dibuat➡️ $hariini"
echo -e "Kadaluarsa➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "GRPC TLS➡️ ${vmessgrpc}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "HTTP TLS➡️ ${vmesshttp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS TLS➡️ ${vmess1}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "WS NONTLS➡️ ${vmess2}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "QUIC TLS➡️ ${vmessquic}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
#echo -e "GRPC NONTLS➡️ ${vmessgrpcnon}"
#echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "H2C TLS➡️ ${vmesshdua}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "KCP TLS➡️ ${vmesskcp}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "HTTP NONTLS➡️ ${vmesshttpnon}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔥LUXURY EDITION ZEROSSL🔥\e[m"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
vmessmenu
