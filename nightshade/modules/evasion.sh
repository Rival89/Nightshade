#!/usr/bin/env bash
# Evasion module

evasion_menu() {
  clear
  cat <<MENU
[ Evasion ]
1) Clear Bash History
0) Back
MENU
  read -rp "Choose: " evasion_choice
  case $evasion_choice in
    1) evasion_clear_history ;;
    0) return ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
}

evasion_clear_history() {
  echo "Clearing bash history..."
  history -c
  rm -f ~/.bash_history
  read -rp "Press enter to continue" _
}
