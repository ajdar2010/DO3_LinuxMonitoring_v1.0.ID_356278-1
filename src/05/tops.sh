#!/bin/bash

get_top_folders() {
    echo "TOP 5 folders:"
    du -h "$1" 2>/dev/null | sort -hr | head -n 6 | tail -n +2 | awk '{print NR " - " $2 ", " $1}'
}

get_top_files() {
    echo "TOP 10 files (path, size, type):"
    find "$1" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | awk -F'/' '{
        split($NF, a, ".");
        ext = (length(a) > 1) ? a[length(a)] : "no extension";
        print NR " - " $0 ", " ext
    }' | sed 's|, /|, |'
}

get_top_executables() {
    echo "TOP 10 executable files (path, size, MD5):"
    find "$1" -type f -executable -exec du -b {} + 2>/dev/null | sort -nr | head -n 10 | while read -r size path; do
        ((i++))
        h_size=$(numfmt --to=iec "$size")
        hash=$(md5sum "$path" | awk '{print $1}')
        echo "$i - $path, $h_size, $hash"
    done
}