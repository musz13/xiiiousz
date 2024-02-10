#!/bin/bash

# Function to print a list of strings with a custom bullet character
# Example usage
# string_list=("String 1" "String 2" "String 3")

# Print with '-' as the bullet character (default)
# simple_list "" "${string_list[@]}"

# Print with '+' as the bullet character
# simple_list "+" "${string_list[@]}"

# Print with '=' as the bullet character
# simple_list "=" "${string_list[@]}"

function simple_list() {
    local bullet="${1:- -}" # Set default to '-' if not provided
    shift
    local strings=("$@")

    for string in "${strings[@]}"; do
        echo "${COLOUR_01}$bullet ${COLOUR_02}$string${COLOUR_DEFAULT}"
    done
    echo " "
}

# Function to print a list of strings with a custom bullet character
# Example usage
# simple_list "${string_list[@]}"

function number_list() {
    local strings=("$@")

    # Display numbered list
    for ((i = 0; i < ${#strings[@]}; i++)); do
        echo "${COLOUR_01}$((i + 1)). ${COLOUR_02}${strings[i]}${COLOUR_DEFAULT}"
    done

    echo " "
}
