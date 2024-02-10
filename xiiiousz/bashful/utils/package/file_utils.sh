#!/bin/bash

# Get the name of a file (full path)
fileName() {
    local filePath="$1"
    echo "$(basename "$filePath")"
}

# Get the base name of a file (without path or extension)
fileBaseName() {
    local filePath="$1"
    echo "$(basename "$filePath" | cut -d'.' -f1)"
}

# Get the extension of a file
fileExtension() {
    local filePath="$1"
    echo "$(basename "$filePath" | awk -F. '{if (NF>1) {print $NF}}')"
}

# Find a file by name in a directory
findFileByName() {
    local directory="$1"
    local fileName="$2"
    find "$directory" -type f -name "$fileName"
}

# Find files by type in a directory
findFilesByType() {
    local directory="$1"
    local fileType="$2"
    find "$directory" -type f -name "*.$fileType"
}

# file to bytes
fileToBytes() {
    local file_path="$1"
    local result=""

    if [ -f "$file_path" ]; then
        result=$(hexdump -e '16/1 "%02x "' -e '"\n"' "$file_path")
        # result=$(hexdump -e '16/1 "%02x "' -e '"\n"' "$file_path" | fold -w 76) #fold if needed
    else
        result="Error: File not found."
    fi

    echo "$result"
}

# file to hexdump
fileToHex() {
    local file_path="$1"
    local result=""

    if [ -f "$file_path" ]; then
        result=$(xxd -r -p "$file_path")
    else
        result="Error: File not found."
    fi

    echo "$result"
}

# file to base64
fileToBase64() {
    local file_path="$1"
    local result=""

    if [ -f "$file_path" ]; then
        result=$(base64 "$file_path")
    else
        result="Error: File not found."
    fi

    echo "$result"
}

# -- Example usage
# filePath="$XIIIOUSZ_HOME/bashful/utils/package/string_utils.sh"
# directory="$PWD"
# echo "File Name: $(fileName "$filePath")"
# echo "File Base Name: $(fileBaseName "$filePath")"
# echo "File Extension: $(fileExtension "$filePath")"

# directory="$XIIIOUSZ_HOME"
# fileNameToFind="index.sh"
# foundFilesByName=$(findFileByName "$directory" "$fileNameToFind")
# echo "Files found by name:"
# echo "$foundFilesByName"

# fileTypeToFind="sh"
# foundFilesByType=$(findFilesByType "$directory" "$fileTypeToFind")
# echo "Files found by type:"
# echo "$foundFilesByType"

# fileToBytes "$XIIIOUSZ_HOME/xiiiousz.sh"
# fileToHex "$XIIIOUSZ_HOME/xiiiousz.sh"
# fileToBase64 "$XIIIOUSZ_HOME/xiiiousz.sh"
