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
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xvless.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xtrojan.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xvmess.json | grep '^###' | cut -d ' ' -f 2`);
data=( `cat /etc/xray/xss.json | grep '^###' | cut -d ' ' -f 2`);
echo "----------------------------------------";
echo "---------=[ shadowsocks User Login ]=---------";
echo "----------------------------------------";
for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n >/tmp/ipshadowsocks.txt
    data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
    for ip in "${data2[@]}"; do

        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >>/tmp/ipshadowsocks.txt
        else
            echo "$ip" >>/tmp/other.txt
        fi
        jum2=$(cat /tmp/ipshadowsocks.txt)
        sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
    done

    jum=$(cat /tmp/ipshadowsocks.txt)
    if [[ -z "$jum" ]]; then
        echo >/dev/null
    else
        jum2=$(cat /tmp/ipshadowsocks.txt | nl)
        echo "user : $akun"
        echo "$jum2"
        echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    fi
    rm -rf /tmp/ipshadowsocks.txt
done

rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
