#!/usr/bin/env bash
# Nightshade main menu

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE_DIR="$BASE_DIR/modules"

# Load modules
for mod in "$MODULE_DIR"/*.sh; do
  [ -f "$mod" ] && source "$mod"
done

# Dependency check
check_dependencies() {
    local missing=()
    command -v gum >/dev/null 2>&1 || missing+=(gum)
    if [ ${#missing[@]} -gt 0 ]; then
        echo "Installing missing dependencies: ${missing[*]}" >&2
        sudo apt-get update && sudo apt-get install -y ${missing[*]}
    fi
}

main_menu() {
    while true; do
        choice=$(gum choose --cursor.foreground 212 --header "Select an option" \
            "Pre-Op" "Recon" "Attack" "Evasion" "Exploitation" "Post-Ex" "Quit")
        case "$choice" in
            "Pre-Op") preop_menu ;;
            "Recon") recon_menu ;;
            "Attack") attack_menu ;;
            "Evasion") evasion_menu ;;
            "Exploitation") exploitation_menu ;;
            "Post-Ex") postex_menu ;;
            "Quit") break ;;
        esac
    done
}

check_dependencies
main_menu
