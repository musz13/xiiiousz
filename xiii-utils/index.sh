#!/bin/bash

# Import other function
source "$XIIIOUSZ"

# xiiiousz "~"
xiiiousz "bashful"
xiiiousz_bashful "~"

clear

INDEX_DIR=$XIIIOUSZ_HOME/xiii-utils

main() {
    while true; do
        clear
        options=("LINUX-CHEATSHEETS" "Exit")
        menu_maker "[ XIII-UTILS ]" "${options[@]}"
        read -p "${COLOUR_01}Enter Project:${COLOUR_DEFAULT} " choice

        # Convert input to lowercase
        choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

        case $choice in
        1 | "linux-cheatsheets" | "linux-cs")
            echo "${COLOUR_01}MBIB : Menu${COLOUR_DEFAULT}"
            execute 1
            ;;

        2 | "e" | "exit")
            echo "Exiting..."
            loading_animation
            echo "${COLOUR_01}Exited!${COLOUR_DEFAULT}"
            exit
            ;;
        *)
            echo "Invalid choice. Please select again."
            enter_to_skip
            loading_animation
            ;;
        esac
    done
}

execute() {
    local title=$(toUpperCase "$1")
    local original_name=$1
    # while true; do
    clear
    # options=("APP" "Exit")

    # menu_maker "CBP UTILS: $title" "${options[@]}"
    # read -p "${COLOUR_01}Enter your choice:${COLOUR_DEFAULT} " choice

    # # Convert input to lowercase
    # choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

    choice=$1

    case $choice in
    1 | "linux-cheatsheets")
        echo "${COLOUR_01}LINUX-CHEATSHEETS${COLOUR_DEFAULT}"
        # chmod +x "$INDEX_DIR/package/linux-cheatsheets.sh"
        # "$INDEX_DIR/package/linux-cheatsheets.sh"

        gnome-terminal --tab --title="LINUX-CHEATSHEETS" -- bash -c "chmod +x '$INDEX_DIR/package/linux-cheatsheets.sh'; source '$INDEX_DIR/package/linux-cheatsheets.sh'; exec bash"
        ;;
    2 | "e" | "exit")
        echo "Exiting..."
        loading_animation
        return
        ;;
    *)
        echo "Invalid choice. Please select again."
        enter_to_skip
        ;;
    esac
    # done
}

# info: Main Execution
update_xiiiousz_prompt
main
