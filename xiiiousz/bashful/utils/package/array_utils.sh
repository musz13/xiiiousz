#!/bin/bash

# Check if an array contains a specific value
arrayContains() {
    local value="$1"
    shift
    for element in "$@"; do
        if [ "$element" == "$value" ]; then
            return 0
        fi
    done
    return 1
}

# Check if an array is empty
arrayEmpty() {
    local array=("$@")
    if [ "${#array[@]}" -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# Reverse the order of array elements
arrayReverse() {
    local array=("$@")
    echo "${array[@]}" | awk '{ for(i=NF;i>0;i--) printf("%s ",$i); }'
}

# Sort array elements
arraySort() {
    local array=("$@")
    printf "%s " "${array[@]}" | sort
}

# Add an element to the end of the array
arrayAdd() {
    local array=("$@")
    local newElement="$1"
    local new_array=()
    array+=("$newElement")
    new_array=$(arrayShift "${array[@]}")
    echo "${new_array[@]}"
}

# Add an element to the beginning of the array
arrayShiftAdd() {
    local array=("$@")
    local newElement="$1"
    echo "${array[@]}"
}

# Transpose array elements by a given number
arrayTranspose() {
    local array=("$@")
    local transposeBy="$1"
    local length="${#array[@]}"
    local transposedArray=()

    for ((i = 0; i < length; i++)); do
        local newIndex="$((i + transposeBy))"
        newIndex=$((newIndex % length))
        transposedArray[$newIndex]="${array[$i]}"
    done

    echo "${transposedArray[@]}"
}

# Remove the first element from the array
arrayShift() {
    local array=("$@")
    array=("${array[@]:1}")
    echo "${array[@]}"
}

# Remove the last element from the array
arrayPop() {
    local array=("$@")
    unset 'array[${#array[@]}-1]'
    echo "${array[@]}"
}

# Get the length of the array
arrayLength() {
    local array=("$@")
    echo "${#array[@]}"
}

# -- Example usage
# myArray=("watermelon" "apple" "banana" "orange")
# myArray=()

# if arrayContains "apple" "${myArray[@]}"; then
#     echo "Array contains"
# else
#     echo "Array does not contain"
# fi

# if arrayEmpty "${myArray[@]}"; then
#     echo "Array is empty"
# else
#     echo "Array is not empty"
# fi

# reversedArray=$(arrayReverse "${myArray[@]}")
# echo "Reversed array: $reversedArray"

# sortedArray=$(arraySort "${myArray[@]}")
# echo "Sorted array: $sortedArray"

# addedArray=$(arrayAdd "grape" "${myArray[@]}")
# echo "Array with 'grape' added: $addedArray"

# shiftAddedArray=$(arrayShiftAdd "kiwi" "${myArray[@]}")
# echo "Array with 'kiwi' added to the beginning: $shiftAddedArray"

# shiftedArray=$(arrayShift "${myArray[@]}")
# echo "Array with the first element removed: $shiftedArray"

# poppedArray=$(arrayPop "${myArray[@]}")
# echo "Array with the last element removed: $poppedArray"

# length=$(arrayLength "${myArray[@]}")
# echo "Array length: $length"
