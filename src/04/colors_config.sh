#!/bin/bash

DEFAULT_BG1=3      
DEFAULT_FG1=1      
DEFAULT_BG2=1      
DEFAULT_FG2=2      

CONFIG_FILE="${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}/colors_config.conf"

BG1=""
FG1=""
BG2=""
FG2=""

if [[ -f "$CONFIG_FILE" ]]; then
    while IFS='=' read -r key value; do
        [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
        
        key=$(echo "$key"   | xargs)
        value=$(echo "$value" | xargs)
        
        case "$key" in
            column1_background)  BG1="$value" ;;
            column1_font_color)  FG1="$value" ;;
            column2_background)  BG2="$value" ;;
            column2_font_color)  FG2="$value" ;;
        esac
    done < "$CONFIG_FILE"
fi

: "${BG1:=$DEFAULT_BG1}"
: "${FG1:=$DEFAULT_FG1}"
: "${BG2:=$DEFAULT_BG2}"
: "${FG2:=$DEFAULT_FG2}"

for var in BG1 FG1 BG2 FG2; do
    val="${!var}"
    if ! [[ "$val" =~ ^[1-6]$ ]]; then
        echo "Ошибка: некорректное значение цвета для $var = '$val'" >&2
        echo "Допустимые значения: 1..6" >&2
        exit 1
    fi
done

if (( BG1 == FG1 )); then
    echo "Ошибка: для первой колонки фон и цвет текста совпадают" >&2
    exit 1
fi

if (( BG2 == FG2 )); then
    echo "Ошибка: для второй колонки фон и цвет текста совпадают" >&2
    exit 1
fi