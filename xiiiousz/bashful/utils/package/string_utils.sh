#!/bin/bash

# String trim (remove leading and trailing whitespace)
stringTrim() {
    local str="$1"
    echo "$str" | awk '{$1=$1; print}'
}

# String split
stringSplit() {
    local str="$1"
    local delimiter="$2"
    IFS="$delimiter" read -ra parts <<<"$str"
    echo "${parts[@]}"
}

# String left split (get left part of string until a delimiter)
stringLeftSplit() {
    local str="$1"
    local delimiter="$2"
    echo "${str%%$delimiter*}"
}

# String right split (get right part of string after a delimiter)
stringRightSplit() {
    local str="$1"
    local delimiter="$2"
    echo "${str##*$delimiter}"
}

# Convert string to lowercase
toLowerCase() {
    local str="$1"
    echo "$str" | tr '[:upper:]' '[:lower:]'
}

# Convert string to uppercase
toUpperCase() {
    local str="$1"
    echo "$str" | tr '[:lower:]' '[:upper:]'
}

# Check if string contains a specific substring
stringContains() {
    local str="$1"
    local substring="$2"
    if [[ "$str" == *"$substring"* ]]; then
        echo "true"
        return 0
    else
        echo "false"
        return 1
    fi
}

# Check if string starts with a specific prefix
stringStartsWith() {
    local str="$1"
    local prefix="$2"
    if [[ "$str" == "$prefix"* ]]; then
        echo "true"
        return 0
    else
        echo "false"
        return 1
    fi
}

# Check if string ends with a specific suffix
stringEndsWith() {
    local str="$1"
    local suffix="$2"
    if [[ "$str" == *"$suffix" ]]; then
        echo "true"
        return 0
    else
        echo "false"
        return 1
    fi
}

# Example usage
# inputString="   Hello, World!   "
# trimmedString=$(stringTrim "$inputString")
# echo "Trimmed String: '$trimmedString'"

# splitString="apple,banana,orange"
# splitString=$(stringSplit "$splitString" ',')
# echo "String Split: $splitString"

# leftSplitString="apple:banana:orange"
# leftPart=$(stringLeftSplit "$leftSplitString" ':banana')
# echo "Left Split: '$leftPart'"

# rightSplitString="apple:banana:orange"
# rightPart=$(stringRightSplit "$rightSplitString" 'banana:')
# echo "Right Split: '$rightPart'"

# lowercaseString="Hello, World!"
# lowercaseResult=$(toLowerCase "$lowercaseString")
# echo "Lowercase: '$lowercaseResult'"

# uppercaseString="Hello, World!"
# uppercaseResult=$(toUpperCase "$uppercaseString")
# echo "Uppercase: '$uppercaseResult'"

# containsString="Hello, World!"
# substring="World"
# if [ "$(stringContains "$containsString" "$substring")" == "true" ]; then
#     echo "String contains '$substring'"
# else
#     echo "String does not contain '$substring'"
# fi

# startsWithString="Hello, World!"
# prefix="Hello"
# if [ "$(stringStartsWith "$startsWithString" "$prefix")" == "true" ]; then
#     echo "String starts with '$prefix'"
# else
#     echo "String does not start with '$prefix'"
# fi

# endsWithString="Hello, World!"
# suffix="World!"
# if [ "$(stringEndsWith "$endsWithString" "$suffix")" == "true" ]; then
#     echo "String ends with '$suffix'"
# else
#     echo "String does not end with '$suffix'"
# fi
