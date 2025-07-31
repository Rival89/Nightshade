#!/usr/bin/env bash
set -euo pipefail

# Toolbox module for installing and launching common tools

run_tool() {
  local cmd=$1
  local pkg=${2:-$1}
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "[*] Installing $pkg..."
    apt-get update >/dev/null
    if ! apt-get install -y "$pkg"; then
      echo "[!] Failed to install $pkg" >&2
      read -rp "Press enter to continue" _
      return 1
    fi
  fi
  echo "[*] Launching $cmd..."
  "$cmd"
  read -rp "Press enter to continue" _
}

recon_tools_menu() {
  clear
  cat <<MENU
[ Recon / OSINT ]
1) amass
2) subfinder
3) assetfinder
4) masscan
5) rustscan
6) nmap
7) shodan
8) trufflehog
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) run_tool amass amass ;;
    2) run_tool subfinder subfinder ;;
    3) run_tool assetfinder assetfinder ;;
    4) run_tool masscan masscan ;;
    5) run_tool rustscan rustscan ;;
    6) run_tool nmap nmap ;;
    7) run_tool shodan shodan ;;
    8) run_tool trufflehog trufflehog ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}

web_enum_menu() {
  clear
  cat <<MENU
[ Web Enumeration ]
1) ffuf
2) dirsearch
3) httpx
4) nuclei
5) katana
6) gf
7) gg
8) dalfox
9) wpscan
10) joomscan
11) nikto
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) run_tool ffuf ffuf ;;
    2) run_tool dirsearch dirsearch ;;
    3) run_tool httpx httpx ;;
    4) run_tool nuclei nuclei ;;
    5) run_tool katana katana ;;
    6) run_tool gf gf ;;
    7) run_tool gg gg ;;
    8) run_tool dalfox dalfox ;;
    9) run_tool wpscan wpscan ;;
    10) run_tool joomscan joomscan ;;
    11) run_tool nikto nikto ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}

cred_attack_menu() {
  clear
  cat <<MENU
[ Credential & Auth Attacks ]
1) crackmapexec
2) impacket
3) kerbrute
4) hashcat
5) john
6) spraykatz
7) brutespray
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) run_tool crackmapexec crackmapexec ;;
    2) run_tool impacket-scripts impacket-scripts ;;
    3) run_tool kerbrute kerbrute ;;
    4) run_tool hashcat hashcat ;;
    5) run_tool john john ;;
    6) run_tool spraykatz spraykatz ;;
    7) run_tool brutespray brutespray ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}

exploitation_c2_menu() {
  clear
  cat <<MENU
[ Exploitation & C2 ]
1) metasploit-framework
2) cobaltstrike
3) sliver
4) mythic
5) havoc
6) evil-winrm
7) chisel
8) frp
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) run_tool msfconsole metasploit-framework ;;
    2)
      echo "[!] Install Cobalt Strike manually"
      /opt/cobaltstrike/cobaltstrike || true
      read -rp "Press enter to continue" _
      ;;
    3) run_tool sliver sliver ;;
    4)
      echo "[!] Install Mythic manually"
      mythic || true
      read -rp "Press enter to continue" _
      ;;
    5)
      echo "[!] Install Havoc manually"
      havoc || true
      read -rp "Press enter to continue" _
      ;;
    6) run_tool evil-winrm evil-winrm ;;
    7) run_tool chisel chisel ;;
    8) run_tool frpc frp ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}

privesc_menu() {
  clear
  cat <<MENU
[ Privilege Escalation ]
1) linpeas
2) winpeas
3) les.sh
4) watson
5) beroot
6) printspoofer
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) run_tool linpeas linpeas ;;
    2) run_tool winpeas winpeas ;;
    3) run_tool les.sh les.sh ;;
    4) run_tool watson watson ;;
    5) run_tool beroot beroot ;;
    6) run_tool PrintSpoofer PrintSpoofer ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}

postex_lateral_menu() {
  clear
  cat <<MENU
[ Post-Exploitation & Lateral Movement ]
1) bloodhound-python
2) rubeus
3) responder
4) psexec.py
5) sharphound
6) lateralus-enum
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) run_tool bloodhound-python bloodhound-python ;;
    2) run_tool Rubeus Rubeus ;;
    3) run_tool responder responder ;;
    4) run_tool psexec.py impacket-scripts ;;
    5) run_tool SharpHound SharpHound ;;
    6) run_tool lateralus-enum lateralus-enum ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}

toolbox_menu() {
  clear
  cat <<MENU
[ Toolbox ]
1) Recon / OSINT
2) Web Enumeration
3) Credential Attacks
4) Exploitation & C2
5) Privilege Escalation
6) Post-Exploitation
0) Back
MENU
  read -rp "Choose: " choice
  case $choice in
    1) recon_tools_menu ;;
    2) web_enum_menu ;;
    3) cred_attack_menu ;;
    4) exploitation_c2_menu ;;
    5) privesc_menu ;;
    6) postex_lateral_menu ;;
    0) return ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
}
