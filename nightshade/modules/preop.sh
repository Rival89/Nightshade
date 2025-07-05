#!/usr/bin/env bash

change_mac() {
    iface=$(gum input --placeholder "Interface (e.g., wlan0)")
    [ -z "$iface" ] && { echo "No interface provided"; return; }
    newmac=$(gum input --placeholder "Random if blank")
    if [ -z "$newmac" ]; then
        sudo macchanger -r "$iface"
    else
        sudo macchanger -m "$newmac" "$iface"
    fi
    gum confirm "Press Enter to continue" >/dev/null
}

show_ip() {
    hostname -I | gum format
    gum confirm "Press Enter to continue" >/dev/null
}

preop_menu() {
    while true; do
        choice=$(gum choose "Change MAC" "My IP" "Back")
        case "$choice" in
            "Change MAC") change_mac ;;
            "My IP") show_ip ;;
            "Back") break ;;
        esac
    done
}
