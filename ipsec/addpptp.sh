#!/bin/bash
#Remake by zerossl
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
domain=$(cat /etc/xray/domain)
clear
source /var/lib/wisnucs/ipvps.conf
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(curl -sS ifconfig.me);
else
PUBLIC_IP=$IP
fi
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"  | tee -a /etc/log-create-user.log
echo -e "\E[46;1;46m        🔰 AKUN PPTP 🔰           \E[0m"   | tee -a /etc/log-create-user.log
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log

until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
read -rp "Username: " -e VPN_USER
CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/wisnucs/data-user-pptp | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"  | tee -a /etc/log-create-user.log
echo -e "\E[46;1;46m        🔰 AKUN PPTP 🔰           \E[0m"   | tee -a /etc/log-create-user.log
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo ""
echo "A client with the specified name was already created, please choose another name."
echo ""
read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"
            
l2tppmenu
fi
done
read -p "Password: " VPN_PASSWORD
read -p "Expired (days): " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" pptpd "$VPN_PASSWORD" *
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets*
echo -e "### $VPN_USER $exp">>"/var/lib/wisnucs/data-user-pptp"
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"  | tee -a /etc/log-create-user.log
echo -e "\E[46;1;46m        🔥 AKUN PPTP 🔥           \E[0m"   | tee -a /etc/log-create-user.log
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
echo -e "IP➡️ $PUBLIC_IP" | tee -a /etc/log-create-user.log
echo -e "DOMAIN➡️ $domain"
echo -e "Username➡️ $VPN_USER" | tee -a /etc/log-create-user.log
echo -e "Password➡️ $VPN_PASSWORD" | tee -a /etc/log-create-user.log
echo -e "Dibuat➡️ $hariini"
echo -e "Kadaluarsa➡️ $exp" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[46;1;46m    🔥LUXURY EDITION ZEROSSL🔥    \E[0m"  | tee -a /etc/log-create-user.log
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Tekan Bebas Untuk Ke Menu"
l2tppmenu
