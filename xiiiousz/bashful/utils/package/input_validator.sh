#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours

# Function to get a valid directory
# example: directory=$(get_valid_directory "${BLUE}Enter Directory")
function get_valid_directory() {
    local prompt=$1
    while true; do
        read -p "$prompt (or '0' to exit): ${NC}" dir

        if [ "$dir" = "0" ]; then
            echo "$PWD"
            break
        fi

        if [ -d "$dir" ]; then
            echo "$dir"
            break
        fi
    done
}

# example: input_1=$(required_input "${BLUE}Input ME")
function required_input() {
    local prompt=$1
    while true; do
        read -p "$prompt : ${NC}" input

        if [ -n "$input" ]; then
            echo "$input"
            break
        fi
    done
}

# Function to get a valid y/n input
# example: result=$(get_valid_yn "${BLUE} yes or no ?")
function get_valid_yn() {
    local prompt=$1
    local valid_responses=("y" "n" "yes" "no")
    local response

    while true; do
        read -p "$prompt ${NC} (y/n): " response

        # Convert the response to lowercase
        response="${response,,}"

        # Map "yes" to "y" and "no" to "n"
        case $response in
        "yes") response="y" ;;
        "no") response="n" ;;
        esac

        if [[ " ${valid_responses[@]} " =~ " $response " ]]; then
            break
        fi
    done

    echo $response
}
