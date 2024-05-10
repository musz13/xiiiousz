#!/bin/bash

# Import other function
source "$XIIIOUSZ_HOME/bashful/ui/package/colours.sh" #colours
source "$XIIIOUSZ_HOME/bashful/ui/package/fonts.sh"   #fonts

# Function to get a valid directory
# example: directory=$(get_valid_directory "${BLUE}Enter Directory")
function get_valid_directory() {
    local prompt=$1
    while true; do
        read -p "$prompt (or '0' to exit): ${COLOUR_DEFAULT}" dir

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
        read -p "$prompt${COLOUR_ERROR}*${COLOUR_DEFAULT}:" input

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
        read -p "$prompt ${COLOUR_DEFAULT} (y/n): " response

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

# input (dynamic input)
# # Example usage
# # For a single input without repetition
# result=$(userInput "email" "Enter a email  (non-repeat): ")
# echo "Result: $result"

# # Example usage
# # For repeated input until "exit" is entered
# results=$(userInput "float" "Enter an float : " "true" "exit")
# echo "Results: ${results[@]}"

userInput() {
    local input_type="$1"
    local prompt="$2"
    local repeat="$3"
    local exit_value="$4"

    local valid_inputs=()
    local valid=false

    while true; do
        # Reset the valid flag for each iteration
        valid=false

        read -p "$prompt" input

        if [ "$input" == "$exit_value" ]; then
            break
        fi

        case $input_type in
        "any")
            valid=true
            ;;
        "string")
            if [[ -n "$input" ]]; then
                valid=true
            fi
            ;;
        "integer")
            if [[ "$input" =~ ^[0-9]+$ ]]; then
                valid=true
            fi
            ;;
        "float")
            # if [[ "$input" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
            if [[ "$input" =~ ^[0-9]+\.[0-9]+$ ]]; then
                valid=true
            fi
            ;;
        "boolean")
            if [[ "$input" =~ ^(true|false)$ ]]; then
                valid=true
            fi
            ;;
        "char")
            if [[ "$input" =~ ^.$ ]]; then
                valid=true
            fi
            ;;
        "email")
            local email_regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
            if [[ "$input" =~ $email_regex ]]; then
                valid=true
            fi
            ;;
        *)
            valid=false
            ;;
        esac

        if [ "$valid" == true ] && [ "$repeat" != "true" ]; then
            valid_inputs=("$input")
        elif [ "$valid" == true ] && [ "$repeat" == "true" ]; then
            valid_inputs+=("$input")
        fi

        if [ "$valid" == true ] && [ "$repeat" != "true" ]; then
            break
        fi
    done

    if [ "$repeat" != "true" ]; then
        echo "${valid_inputs[0]}"
    elif [ "$repeat" == "true" ]; then
        echo "${valid_inputs[@]}"
    fi
}

# Function to validate "y/n" input
yn_input() {
    local input_message="$1"
    local user_input
    local result

    while true; do
        read -p "$input_message" user_input
        user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]') # Convert to lowercase for case-insensitive comparison

        if [ "$user_input" == "y" ] || [ "$user_input" == "yes" ]; then
            echo "result: $result"
            result=0 # Set the result to true (0) for 'y' or 'yes'
            break    # Exit the loop
        elif [ "$user_input" == "n" ] || [ "$user_input" == "no" ]; then
            result=1 # Set the result to false (1) for 'n' or 'no'
            break    # Exit the loop
        else
            echo "Invalid input. Please enter 'y' or 'n' (or 'yes' or 'no')."
        fi
    done

    return "$result"
}

# Function to validate "y/n" input and auto yes if empty
function get_valid_yn_y() {
    local prompt=$1
    local valid_responses=("y" "n" "yes" "no")
    local response

    while true; do
        read -p "$prompt ${COLOUR_DEFAULT} (y/n or Enter as y): " response

        # Convert the response to lowercase
        response="${response,,}"

        # If response is empty, default to "yes"
        if [ -z "$response" ]; then
            response="y"
            break
        fi

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

# Function to validate "y/n" input and auto no if empty
function get_valid_yn_n() {
    local prompt=$1
    local valid_responses=("y" "n" "yes" "no")
    local response

    while true; do
        read -p "$prompt ${COLOUR_DEFAULT} (y/n or Enter as n): " response

        # Convert the response to lowercase
        response="${response,,}"

        # If response is empty, default to "yes"
        if [ -z "$response" ]; then
            response="n"
            break
        fi

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
