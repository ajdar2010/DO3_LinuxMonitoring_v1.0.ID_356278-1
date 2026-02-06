#!/bin/bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.conf"

source "$SCRIPT_DIR/colors.sh"
source "$SCRIPT_DIR/sysinfo.sh"
source "$SCRIPT_DIR/output.sh"

def_c1_bg=6
def_c1_fg=1
def_c2_bg=2
def_c2_fg=4


if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
fi

get_color_name() {
    case $1 in
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        6) echo "black" ;;
    esac
}

main() {
    C1_BG_DISPLAY=${column1_background:-"default"}
    C1_FG_DISPLAY=${column1_font_color:-"default"}
    C2_BG_DISPLAY=${column2_background:-"default"}
    C2_FG_DISPLAY=${column2_font_color:-"default"}

    V1=$([[ "$C1_BG_DISPLAY" == "default" ]] && echo "$def_c1_bg" || echo "$C1_BG_DISPLAY")
    V2=$([[ "$C1_FG_DISPLAY" == "default" ]] && echo "$def_c1_fg" || echo "$C1_FG_DISPLAY")
    V3=$([[ "$C2_BG_DISPLAY" == "default" ]] && echo "$def_c2_bg" || echo "$C2_BG_DISPLAY")
    V4=$([[ "$C2_FG_DISPLAY" == "default" ]] && echo "$def_c2_fg" || echo "$C2_FG_DISPLAY")

    if [ "$V1" -eq "$V2" ] || [ "$V3" -eq "$V4" ]; then
        echo "Error: Background and font colors match. Change config or defaults."
        exit 1
    fi

    get_systeminfo
    print_systeminfo "$V1" "$V2" "$V3" "$V4"

    echo ""
    echo "Column 1 background = $C1_BG_DISPLAY ($(get_color_name $V1))"
    echo "Column 1 font color = $C1_FG_DISPLAY ($(get_color_name $V2))"
    echo "Column 2 background = $C2_BG_DISPLAY ($(get_color_name $V3))"
    echo "Column 2 font color = $C2_FG_DISPLAY ($(get_color_name $V4))"
}

main



