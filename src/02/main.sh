
#!/bin/bash
export LC_ALL=C

set -euo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/output.sh"
source "$SCRIPT_DIR/sysinfo.sh"

main() {

[ $# -eq 0 ] || {
    echo >&2
    exit 1
}

    get_systeminfo 
    print_systeminfo

read -p "Would you like to save the data to a file? (Y/N): " answer

if [[ $answer == "Y" || $answer == "y" ]]; then
  FILENAME=$(date +"%d_%m_%y_%H_%M_%S").status
  {
      print_systeminfo
  } > $FILENAME
  echo "Data saved to $FILENAME"
else
  echo "Data not saved."
fi
    
}

main "$@"



