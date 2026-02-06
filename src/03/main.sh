#!/bin/bash

export LC_ALL=C

set -euo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/output.sh"
source "$SCRIPT_DIR/colors.sh"
source "$SCRIPT_DIR/sysinfo.sh"

main() {
    if [ $# -ne 4 ]; then
        echo "Error" >&2
        exit 1
    fi

    for param in "$@"; do
        if ! [[ "$param" =~ ^[1-6]$ ]]; then
            echo "Error" >&2
            exit 1
        fi
    done

    if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
        echo "Error" >&2
        exit 1
    fi

    get_systeminfo
    print_systeminfo "$1" "$2" "$3" "$4"
}

main "$@"




