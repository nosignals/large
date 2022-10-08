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
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/gajol)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e "=================================="
echo -e "       Status Autokill $sts       "
echo -e "=================================="
echo -e "1. AutoKill Setiap 5 Minutes"
echo -e "2. AutoKill Setiap 10 Minutes"
echo -e "3. AutoKill Setiap 15 Minutes"
echo -e "4. Matikan AutoKill/MultiLogin"
echo -e "5. Keluar"
echo -e "=================================="                                                                                                          
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
read -p "Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/gajol
                echo "# Autokill" >>/etc/cron.d/gajol
                echo "*/5 * * * *  root /usr/bin/gajol $max" >>/etc/cron.d/gajol
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Batas MultiLogin   : $max"
                echo -e "      AutoKill Setiap    : 5 Minutes"      
                echo -e ""
                echo -e "======================================"                                                                                                                                 
                exit                                                                  
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/gajol
                echo "# Autokill" >>/etc/cron.d/gajol
                echo "*/10 * * * *  root /usr/bin/gajol $max" >>/etc/cron.d/gajol
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Batas MultiLogin    : $max"
                echo -e "      AutoKill Setiap     : 10 Minutes"
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/gajol
                echo "# Autokill" >>/etc/cron.d/gajol
                echo "*/15 * * * *  root /usr/bin/gajol $max" >>/etc/cron.d/gajol
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Batas MultiLogin :   $max"
                echo -e "      AutoKill Setiap     : 15 Minutes"
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                4)
                clear
                echo > /etc/cron.d/gajol
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      AutoKill MultiLogin Turned Off  "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
