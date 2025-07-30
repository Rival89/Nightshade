#!/usr/bin/env bash
# Nightshade - a modular bash framework for penetration testing

MODULE_DIR="$(dirname "$0")/modules"
LOG_DIR="$(dirname "$0")/logs"
TEMP_DIR="$(dirname "$0")/temp"

# Ensure required directories exist
mkdir -p "$LOG_DIR" "$TEMP_DIR"

# Source all module scripts
for mod in "$MODULE_DIR"/*.sh; do
  [ -f "$mod" ] && source "$mod"
done

# Verify script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "[!] Nightshade should be run as root." >&2
  exit 1
fi

main_menu() {
  clear
  cat <<MENU
Nightshade - Modular Pentest Framework
=====================================
1) Reconnaissance
2) Pre-Operation
3) Attack
4) Exploitation
5) Post-Exploitation
6) Evasion
0) Exit
MENU
}

while true; do
  main_menu
  read -rp "Select an option: " choice
  case $choice in
    1) recon_menu ;;
    2) preop_menu ;;
    3) attack_menu ;;
    4) exploitation_menu ;;
    5) postex_menu ;;
    6) evasion_menu ;;
    0) echo "Goodbye."; exit 0 ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
  echo
done

