#!/usr/bin/env bash
# Pre-Operation module

preop_menu() {
  clear
  cat <<MENU
[ Pre-Operation ]
1) Update System
2) Configure Workspace
0) Back
MENU
  read -rp "Choose: " preop_choice
  case $preop_choice in
    1) preop_update_system ;;
    2) preop_configure_workspace ;;
    0) return ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
}

preop_update_system() {
  echo "Updating apt packages..."
  apt-get update && apt-get upgrade -y
  read -rp "Press enter to continue" _
}

preop_configure_workspace() {
  echo "Creating workspace directories..."
  mkdir -p "$TEMP_DIR/work" "$LOG_DIR"
  read -rp "Press enter to continue" _
}
