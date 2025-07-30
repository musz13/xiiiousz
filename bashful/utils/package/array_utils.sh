#!/bin/bash

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
arrayPush() {
    local array=("$@")
    local newElement="$1"
    local new_array=()
    array+=("$newElement")
    new_array=$(arrayShift "${array[@]}")
    echo "${new_array[@]}"
}

# Add an element to the beginning of the array
arrayUnshift() {
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

# Check if an array contains a specific value
arrayCIncludes() {
    local value="$1"
    shift
    for element in "$@"; do
        if [ "$element" == "$value" ]; then
            return 0
        fi
    done
    return 1
}

# arrayToString
arrayToString() {
    local IFS=$1
    shift
    echo "$*"
}

# arrayJoin
arrayJoin() {
    local delimiter=$1
    shift
    local array=("$@")
    local joined="${array[0]}"

    for element in "${array[@]:1}"; do
        joined+="$delimiter$element"
    done

    echo "$joined"
}

# arrayConcat
arrayConcat() {
    local array1=("$@")
    local array2=("${!#}") # Get the last argument as the second array
    local result=("${array1[@]}" "${array2[@]}")
    echo "${result[@]}"
}

# arraySplice
arraySplice() {
    local start=$1
    local deleteCount=$2
    shift 2
    local array=("$@")

    # Remove elements from the array
    for ((i = start; i < start + deleteCount; i++)); do
        unset "array[i]"
    done

    # Create a new array without the unset elements
    local -a splicedArray=("${array[@]}")

    echo "${splicedArray[@]}"
}

# arraySlice
arraySlice() {
    local start=$1
    local end=$2
    shift 2
    local array=("$@")

    echo "${array[@]:start:end-start}"
}

# arrayIndexOf
arrayIndexOf() {
    local needle=$1
    shift
    local array=("$@")
    local index=-1

    for i in "${!array[@]}"; do
        if [ "${array[$i]}" == "$needle" ]; then
            index=$i
            break
        fi
    done

    echo $index
}

# arrayLastIndexOf
arrayLastIndexOf() {
    local needle=$1
    shift
    local array=("$@")
    local index=-1

    for i in "${!array[@]}"; do
        if [ "${array[$i]}" == "$needle" ]; then
            index=$i
        fi
    done

    echo $index
}

# arrayFind
arrayFind() {
    local needle=$1
    shift
    local array=("$@")

    for element in "${array[@]}"; do
        if [ "$element" == "$needle" ]; then
            echo "true"
            return
        fi
    done

    echo "false"
}

# arrayFindIndex
arrayFindIndex() {
    local target=$1
    shift
    local array=("$@")

    for i in "${!array[@]}"; do
        if [[ "${array[i]}" == "$target" ]]; then
            echo "$i"
            return
        fi
    done

    echo "-1" # Return -1 if not found
}

# arrayFindLast
arrayFindLast() {
    local target=$1
    shift
    local array=("$@")

    for i in "${!array[@]}"; do
        if [[ "${array[i]}" == "$target" ]]; then
            echo "${array[i]}"
            return
        fi
    done
}

# arrayFindLastIndex
arrayFindLastIndex() {
    local target=$1
    shift
    local array=("$@")

    for i in $(seq $((${#array[@]} - 1)) -1 0); do
        if [[ "${array[i]}" == "$target" ]]; then
            echo "$i"
            return
        fi
    done

    echo "-1" # Return -1 if not found
}

# arrayForEach
arrayForEach() {
    local callback=$1
    shift
    local array=("$@")

    for element in "${array[@]}"; do
        $callback "$element"
    done
}

# arrayMap
arrayMap() {
    local callback=$1
    shift
    local array=("$@")

    local result=()
    for element in "${array[@]}"; do
        result+=("$($callback "$element")")
    done

    echo "${result[@]}"
}

# arrayFilter
arrayFilter() {
    local callback=$1
    shift
    local array=("$@")

    local result=()
    for element in "${array[@]}"; do
        if $callback "$element"; then
            result+=("$element")
        fi
    done

    echo "${result[@]}"
}

# arrayReduce
arrayReduce() {
    local callback=$1
    local initialValue=$2
    shift 2
    local array=("$@")

    local accumulator=$initialValue
    for element in "${array[@]}"; do
        accumulator=$($callback "$accumulator" "$element")
    done

    echo "$accumulator"
}

# arrayFindElement
arrayFindElement() {
    local element=$1
    shift
    local array=("$@")
    for item in "${array[@]}"; do
        if [[ "$item" == "$element" ]]; then
            echo "$element"
            return 0 # Found
        fi
    done
    return 1 # Not found
}

arrayFindSubstring() {
    local substring=$1
    shift
    local array=("$@")
    for item in "${array[@]}"; do
        if [[ "$item" == *"$substring"* ]]; then
            echo "$item"
            return 0 # Found
        fi
    done
    return 1 # Not found
}

# -- Example usage
# myArray=("watermelon" "apple" "banana" "orange")
# myArray=()

# if arrayCIncludes "apple" "${myArray[@]}"; then
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

# addedArray=$(arrayPush "grape" "${myArray[@]}")
# echo "Array with 'grape' added: $addedArray"

# shiftAddedArray=$(arrayUnshift "kiwi" "${myArray[@]}")
# echo "Array with 'kiwi' added to the beginning: $shiftAddedArray"

# shiftedArray=$(arrayShift "${myArray[@]}")
# echo "Array with the first element removed: $shiftedArray"

# poppedArray=$(arrayPop "${myArray[@]}")
# echo "Array with the last element removed: $poppedArray"

# length=$(arrayLength "${myArray[@]}")
# echo "Array length: $length"

# arr1=("apple" "banana" "cherry")
# arr2=("date" "fig" "grape")

# echo "arrayToString: $(arrayToString ',' "${arr1[@]}")"
# echo "arrayJoin: $(arrayJoin '-' "${arr1[@]}")"
# echo "arrayConcat: $(arrayConcat "${arr1[@]}" "${arr2[@]}")"

# # arraySlice
# sliced=($(arraySlice 2 5 "${original[@]}"))
# echo "arraySlice: ${sliced[@]}"

# # arrayIndexOf
# index=$(arrayIndexOf "banana" "${original[@]}")
# echo "arrayIndexOf: $index"

# # arrayLastIndexOf
# lastIndex=$(arrayLastIndexOf "banana" "${original[@]}")
# echo "arrayLastIndexOf: $lastIndex"

# # arrayFind
# found=$(arrayFind "banana" "${original[@]}")
# echo "arrayFind: $found"

# # arrayFindElement
# found=$(arrayFindElement "banana" "${original[@]}")
# echo "arrayFindElement: $found"

# # Example usage
# original=("apple" "banana" "cherry" "date" "banana" "fig" "grape")

# # arraySplice
# spliced=($(arraySplice 2 3 "${original[@]}" "lemon" "orange" "peach" "watermelon"))
# echo "arraySplice: ${spliced[@]}"

# # arrayFindIndex
# index=$(arrayFindIndex "banana" "${original[@]}")
# echo "arrayFindIndex: $index"

# # arrayFindLast
# last=$(arrayFindLast "date" "${original[@]}")
# echo "arrayFindLast: $last"

# # arrayFindLastIndex
# lastIndex=$(arrayFindLastIndex "banana" "${original[@]}")
# echo "arrayFindLastIndex: $lastIndex"

# # arrayForEach
# arrayForEach "echo -" "${original[@]}"

# # arrayMap
# mapped=($(arrayMap "echo 'Fruit: '" "${original[@]}"))
# echo "arrayMap: ${mapped[@]}"

# * Will Add ?
# arrayFilter

# arrayReduce

# arrayEvery

# arraySome

# arrayFrom

# arrayKeys

# arrayEntries

# arraySpread
