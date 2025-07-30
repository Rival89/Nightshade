#!/usr/bin/env bash
# Reconnaissance module

recon_menu() {
  clear
  cat <<MENU
[ Reconnaissance ]
1) Basic Nmap Scan
2) OS Detection
0) Back
MENU
  read -rp "Choose: " recon_choice
  case $recon_choice in
    1) recon_basic_scan ;;
    2) recon_os_detect ;;
    0) return ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
}

recon_basic_scan() {
  read -rp "Target: " target
  mkdir -p "$LOG_DIR"
  echo "Running Nmap basic scan on $target..."
  nmap -sV "$target" | tee "$LOG_DIR/recon_nmap_${target}.log"
  read -rp "Press enter to continue" _
}

recon_os_detect() {
  read -rp "Target: " target
  mkdir -p "$LOG_DIR"
  echo "Running OS detection on $target..."
  nmap -O "$target" | tee "$LOG_DIR/recon_os_${target}.log"
  read -rp "Press enter to continue" _
}
