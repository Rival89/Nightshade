#!/usr/bin/env bash
# Post-Exploitation module

postex_menu() {
  clear
  cat <<MENU
[ Post-Exploitation ]
1) Gather System Info
0) Back
MENU
  read -rp "Choose: " post_choice
  case $post_choice in
    1) postex_sysinfo ;;
    0) return ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
}

postex_sysinfo() {
  echo "Collecting system info..."
  uname -a | tee "$LOG_DIR/sysinfo.log"
  read -rp "Press enter to continue" _
}
