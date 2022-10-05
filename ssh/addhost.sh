#!/bin/bash
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
read -rp "Domain/Host : " -e domain
read -rp "Domain Ovpn : " -e domain2
read -rp "Domain Cf : " -e domain3
echo "IP=$domain" >>/var/lib/wisnucs/ipvps.conf
echo "IP=$domain2" >>/var/lib/wisnucs/ipvps.conf
echo "IP=$domain3" >>/var/lib/wisnucs/ipvps.conf
rm -rf /etc/xray/domain
rm -rf /etc/xray/domain2
rm -rf /etc/xray/domain3
echo $domain > /etc/xray/domain
echo $domain2 > /etc/xray/domain2
echo $domain3 > /etc/xray/domain3
setingmenu
