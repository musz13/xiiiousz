#!/bin/bash

# Function to index xiiiousz_ui based on package imported
xiiiousz_ui() {
    local UI_DIRECTORY="$XIIIOUSZ_HOME/bashful/ui/package"
    local conditions=("$@")
    local indexed_packages=()

    for condition in "${conditions[@]}"; do
        case "$condition" in
        "colours")
            source "$UI_DIRECTORY/colours.sh"
            # indexed_package=$(get_indexed_colours)
            indexed_packages+=("$indexed_package")
            ;;
        "loading_animation")
            source "$UI_DIRECTORY/loading_animation.sh"
            # indexed_package=$(get_index_loading_animation)
            indexed_packages+=("$indexed_package")
            ;;
        "menu")
            source "$UI_DIRECTORY/menu.sh"
            indexed_package=$(get_indexed_menu)
            indexed_packages+=("$indexed_package")
            ;;
        "list")
            source "$UI_DIRECTORY/list.sh"
            indexed_package=$(get_indexed_list)
            indexed_packages+=("$indexed_package")
            ;;
        *)
            echo "Invalid package."
            exit 1
            ;;
        esac

        echo "${YELLOW}xiiiousz_ui ${NC}- imported package: $condition"
    done

    echo "${YELLOW}UI imported successfully.${NC}"

    # Access the indexed scripts as an array
    # for package in "${indexed_packages[@]}"; do
    #     echo "Imported package: $package"
    # done
}

# import test
get_indexed_colours() {
    echo "$UI_DIRECTORY/colours.sh"
}

get_indexed_loading_animation() {
    echo "$UI_DIRECTORY/loading_animation.sh"
}

get_indexed_menu() {
    echo "$UI_DIRECTORY/menu.sh"
}

get_indexed_list() {
    echo "$UI_DIRECTORY/list.sh"
}
