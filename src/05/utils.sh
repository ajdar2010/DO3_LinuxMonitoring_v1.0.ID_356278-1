#!/bin/bash

print_time() {
    local start=$1
    local end=$(date +%s.%N)
    awk "BEGIN {print \"Script execution time = \" $end - $start \" seconds\"}"
}