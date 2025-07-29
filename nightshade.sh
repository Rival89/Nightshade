#!/bin/bash

# Main script for the Nightshade framework
# Author: Kayleigh Lennox

# This script will be the main entry point for the framework.
# It will source utility functions, display a main menu, and handle user input.

# Source utility functions
source lib/utils.sh

# --- Main Menu ---
main_menu() {
    clear
    print_banner

    # Find modules and create menu options
    local modules=()
    local module_display_names=()
    for module_file in modules/*.sh; do
        if [[ -f "$module_file" ]]; then
            modules+=("$module_file")
            # Format for display (e.g., 01-recon -> Recon)
            local module_name
            module_name=$(basename "$module_file" .sh)
            module_name=${module_name#*-}
            module_name=${module_name^} # Capitalize first letter
            module_display_names+=("$module_name")
        fi
    done

    echo -e "\n${BBlue}--- Main Menu ---${Color_Off}"
    for i in "${!module_display_names[@]}"; do
        echo -e "  ${BYellow}[$((i+1))]${Color_Off} ${module_display_names[$i]}"
    done
    echo -e "  ${BYellow}[0]${Color_Off} Exit"
    echo -e "${BBlue}-----------------${Color_Off}"

    read -p "Enter your choice: " choice

    if [[ "$choice" -gt 0 && "$choice" -le "${#modules[@]}" ]]; then
        local selected_module_file=${modules[$((choice-1))]}
        # e.g. modules/01-recon.sh -> recon_menu
        local menu_function_name
        menu_function_name=$(basename "$selected_module_file" .sh)
        menu_function_name=${menu_function_name#*-}
        menu_function_name="${menu_function_name}_menu"

        # Source the module and call its menu function
        source "$selected_module_file"
        $menu_function_name
    elif [[ "$choice" == "0" ]]; then
        echo "Exiting Nightshade. Goodbye!"
        exit 0
    else
        print_error "Invalid option"
        sleep 1
    fi
}

# --- Main Loop ---
while true; do
    main_menu
    read -n 1 -s -r -p "Press any key to return to the main menu..."
done
