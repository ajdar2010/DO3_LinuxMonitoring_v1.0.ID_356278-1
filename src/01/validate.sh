#!/usr/bin/env bash

ensure_exact_args() {
  local expected=$1
  shift
  local actual=$#

  if (( actual > 0 )); then
        shift
  fi

  if [[ $actual -ne $expected ]]; then
    printf "Expected %d argument(s), got %d\n" "$expected" "$actual"
    exit 1
  fi
}

is_integer() {
    local str="$1"
    [[ "$str" =~ ^-?[0-9]+$ ]]
}

