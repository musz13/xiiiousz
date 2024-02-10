#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours
source "$XIIIOUSZ_HOME/bashful/ui/package/fonts.sh"   #fonts
source "$XIIIOUSZ_HOME/bashful/theme.sh"              #theme

# ### built in: colours, theme

# Function to index xiiiousz based on package imported
xiiiousz() {
    clear
    small_logo
    local conditions=("$@")
    local indexed_packages=()

    for condition in "${conditions[@]}"; do
        case "$condition" in
        "bashful")
            local bashful_directory="$XIIIOUSZ_HOME/bashful"
            source "$bashful_directory/index.sh"
            # indexed_package=$(get_indexed_ui)
            indexed_packages+=("$indexed_package")
            ;;
        *)
            echo "${RED}Invalid package."
            exit 1
            ;;
        esac

        echo "${XIIIOUSZ_COLOUR_01}xiiiousz ${COLOUR_DEFAULT}-  $condition"
    done
}

# import test
get_indexed_ui() {
    echo "$XIIIOUSZ_HOME/bashful/ui/index.sh"
    source "$XIIIOUSZ_HOME/bashful/ui/index.sh"
}

get_indexed_utils() {
    echo "$XIIIOUSZ_HOME/bashful/utils/index.sh"
    source "$XIIIOUSZ_HOME/bashful/utils/index.sh"
}

get_indexed_theme() {
    echo "$XIIIOUSZ_HOME/bashful/theme.sh"
    source "$XIIIOUSZ_HOME/bashful/theme.sh"
}

small_logo() {
    XIIIOUSZ_COLOUR_01=${YELLOW}
    XIIIOUSZ_COLOUR_02=${WHITE}
    echo " "
    echo " "
    echo "${XIIIOUSZ_COLOUR_01}$(printf '%.0s⚡' {1..31})${COLOUR_DEFAULT}"
    echo "${XIIIOUSZ_COLOUR_02}$(printf '%.0s-' {1..62})${COLOUR_DEFAULT}"
    echo "${XIIIOUSZ_COLOUR_01} __  __  ___   ___   ___    ___    _   _   ___   ____"
    echo " \ \/ / |_ _| |_ _| |_ _|  / _ \  | | | | / __| |_  /"
    echo "  >  <   | |   | |   | |  | (_) | | |_| | \__ \  / /"
    echo " /_/\_\ |___| |___| |___|  \___/   \___/  |___/ /___|${COLOUR_DEFAULT}"
    echo "${XIIIOUSZ_COLOUR_02}$(printf '%.0s-' {1..62})${COLOUR_DEFAULT}"
    echo "${XIIIOUSZ_COLOUR_01}$(printf '%.0s⚡' {1..31})${COLOUR_DEFAULT}"
    echo " "
    echo " "
}

# ### other built in
hide_cursor() {
    tput civis # Hide the cursor
}

show_cursor() {
    tput cnorm # Show the cursor
}
