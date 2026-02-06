#!/bin/bash

set -euo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/output.sh"
source "$SCRIPT_DIR/validate.sh"


main() {

    ensure_exact_args 1 "$@"

    local param="$1"

    if is_integer "$param"; then
        print_error "incorrect usage - arg must not be a number"
        exit 1
    fi

    print_info "$param"
}

main "$@"








qq(){
if [ $# -ne 1 ]; then
    echo "Usage $0 [arg1]"
    exit 1
fi

if [[ "$1" =~ ^-?[0-9]+$ ]]; then
    echo "Error: incorrect usage - arg must not be a number"
    exit 1
else
    echo "$1"
fi
}