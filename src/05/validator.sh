#!/bin/bash

validate_input() {
    local dir=$1
    if [ -z "$dir" ]; then
        echo "Usage: $0 /path/to/dir/"
        exit 1
    fi

    if [[ ! "$dir" =~ /$ ]]; then
        echo "Error: Path must end with '/'"
        exit 1
    fi

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' does not exist."
        exit 1
    fi
}