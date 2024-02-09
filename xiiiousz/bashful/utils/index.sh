#!/bin/bash

# Function to index xiiiousz_ui based on package imported
xiiiousz_utils() {
    local UTILS_DIRECTORY="$XIIIOUSZ_HOME/bashful/utils/package"
    local conditions=("$@")
    local indexed_packages=()

    for condition in "${conditions[@]}"; do
        case "$condition" in
        "input_validator")
            source "$UTILS_DIRECTORY/input_validator.sh"
            # indexed_package=$(get_indexed_input_validator)
            indexed_packages+=("$indexed_package")
            ;;
        *)
            echo "Invalid package."
            exit 1
            ;;
        esac
        echo "${YELLOW}xiiiousz_utils ${NC}- imported package: $condition"
    done

    echo "${YELLOW}Utils imported successfully.${NC}"
}

# import test
get_indexed_input_validator() {
    echo "$UTILS_DIRECTORY/input_validator.sh"
}
