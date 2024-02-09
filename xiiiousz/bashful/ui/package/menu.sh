#!/bin/bash
# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours

# Function to display the menu
# example: simple_menu "${RED}Terminal Menu" "Option 1" "${RED}Option 2" "Option 3" "Exit"
function simple_menu() {
    local title=$1
    shift
    local options=("$@")

    echo " "
    echo " "
    echo "${MAGENTA}========== $title ${MAGENTA}==========${NC}"

    # Display numbered menu options
    for ((i = 0; i < ${#options[@]}; i++)); do
        echo "$((i + 1)). ${options[i]}${NC}"
    done

    echo "${MAGENTA}===================================${NC}"
    echo " "
    echo " "
}

# Function to display the menu
# example: simple_menu "${RED}Terminal Menu" "Option 1" "${RED}Option 2" "Option 3" "Exit"
function simple_menu_clear() {
    local title=$1
    shift
    local options=("$@")

    clear
    echo " "
    echo " "
    echo "${MAGENTA}========== $title ${MAGENTA}==========${NC}"

    # Display numbered menu options
    for ((i = 0; i < ${#options[@]}; i++)); do
        echo "$((i + 1)). ${options[i]}${NC}"
    done

    echo "${MAGENTA}===================================${NC}"
    echo " "
    echo " "
}
