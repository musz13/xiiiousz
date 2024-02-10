#!/bin/bash

# Function to index xiiiousz_bashful based on package imported
xiiiousz_bashful() {
    local bashful_directory="$XIIIOUSZ_HOME/bashful"
    local conditions=("$@")
    local indexed_packages=()
    bashful_small_logo
    for condition in "${conditions[@]}"; do
        case "$condition" in
        "ui")
            source "$bashful_directory/ui/index.sh"
            # indexed_package=$(get_indexed_ui)
            indexed_packages+=("$indexed_package")
            ;;
        "utils")
            source "$bashful_directory/utils/index.sh"
            # indexed_package=$(get_indexed_utils)
            indexed_packages+=("$indexed_package")
            ;;
        "theme")
            source "$bashful_directory/theme.sh"
            # indexed_package=$(get_indexed_theme)
            indexed_packages+=("$indexed_package")
            ;;
        *)
            echo "${COLOUR_ERROR}Invalid package."
            exit 1
            ;;
        esac

        # echo "${BASHFUL_COLOUR_01}xiiiousz-bashful ${COLOUR_DEFAULT}-  $condition"
    done
    echo "${BASHFUL_COLOUR_01}BASHFUL Imported Successfully ${COLOUR_DEFAULT}"

}

bashful_small_logo() {
    BASHFUL_COLOUR_01=${YELLOW}
    BASHFUL_COLOUR_02=${WHITE}
    echo "${BOLD}${BASHFUL_COLOUR_01}  _        __      _        "
    echo " |_)  /\\  (_  |_| |_ | | |  "
    echo " |_) /--\\ __) | | |  |_| |_ "
    echo "                            ${NC}${RESET_FONTS}"

}
