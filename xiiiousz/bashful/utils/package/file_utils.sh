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
