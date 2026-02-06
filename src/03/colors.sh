#!/bin/bash

RESET='\033[0m'

declare -A BG
BG[1]='\033[47m'
BG[2]='\033[41m'
BG[3]='\033[42m'
BG[4]='\033[44m'
BG[5]='\033[45m'   
BG[6]='\033[40m' 

declare -A FG
FG[1]='\033[97m'
FG[2]='\033[91m'
FG[3]='\033[92m'
FG[4]='\033[94m'
FG[5]='\033[95m'
FG[6]='\033[30m'

same_color() {
    local bg="$1"
    local fg="$2"
    [ "$bg" -eq "$fg" ]
}

get_color_pair() {
    local bg_num="$1"
    local fg_num="$2"
    echo -n "${BG[$bg_num]}${FG[$fg_num]}"
}