#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours

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
        *)
            echo "${RED}Invalid package."
            exit 1
            ;;
        esac

        echo "${YELLOW}xiiiousz ${NC}- $condition"
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

#!/bin/bash

small_logo() {
    echo "${YELLOW}$(printf '%.0s⚡' {1..31})${NC}"
    echo "${WHITE}$(printf '%.0s-' {1..62})${NC}"
    echo "${YELLOW} __  __  ___   ___   ___    ___    _   _   ___   ____"
    echo " \ \/ / |_ _| |_ _| |_ _|  / _ \  | | | | / __| |_  /"
    echo "  >  <   | |   | |   | |  | (_) | | |_| | \__ \  / /"
    echo " /_/\_\ |___| |___| |___|  \___/   \___/  |___/ /___|${NC}"
    echo "${WHITE}$(printf '%.0s-' {1..62})${NC}"
    echo "${YELLOW}$(printf '%.0s⚡' {1..31})${NC}"
}
