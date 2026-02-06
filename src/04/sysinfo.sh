#!/bin/bash

get_systeminfo(){
HOSTNAME=$(hostname)
TIMEZONE=$(cat /etc/timezone) 
UTC_OFFSET=$(date +%z | sed 's/00$//; s/^\(.\{3\}\)/\1:/')  
UTC_OFFSET_NUM=$(date +%z | sed 's/00$//') 

tz=$(date +%z)             
UTC_OFFSET=$(( ${tz:0:3} / 1 ))

TIMEZONE="$TIMEZONE UTC $UTC_OFFSET_NUM"
USER=$USER
OS=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d \")
DATE=$(date +"%d %B %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | cut -d. -f1)
IP=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n '2p')
CIDR_MASK=$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | cut -d/ -f2 | head -n1)
if [ ! -z "$CIDR_MASK" ]; then
  MASK=$((0xFFFFFFFF ^ ((1 << (32 - $CIDR_MASK)) - 1)))
  MASK=$(printf "%d.%d.%d.%d" $((MASK >> 24 & 255)) $((MASK >> 16 & 255)) $((MASK >> 8 & 255)) $((MASK & 255)))
else
  MASK="Not found"
fi
GATEWAY=$(ip route | grep default | awk '{print $3}' | head -n1)
RAM_TOTAL=$(free -b | awk '/Mem:/ {printf "%.3f GB", $2/1024/1024/1024}')
RAM_USED=$(free -b | awk '/Mem:/ {printf "%.3f GB", $3/1024/1024/1024}')
RAM_FREE=$(free -b | awk '/Mem:/ {printf "%.3f GB", $7/1024/1024/1024}')
SPACE_ROOT=$(df -BM / | tail -1 | awk '{printf "%.2f MB", $2}')
SPACE_ROOT_USED=$(df -BM / | tail -1 | awk '{printf "%.2f MB", $3}')
SPACE_ROOT_FREE=$(df -BM / | tail -1 | awk '{printf "%.2f MB", $4}')


}