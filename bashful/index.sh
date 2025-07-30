#!/bin/bash

# Function to index xiiiousz_bashful based on package imported
xiiiousz_bashful() {
    start_timer
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
            indexed_packages+=("$indexed_package")
            ;;
        "~")
            for file in "$bashful_directory"/*/"index.sh"; do
                # echo "package: $file"

                # Extract basename and store in another variable
                baseName=$(echo "$file" | rev | cut -d'/' -f2 | rev)
                # baseName="${baseName%.sh}"
                # echo "Basename: $baseName"
                echo "${BASHFUL_COLOUR_01}BASHFUL ${NC}- imported package: $baseName"
                source "$file"
                indexed_packages+=("$indexed_package")
                for package_file in "$bashful_directory"/$baseName/"package"/*."sh"; do
                    # echo "$baseName package: $package_file"

                    # Extract basename and store in another variable
                    package_name=$(basename "$package_file")
                    package_name="${package_name%.sh}"
                    # echo "Basename: $baseName"
                    # echo "${BASHFUL_COLOUR_01}xiiiousz - bashful-$baseName ${NC}- imported package: $package_name"
                    source "$package_file"
                    indexed_packages+=("$indexed_package")
                done
            done
            ;;
        *)
            echo "${COLOUR_ERROR}Invalid package."
            exit 1
            ;;
        esac

        # echo "${BASHFUL_COLOUR_01}xiiiousz-bashful ${COLOUR_DEFAULT}-  $condition"
    done
    echo "${BASHFUL_COLOUR_01}BASHFUL Imported Successfully ${COLOUR_DEFAULT}"
    stop_timer
}

bashful_small_logo() {
    BASHFUL_COLOUR_01=${YELLOW}
    BASHFUL_COLOUR_02=${WHITE}
    echo "${BOLD}${BASHFUL_COLOUR_01}  _        __      _        "
    echo " |_)  /\\  (_  |_| |_ | | |  "
    echo " |_) /--\\ __) | | |  |_| |_ "
    echo "                            ${NC}${RESET_FONTS}"

}

bashful_mock_loading() {
    duration=0.005
    total_steps=25

    # Simulate the task with dynamic progress
    for ((step = 1; step <= total_steps; step++)); do
        # draw_dynamic_progress_bar "$step" "$total_steps"
        # number_progress "$step" "$total_steps"
        # percentage_progress "$step" "$total_steps"
        # draw_dynamic_progress_bar_number "$step" "$total_steps"
        draw_dynamic_progress_bar_percentage "$step" "$total_steps"
        sleep "$duration"
    done
    echo ""
}

bashful_line() {
    echo ""
    echo "${COLOUR_01}$(printf '%.0s-' {1..62})${NC}"
    echo ""
}
