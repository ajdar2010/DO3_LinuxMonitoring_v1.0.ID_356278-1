#!/bin/bash

# Засекаем время
START_TIME=$(date +%s.%N)

# Определяем путь к папке со скриптами
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$BASE_DIR"

# Подключаем модули
source "$SRC_DIR/validator.sh"
source "$SRC_DIR/stats.sh"
source "$SRC_DIR/tops.sh"
source "$SRC_DIR/utils.sh"

# Выполняем логику
TARGET=$1
validate_input "$TARGET"

get_general_stats1 "$TARGET"
get_top_folders "$TARGET"
get_general_stats2 "$TARGET"
get_file_types "$TARGET"
echo ""
get_top_files "$TARGET"
echo ""
get_top_executables "$TARGET"
echo ""
print_time "$START_TIME"