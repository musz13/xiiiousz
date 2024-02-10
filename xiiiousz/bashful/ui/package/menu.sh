#!/bin/bash
# Import other function

# Function to display the menu
# example: simple_menu "${RED}Terminal Menu" "Option 1" "${RED}Option 2" "Option 3" "Exit"
function simple_menu() {
    local title=$1
    shift
    local options=("$@")

    echo " "
    echo " "
    echo "${COLOUR_01}========== $title ${COLOUR_01}==========${COLOUR_DEFAULT}"

    # Display numbered menu options
    for ((i = 0; i < ${#options[@]}; i++)); do
        echo "${COLOUR_01}$((i + 1)). ${COLOUR_02}${options[i]}${COLOUR_DEFAULT}"
    done

    echo "${COLOUR_01}===================================${COLOUR_DEFAULT}"
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
    echo "${COLOUR_01}========== $title ${COLOUR_01}==========${COLOUR_DEFAULT}"

    # Display numbered menu options
    for ((i = 0; i < ${#options[@]}; i++)); do
        echo "${COLOUR_01}$((i + 1)). ${COLOUR_02}${options[i]}${COLOUR_DEFAULT}"
    done

    echo "${COLOUR_01}===================================${COLOUR_DEFAULT}"
    echo " "
    echo " "
}
