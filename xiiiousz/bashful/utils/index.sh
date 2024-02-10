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
        "common_utils")
            source "$UTILS_DIRECTORY/common_utils.sh"
            # indexed_package=$(get_indexed_common_utils)
            indexed_packages+=("$indexed_package")
            ;;
        "array_utils")
            source "$UTILS_DIRECTORY/array_utils.sh"
            # indexed_package=$(get_indexed_array_utils)
            indexed_packages+=("$indexed_package")
            ;;
        "string_utils")
            source "$UTILS_DIRECTORY/string_utils.sh"
            # indexed_package=$(get_indexed_string_utils)
            indexed_packages+=("$indexed_package")
            ;;
        "date_utils")
            source "$UTILS_DIRECTORY/date_utils.sh"
            # indexed_package=$(get_indexed_date_utils)
            indexed_packages+=("$indexed_package")
            ;;
        "file_utils")
            source "$UTILS_DIRECTORY/file_utils.sh"
            # indexed_package=$(get_indexed_file_utils)
            indexed_packages+=("$indexed_package")
            ;;
        "others")
            source "$UTILS_DIRECTORY/others.sh"
            # indexed_package=$(get_indexed_others)
            indexed_packages+=("$indexed_package")
            ;;
        *)
            echo "${COLOUR_ERROR}Invalid package."
            exit 1
            ;;
        esac
        # echo "${BASHFUL_COLOUR_01}xiiiousz_utils ${NC}- imported package: $condition"
    done

    echo "${BASHFUL_COLOUR_01}Utils imported successfully.${NC}"
}

# import test
get_indexed_input_validator() {
    echo "$UTILS_DIRECTORY/input_validator.sh"
}

get_indexed_common_utils() {
    echo "$UTILS_DIRECTORY/common_utils.sh"
}

get_indexed_array_utils() {
    echo "$UTILS_DIRECTORY/array_utils.sh"
}

get_indexed_string_utils() {
    echo "$UTILS_DIRECTORY/string_utils.sh"
}

get_indexed_date_utils() {
    echo "$UTILS_DIRECTORY/date_utils.sh"
}

get_indexed_file_utils() {
    echo "$UTILS_DIRECTORY/file_utils.sh"
}

get_indexed_others() {
    echo "$UTILS_DIRECTORY/others.sh"
}
