#!/bin/bash

# Check if a variable is an array
isArray() {
    declare -p "$1" &>/dev/null && [[ "$(declare -p "$1")" =~ "declare -a" ]]
}

# Check if a variable is null
isEmpty() {
    [ -z "${!1}" ]
}

# Check if a variable is a string
isString() {
    [ -n "$1" ] && [ -z "${!1}" ] && [ ! "$(declare -p "$1")" =~ "declare -a" ]
}

# Check if a variable is an integer
isInteger() {
    [[ $1 =~ ^[+-]?[0-9]+$ ]]
}

# Check if a variable is a valid float
isFloat() {
    [[ $1 =~ ^[+-]?[0-9]*\.[0-9]+$ ]]
    # [[ $1 =~ ^[0-9]+\.[0-9]+$ ]]
}

# Check if a variable is a boolean (true/false)
isBoolean() {
    [[ "$1" =~ ^[Tt]rue$|^[Ff]alse$ ]]
}

# Check if a path is a directory
isDirectory() {
    [[ -d "$1" ]]
}

# Check if a path is a file
isFile() {
    [[ -f "$1" ]]
}

# Check if a string is a valid email address
isEmail() {
    local email_regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
    [[ "$1" =~ $email_regex ]]
}

# -- Example usage
# arr=("element1" "element2")
# str="Hello, World!"
# emptyVar=
# integerVar=123
# floatVar=334
# booleanVar="true"
# directoryPath="/home/musz"
# filePath="/home/musz/Documents/GitHub/iMocha/Mobilelife/bash-script/optimistic-locking/optimistic-locking.sh"
# email="user@example.com"

# if isArray arr; then
#     echo "arr is an array"
# else
#     echo "arr is not an array"
# fi

# if isEmpty emptyVar; then
#     echo "emptyVar is empty"
# else
#     echo "emptyVar is not empty"
# fi

# if isString str; then
#     echo "str is a string"
# else
#     echo "str is not a string"
# fi

# if isInteger $integerVar; then
#     echo "integerVar is an integer"
# else
#     echo "integerVar is not an integer"
# fi

# if isFloat $floatVar; then
#     echo "floatVar is a float"
# else
#     echo "floatVar is not a float"
# fi

# if isBoolean "$booleanVar"; then
#     echo "booleanVar is a boolean"
# else
#     echo "booleanVar is not a boolean"
# fi

# if isDirectory "$directoryPath"; then
#     echo "$directoryPath is a directory"
# else
#     echo "$directoryPath is not a directory"
# fi

# if isFile "$filePath"; then
#     echo "$filePath is a file"
# else
#     echo "$filePath is not a file"
# fi

# if isEmail "$email"; then
#     echo "$email is a valid email address"
# else
#     echo "$email is not a valid email address"
# fi
