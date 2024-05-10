#!/bin/bash

# Function to index xiiiousz_bashful_ui based on package imported
xiiiousz_bashful_ui() {
    start_timer
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
            # indexed_package=$(get_indexed_menu)
            indexed_packages+=("$indexed_package")
            ;;
        "list")
            source "$UI_DIRECTORY/list.sh"
            # indexed_package=$(get_indexed_list)
            indexed_packages+=("$indexed_package")
            ;;
        "progress")
            source "$UI_DIRECTORY/progress.sh"
            # indexed_package=$(get_indexed_progress)
            indexed_packages+=("$indexed_package")
            ;;
        "others")
            source "$UI_DIRECTORY/others.sh"
            # indexed_package=$(get_indexed_progress)
            indexed_packages+=("$indexed_package")
            ;;
        "~")
            for file in "$UI_DIRECTORY"/*."sh"; do
                # echo "package: $file"

                # Extract basename and store in another variable
                baseName=$(basename "$file")
                baseName="${baseName%.sh}"
                # echo "Basename: $baseName"
                echo "${BASHFUL_COLOUR_01}xiiiousz - BASHFUL ui ${NC}- imported package: $baseName"
                source "$file"
                indexed_packages+=("$indexed_package")
            done
            ;;
        *)
            echo "${COLOUR_ERROR}Invalid package."
            exit 1
            ;;
        esac

        # echo "${BASHFUL_COLOUR_01}xiiiousz - BASHFUL ui ${NC}- imported package: $condition"
    done

    echo "${BASHFUL_COLOUR_01}UI imported successfully.${NC}"

    # Access the indexed scripts as an array
    # for package in "${indexed_packages[@]}"; do
    #     echo "Imported package: $package"
    # done
    stop_timer
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

get_indexed_progress() {
    echo "$UI_DIRECTORY/progress.sh"
}
