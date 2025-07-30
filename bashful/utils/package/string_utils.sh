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

# stringLength
stringLength() {
    local str="$1"
    echo "${#str}"
}

# stringCharAt
stringCharAt() {
    local str="$1"
    local index="$2"
    echo "${str:index:1}"
}

# stringCharCodeAt
stringCharCodeAt() {
    local str="$1"
    local index="$2"
    local char="${str:index:1}"
    printf "%d" "'$char"
}

# stringAt
stringAt() {
    local str="$1"
    local index="$2"
    echo "${str:index:1}"
}

# stringToArray
stringToArray() {
    local str="$1"
    local -a result=($(echo "$str" | sed 's/./& /g'))
    echo "${result[@]}"
}

# stringSubstring
stringSubstring() {
    local str="$1"
    local start="$2"
    local length="$3"
    echo "${str:start:length}"
}

# stringSubstr
stringSubstr() {
    local str="$1"
    local start="$2"
    local length="$3"
    echo "${str:start:length}"
}

# stringConcat
stringConcat() {
    local str1="$1"
    local str2="$2"
    echo "$str1$str2"
}

# stringTrimStart
stringTrimStart() {
    local str="$1"
    echo "$str" | sed -e 's/^[[:space:]]*//'
}

# stringTrimEnd
stringTrimEnd() {
    local str="$1"
    echo "$str" | sed -e 's/[[:space:]]*$//'
}

# stringPadStart
stringPadStart() {
    local str="$1"
    local targetLength="$2"
    local padChar="$3"
    local padding=""

    while [ "${#padding}" -lt "$((targetLength - ${#str}))" ]; do
        padding="${padding}${padChar}"
    done

    echo "${padding}${str}"
}

# stringPadEnd
stringPadEnd() {
    local str="$1"
    local targetLength="$2"
    local padChar="$3"
    local padding=""

    while [ "${#padding}" -lt "$((targetLength - ${#str}))" ]; do
        padding="${padding}${padChar}"
    done

    echo "${str}${padding}"
}

# stringRepeat
stringRepeat() {
    local str="$1"
    local count="$2"
    printf "%0.s$str" $(seq "$count")
}

# stringReplaceAll
stringReplaceAll() {
    local str="$1"
    local search="$2"
    local replace="$3"
    echo "${str//${search}/${replace}}"
}

# -- Example usage
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

# inputString="abcdef"

# # stringLength
# length=$(stringLength "$inputString")
# echo "stringLength: $length"

# # stringCharAt
# charAt=$(stringCharAt "$inputString" 2)
# echo "stringCharAt: $charAt"

# # stringCharCodeAt
# charCodeAt=$(stringCharCodeAt "$inputString" 2)
# echo "stringCharCodeAt: $charCodeAt"

# # stringAt
# at=$(stringAt "$inputString" 3)
# echo "stringAt: $at"

# # stringToArray
# array=($(stringToArray "$inputString"))
# echo "stringToArray: ${array[@]}"

# # stringSubstring
# substring=$(stringSubstring "$inputString" 1 3)
# echo "stringSubstring: $substring"

# inputString="  abc  "
# padChar="."

# # stringSubstr
# substr=$(stringSubstr "$inputString" 2 3)
# echo "stringSubstr: $substr"

# # stringConcat
# concat=$(stringConcat "Hello, " "World!")
# echo "stringConcat: $concat"

# # stringTrim
# trimmed=$(stringTrim "$inputString")
# echo "stringTrim: '$trimmed'"

# # stringTrimStart
# trimStart=$(stringTrimStart "$inputString")
# echo "stringTrimStart: '$trimStart'"

# # stringTrimEnd
# trimEnd=$(stringTrimEnd "$inputString")
# echo "stringTrimEnd: '$trimEnd'"

# # stringPadStart
# padStart=$(stringPadStart "$inputString" 10 "$padChar")
# echo "stringPadStart: '$padStart'"

# inputString="abc"
# padChar="."

# # stringPadEnd
# padEnd=$(stringPadEnd "$inputString" 6 "$padChar")
# echo "stringPadEnd: '$padEnd'"

# # stringRepeat
# repeated=$(stringRepeat "$inputString" 3)
# echo "stringRepeat: '$repeated'"

# string2="I love cats. Cats are very easy to love. Cats are very popular."

# # stringReplaceAll
# replaceAll=$(stringReplaceAll "$string2" "Cats" "X")
# echo "stringReplaceAll: '$replaceAll'"

#  * to Add ?
# stringReplace
