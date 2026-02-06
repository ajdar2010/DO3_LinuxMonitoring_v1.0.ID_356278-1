#!/bin/bash

get_general_stats() {
    local dir=$1
    echo "Total number of folders = $(find "$dir" -type d | wc -l)"
    echo "Total number of files = $(find "$dir" -type f | wc -l)"
}

get_file_types() {
    local dir=$1
    echo "Number of:"
    echo "  Conf files: $(find "$dir" -type f -name "*.conf" | wc -l)"
    echo "  Text files: $(find "$dir" -type f -exec file {} + | grep -c "text")"
    echo "  Exec files: $(find "$dir" -type f -executable | wc -l)"
    echo "  Log files:  $(find "$dir" -type f -name "*.log" | wc -l)"
    echo "  Archives:   $(find "$dir" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) | wc -l)"
    echo "  Links:      $(find "$dir" -type l | wc -l)"
}