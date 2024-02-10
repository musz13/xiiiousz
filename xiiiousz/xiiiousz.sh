#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours
source "$XIIIOUSZ_HOME/bashful/ui/package/fonts.sh"   #fonts
source "$XIIIOUSZ_HOME/bashful/theme.sh"              #theme

# ### built in: colours, theme

# Function to index xiiiousz based on package imported
xiiiousz_bashful() {
    local bashful_directory="$XIIIOUSZ_HOME/bashful"
    local conditions=("$@")
    local indexed_packages=()

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

        echo "${COLOUR_01}xiiiousz ${COLOUR_DEFAULT}-  $condition"
    done

    small_logo

    # Access the indexed scripts as an array
    # for package in "${indexed_packages[@]}"; do
    #     echo "Imported package: $package"
    # done
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

#!/bin/bash

small_logo() {
    echo " "
    echo " "
    echo "${COLOUR_01}$(printf '%.0s⚡' {1..31})${COLOUR_DEFAULT}"
    echo "${COLOUR_02}$(printf '%.0s-' {1..62})${COLOUR_DEFAULT}"
    echo "${COLOUR_01} __  __  ___   ___   ___    ___    _   _   ___   ____"
    echo " \ \/ / |_ _| |_ _| |_ _|  / _ \  | | | | / __| |_  /"
    echo "  >  <   | |   | |   | |  | (_) | | |_| | \__ \  / /"
    echo " /_/\_\ |___| |___| |___|  \___/   \___/  |___/ /___|${COLOUR_DEFAULT}"
    echo "${COLOUR_02}$(printf '%.0s-' {1..62})${COLOUR_DEFAULT}"
    echo "${COLOUR_01}$(printf '%.0s⚡' {1..31})${COLOUR_DEFAULT}"
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
