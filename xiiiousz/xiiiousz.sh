#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh"    #colours
source "$XIIIOUSZ_HOME/bashful/ui/package/fonts.sh"      #fonts
source "$XIIIOUSZ_HOME/bashful/user/theme.sh"            #theme
source "$XIIIOUSZ_HOME/bashful/user/user_directories.sh" #user_directories
source "$XIIIOUSZ_HOME/bashful/user/user_headers.sh"     #user_headers
source "$XIIIOUSZ_HOME/bashful/user/user.sh"             #user

# ### built in: colours, theme

# Function to index xiiiousz based on package imported
xiiiousz() {
    start_timer
    clear
    small_logo
    local conditions=("$@")
    local indexed_packages=()
    local total_conditions="${#conditions[@]}"
    local current_index=0

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

        echo "${XIIIOUSZ_COLOUR_01}xiiiousz ${NC}-  $condition"
    done
    stop_timer
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
    echo "$XIIIOUSZ_HOME/bashful/user/theme.sh"
    source "$XIIIOUSZ_HOME/bashful/user/theme.sh"
}

small_logo() {
    XIIIOUSZ_COLOUR_01=${YELLOW}
    XIIIOUSZ_COLOUR_02=${WHITE}
    echo " "
    echo " "
    echo "${XIIIOUSZ_COLOUR_01}$(printf '%.0s⚡' {1..31})${NC}"
    echo "${XIIIOUSZ_COLOUR_02}$(printf '%.0s-' {1..62})${NC}"
    echo "${XIIIOUSZ_COLOUR_01} __  __  ___   ___   ___    ___    _   _   ___   ____"
    echo " \ \/ / |_ _| |_ _| |_ _|  / _ \  | | | | / __| |_  /"
    echo "  >  <   | |   | |   | |  | (_) | | |_| | \__ \  / /"
    echo " /_/\_\ |___| |___| |___|  \___/   \___/  |___/ /___|${NC}"
    echo "${XIIIOUSZ_COLOUR_02}$(printf '%.0s-' {1..62})${NC}"
    echo "${XIIIOUSZ_COLOUR_01}$(printf '%.0s⚡' {1..31})${NC}"
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

# Function to get current time in milliseconds
current_time_in_ms() {
    date +%s%N | cut -b1-13
}

# Function to start the timer
start_timer() {
    start_time=$(current_time_in_ms)
}

# Function to stop the timer and print the duration
stop_timer() {
    end_time=$(current_time_in_ms)
    duration=$((end_time - start_time))
    echo "Execution time: ${duration}ms"
}
