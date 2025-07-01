#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours
source "$XIIIOUSZ_HOME/bashful/ui/package/fonts.sh"   #fonts
# source "$XIIIOUSZ_HOME/user/theme.sh"                 #theme
# source "$XIIIOUSZ_HOME/user/user_directories.sh"      #user_directories
# source "$XIIIOUSZ_HOME/user/user.sh"                  #user
# source "$XIIIOUSZ_HOME/user/user_ui.sh"               #user-ui
# source "$XIIIOUSZ_HOME/user/user_functions.sh"        #user-functions
source "$XIIIOUSZ_HOME/bashful/utils/package/input_validator.sh" # input_validator
source "$XIIIOUSZ_HOME/bashful/ui/package/loading_animation.sh"  # loading

# ### built in: colours, theme

# Function to index xiiiousz based on package imported
xiiiousz() {
    start_timer

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
        "grepful")
            local bashful_directory="$XIIIOUSZ_HOME/grepful"
            source "$bashful_directory/index.sh"
            # indexed_package=$(get_indexed_ui)
            indexed_packages+=("$indexed_package")
            ;;
        "~")
            use_all_package
            ;;
        *)
            echo "${RED}Invalid package."
            exit 1
            ;;
        esac

        echo "${XIIIOUSZ_COLOUR_01}xiiiousz ${NC}-  $condition"

        # Import user
        import_user

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
    line_length=50 # Adjust this based on your desired line length
    GREEK_XIIIOUSZ_TEXT="ξιιιουσζ"

    # Calculate padding to center the text
    padding=$(((line_length - ${#text}) / 2))

    # Create the line with dashes and echo the text in the middle
    echo " "
    echo " "
    echo "${XIIIOUSZ_COLOUR_01}$(printf '%.0s⚡' {1..31})${NC}"
    echo "${XIIIOUSZ_COLOUR_02}$(printf '%.0s-' {1..62})${NC}"
    echo "${XIIIOUSZ_COLOUR_01} __  __  ___   ___   ___    ___    _   _   ___   ____"
    echo " \ \/ / |_ _| |_ _| |_ _|  / _ \  | | | | / __| |_  /"
    echo "  >  <   | |   | |   | |  | (_) | | |_| | \__ \  / /"
    echo " /_/\_\ |___| |___| |___|  \___/   \___/  |___/ /___|${NC}"
    echo "${XIIIOUSZ_COLOUR_02}$(printf '%.0s-' {1..62})${NC}"
    echo "$(printf "%${padding}s%s%${padding}s" " " "${XIIIOUSZ_COLOUR_01}ξιιιουσζ" " ")"
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
# current_time_in_ms() {
#     date +%s%N | cut -b1-13
# }

current_time_in_ms() {
    if command -v gdate &>/dev/null; then
        # macOS with coreutils installed via brew
        gdate +%s%3N
    elif date +%s%3N &>/dev/null; then
        # Linux with GNU date
        date +%s%3N
    else
        # macOS fallback: seconds * 1000 (no ms precision)
        echo $(($(date +%s) * 1000))
    fi
}

# Function to start the timer
start_timer() {
    start_time=$(current_time_in_ms)
}

# Function to stop the timer and print the duration
# stop_timer() {
#     end_time=$(current_time_in_ms)
#     duration=$((end_time - start_time))
#     echo "Execution time: ${duration} ms"
# }

stop_timer() {
    end_time=$(current_time_in_ms)

    # Strip any non-digit characters just in case
    start_time=${start_time//[^0-9]/}
    end_time=${end_time//[^0-9]/}

    duration=$((end_time - start_time))
    echo "Execution time: ${duration} ms"
}

use_all_package() {
    # Loop through immediate folders in the specified directory
    for folder in "$XIIIOUSZ_HOME"/*/; do
        # Check if it's a directory
        if [ -d "$folder" ]; then
            echo "Processing folder: $folder"

            # Get the basename of the folder
            basename_folder=$(basename "$folder")

            echo "Basename of the folder: $basename_folder"

            # Loop through files in the current folder
            for file in "$folder"/*; do
                # Check if the file is named "index.sh"
                if [ "$(basename "$file")" == "index.sh" ]; then
                    echo "Found index.sh in folder: $folder"

                    # Get the full path of the directory containing index.sh
                    directory_containing_indexsh=$(dirname "$file")

                    echo "Full path of the directory containing index.sh: $directory_containing_indexsh"
                    source $directory_containing_indexsh/index.sh

                    # Add your logic here for index.sh in each folder
                    # For example, you can perform operations on index.sh
                fi
            done
        fi
        echo "${XIIIOUSZ_COLOUR_01}xiiiousz ${NC}-  $basename_folder"
    done
    import_all_xiiiousz_package
}

import_all_xiiiousz_package() {
    xiiiousz_bashful "~"
}

import_user() {
    # Directory to search for .sh files
    search_directory="$XIIIOUSZ_HOME/user"

    # Use find to locate all .sh files and store them in an array
    # mapfile -t sh_files < <(find "$search_directory" -type f -name "*.sh")
    if command -v mapfile >/dev/null 2>&1; then
        # Linux/Bash 4+
        mapfile -t sh_files < <(find "$search_directory" -type f -name "*.sh")
    else
        # macOS fallback
        sh_files=()
        while IFS= read -r file; do
            sh_files+=("$file")
        done < <(find "$search_directory" -type f -name "*.sh")
    fi

    # Loop through each .sh file
    for file in "${sh_files[@]}"; do
        # Extract the basename of the file
        file_basename=$(basename "$file" .sh)
        # Import package
        source $file
        echo "${XIIIOUSZ_COLOUR_01}User:${XIIIOUSZ_COLOUR_02} $file_basename"
    done
}

update_xiiiousz_prompt() {
    local input=$(get_valid_yn_n "${XIIIOUSZ_COLOUR_01}Update XIIIOUSZ${NC}")
    if [ "$input" = "y" ]; then
        echo "${XIIIOUSZ_COLOUR_01}Updating XIIIOUSZ${NC}"
        XIIIOUSZ_PARENT=$(dirname "$XIIIOUSZ_HOME")
        git --git-dir="$XIIIOUSZ_PARENT/.git" --work-tree="$XIIIOUSZ_PARENT" pull
        enter_to_skip
        loading_animation
    else
        echo "${XIIIOUSZ_COLOUR_01}Retain Current Version${NC}"
        # enter_to_skip
        loading_animation
    fi
}
