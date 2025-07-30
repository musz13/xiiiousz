#!/bin/bash

source "$XIIIOUSZ"

xiiiousz "bashful" "grepful"
xiiiousz_grepful "~"
xiiiousz_bashful "~"

clear
grepful_small_logo

# Ask the user if they want to use the current directory
read -p "${COLOUR_01}Use default directory as the source directory? (y/n):${COLOUR_02} " use_current_directory

cd "$GREPFUL_SOURCE_DIRECTORY" || exit

if [[ "$use_current_directory" == "y" || "$use_current_directory" == "Y" ]]; then
    current_directory="$GREPFUL_SOURCE_DIRECTORY"
    # current_directory="$GREPFUL_SOURCE_DIRECTORY/2024/02_February"
else
    # Get user input for the search directory
    read -p "${COLOUR_01}Enter the source directory:${COLOUR_02} " current_directory
fi

cd "$current_directory" || exit

echo "${COLOUR_01}Current source directory?:${COLOUR_02} $PWD"

while true; do
    clear
    grepful_small_logo
    # Get user input for the input string
    echo "${COLOUR_01}Current Source Directory:${COLOUR_02} $GREPFUL_SOURCE_DIRECTORY"
    read -p "${COLOUR_01}grep -raiEn (type 'e' to exit):${COLOUR_02} " input_string

    # Check if the user wants to exit
    if [[ "$input_string" == "e" ]]; then
        break
    fi
    outputFileOption=$(get_valid_yn "${COLOUR_01}Output File?:${COLOUR_02} ")

    if [[ $outputFileOption == "y" ]]; then
        # Get user input for the output filename
        read -p "${COLOUR_01}Enter the output filename:${COLOUR_02} " output_filename

        (dot_loading_animation $$) &

        echo "" >"$GREPFUL_OUTPUT_DIRECTORY/$output_filename.log"

        # Grep the input string from all files in the current directory and its subdirectories and write the results to the output file
        grep -raiEn "$input_string" . | sort -t ':' -k 2,2n >"$GREPFUL_OUTPUT_DIRECTORY/$output_filename.log"

        kill $!
        wait $! 2>/dev/null # Suppress error message when the spinner has already
        echo " "
        echo "${COLOUR_01}Output File is:${COLOUR_02} $GREPFUL_OUTPUT_DIRECTORY/$output_filename.log"
    else
        grep -raiEn "$input_string" .
    fi
    # Loading Animation
    loading_animation
    echo "${COLOUR_01}done ${COLOUR_02}"
    echo "${COLOUR_01}... ${COLOUR_02}"
    read -p "" skip
done

echo "${COLOUR_01}Exiting the script."
