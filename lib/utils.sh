#!/bin/bash

# Utility functions for the Nightshade framework
# Kayleigh Lennox

# Source the colors script
source lib/colors.sh

# Function to print the main banner
# TODO: Create a more stylish banner
print_banner() {
    echo -e "${BBlue}====================================================${Color_Off}"
    echo -e "${BBlue}      _   __     __         __  __  __           __  ${Color_Off}"
    echo -e "${BBlue}     / | / /__  / /________/ / / / / /___ ______/ /_ ${Color_Off}"
    echo -e "${BBlue}    /  |/ / _ \\/ / ___/ __  / / / / / __ \`/ ___/ __/ ${Color_Off}"
    echo -e "${BBlue}   / /|  /  __/ / /__/ /_/ / / /_/ / /_/ / /  / /_   ${Color_Off}"
    echo -e "${BBlue}  /_/ |_/\\___/_/\\___/\\__,_/  \\____/ .___/_/   \\__/   ${Color_Off}"
    echo -e "${BBlue}                               /_/                  ${Color_Off}"
    echo -e "${BBlue}====================================================${Color_Off}"
    echo -e "${BCyan}       A modern bash script framework for Kali      ${Color_Off}"
    echo -e "${BCyan}                   by Kayleigh Lennox               ${Color_Off}"
    echo -e "${BBlue}====================================================${Color_Off}"
}

# Function to print a generic menu
# Arguments:
#   $1: Menu title
#   $@: Menu options
print_menu() {
    local title="$1"
    shift
    local options=("$@")

    echo -e "\n${BBlue}--- ${title} ---${Color_Off}"
    for i in "${!options[@]}"; do
        echo -e "  ${BYellow}[$((i+1))]${Color_Off} ${options[$i]}"
    done
    echo -e "  ${BYellow}[0]${Color_Off} Back to Main Menu"
    echo -e "${BBlue}--------------------${Color_Off}"
}

# Function to print an error message
print_error() {
    echo -e "${BRed}[-] ERROR: $1${Color_Off}"
}

# Function to print a success message
print_success() {
    echo -e "${BGreen}[+] SUCCESS: $1${Color_Off}"
}

# Function to print an informational message
print_info() {
    echo -e "${BBlue}[*] INFO: $1${Color_Off}"
}
