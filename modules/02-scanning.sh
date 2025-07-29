#!/bin/bash

# Module for Scanning tools
# Kayleigh Lennox

# Source the utility functions
source lib/utils.sh

# Menu for Scanning
scanning_menu() {
    local options=("Nessus" "OpenVAS" "SQLmap")
    print_menu "Scanning" "${options[@]}"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Running Nessus..."
            # TODO: Add Nessus functionality
            ;;
        2)
            echo "Running OpenVAS..."
            # TODO: Add OpenVAS functionality
            ;;
        3)
            echo "Running SQLmap..."
            # TODO: Add SQLmap functionality
            ;;
        0)
            return
            ;;
        *)
            print_error "Invalid option"
            ;;
    esac
}
