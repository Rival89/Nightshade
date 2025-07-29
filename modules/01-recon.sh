#!/bin/bash

# Module for Reconnaissance tools
# Kayleigh Lennox

# Source the utility functions
source lib/utils.sh

# Menu for Reconnaissance
recon_menu() {
    local options=("Nmap" "Dirb" "Nikto")
    print_menu "Reconnaissance" "${options[@]}"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Running Nmap..."
            # TODO: Add Nmap functionality
            ;;
        2)
            echo "Running Dirb..."
            # TODO: Add Dirb functionality
            ;;
        3)
            echo "Running Nikto..."
            # TODO: Add Nikto functionality
            ;;
        0)
            return
            ;;
        *)
            print_error "Invalid option"
            ;;
    esac
}
