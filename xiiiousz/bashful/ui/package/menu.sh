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

# Function to display the styled menu
menu_02() {
    local title=$1
    local options=("$@")
    local equalSigns="="
    # local width=$(tput cols)
    local width=62
    # Calculate padding for the title
    local titleLength=${#title}
    local padding=$(((width - titleLength) / 2))

    shift

    for ((i = 1; i < width; i++)); do
        equalSigns+="="
    done

    echo " "
    echo " "
    echo "${BOLD}${COLOUR_01}${equalSigns}${RESET_FONTS}"
    # Add padding to center the title
    for ((i = 0; i < padding; i++)); do
        echo -n " "
    done
    echo "${BOLD}${COLOUR_01}${title}${RESET_FONTS}"
    echo "${BOLD}${COLOUR_01}${equalSigns}${RESET_FONTS}"
    # Display numbered menu options
    for ((i = 0; i < ${#options[@]}; i++)); do
        echo "${BOLD}${COLOUR_01}$((i + 1)). ${RESET_FONTS}${COLOUR_02}${options[i]}${COLOUR_DEFAULT}${RESET_FONTS}"

    done
    echo "${BOLD}${COLOUR_01}${equalSigns}${RESET_FONTS}"
    echo " "
    echo " "
}

menu_02_clear() {
    local title=$1
    local options=("$@")
    local equalSigns="="
    # local width=$(tput cols)
    local width=62
    # Calculate padding for the title
    local titleLength=${#title}
    local padding=$(((width - titleLength) / 2))

    shift
    clear
    for ((i = 1; i < width; i++)); do
        equalSigns+="="
    done

    echo " "
    echo " "
    echo "${BOLD}${COLOUR_01}${equalSigns}${RESET_FONTS}"
    # Add padding to center the title
    for ((i = 0; i < padding; i++)); do
        echo -n " "
    done
    echo "${BOLD}${COLOUR_01}${title}${RESET_FONTS}"
    echo "${BOLD}${COLOUR_01}${equalSigns}${RESET_FONTS}"
    # Display numbered menu options
    for ((i = 0; i < ${#options[@]}; i++)); do
        echo "${BOLD}${COLOUR_01}$((i + 1)). ${RESET_FONTS}${COLOUR_02}${options[i]}${COLOUR_DEFAULT}${RESET_FONTS}"

    done
    echo "${BOLD}${COLOUR_01}${equalSigns}${RESET_FONTS}"
    echo " "
    echo " "
}
