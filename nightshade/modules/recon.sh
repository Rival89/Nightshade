#!/usr/bin/env bash

gather_domain() {
    domain=$(gum input --placeholder "example.com")
    [ -z "$domain" ] && { echo "No domain provided"; return; }
    echo "[+] Running whois on $domain" | gum format
    whois "$domain" | head -n 20
    gum confirm "Press Enter to continue" >/dev/null
}

scan_network() {
    range=$(gum input --placeholder "Network range (192.168.1.0/24)")
    [ -z "$range" ] && { echo "No range provided"; return; }
    echo "[+] Scanning $range" | gum format
    sudo nmap -F "$range"
    gum confirm "Press Enter to continue" >/dev/null
}

recon_menu() {
    while true; do
        choice=$(gum choose "Gather Intel" "Scan Network" "Back")
        case "$choice" in
            "Gather Intel") gather_domain ;;
            "Scan Network") scan_network ;;
            "Back") break ;;
        esac
    done
}
