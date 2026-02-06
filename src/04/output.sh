#!/bin/bash

print_systeminfo() {
    local bg_names=$1   fg_names=$2
    local bg_values=$3  fg_values=$4

    local name_color="${BG[$bg_names]}${FG[$fg_names]}"
    local value_color="${BG[$bg_values]}${FG[$fg_values]}"

    echo -e "${name_color}HOSTNAME          ${RESET} = ${value_color}${HOSTNAME}${RESET}"
    echo -e "${name_color}TIMEZONE         ${RESET} = ${value_color}${TIMEZONE}${RESET}"
    echo -e "${name_color}USER             ${RESET} = ${value_color}${USER}${RESET}"
    echo -e "${name_color}OS               ${RESET} = ${value_color}${OS}${RESET}"
    echo -e "${name_color}DATE             ${RESET} = ${value_color}${DATE}${RESET}"
    echo -e "${name_color}UPTIME           ${RESET} = ${value_color}${UPTIME}${RESET}"
    echo -e "${name_color}UPTIME_SEC       ${RESET} = ${value_color}${UPTIME_SEC}${RESET}"
    echo -e "${name_color}IP               ${RESET} = ${value_color}${IP}${RESET}"
    echo -e "${name_color}MASK             ${RESET} = ${value_color}${MASK}${RESET}"
    echo -e "${name_color}GATEWAY          ${RESET} = ${value_color}${GATEWAY}${RESET}"
    echo -e "${name_color}RAM_TOTAL        ${RESET} = ${value_color}${RAM_TOTAL}${RESET}"
    echo -e "${name_color}RAM_USED         ${RESET} = ${value_color}${RAM_USED}${RESET}"
    echo -e "${name_color}RAM_FREE         ${RESET} = ${value_color}${RAM_FREE}${RESET}"
    echo -e "${name_color}SPACE_ROOT       ${RESET} = ${value_color}${SPACE_ROOT}${RESET}"
    echo -e "${name_color}SPACE_ROOT_USED  ${RESET} = ${value_color}${SPACE_ROOT_USED}${RESET}"
    echo -e "${name_color}SPACE_ROOT_FREE  ${RESET} = ${value_color}${SPACE_ROOT_FREE}${RESET}"
}