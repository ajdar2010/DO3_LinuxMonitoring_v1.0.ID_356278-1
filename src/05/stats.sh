#!/bin/bash

get_general_stats1() {
    local dir=$1
    echo "Total number of folders (including all nested ones) = $(find "$dir" -type d 2>/dev/null | wc -l)"
}

get_general_stats2() {
    local dir=$1
    echo "Total number of files = $(find "$dir" -type f 2>/dev/null | wc -l)"
}

get_file_types() {
    local dir=$1
    echo "Number of:"
    echo "  Configuration files (with the .conf extension) = $(find "$dir" -type f -name "*.conf" 2>/dev/null | wc -l)"
    echo "  Text files = $(find "$dir" -type f -exec file {} + 2>/dev/null | grep -c "text")"
    echo "  Executable files = $(find "$dir" -type f -executable 2>/dev/null | wc -l)"
    echo "  Log files (with the extension .log) = $(find "$dir" -type f -name "*.log" 2>/dev/null | wc -l)"
    echo "  Archive files = $(find "$dir" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) 2>/dev/null | wc -l)"
    echo "  Symbolic links = $(find "$dir" -type l 2>/dev/null | wc -l)"
}