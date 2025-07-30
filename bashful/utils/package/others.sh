#!/bin/bash

# Generate a UUID
generateUUID() {
    uuidgen
}

# Validate a UUID
isValidUUID() {
    local uuid="$1"
    if [[ "$uuid" =~ ^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$ ]]; then
        echo "true"
        return 0
    else
        echo "false"
        return 1
    fi
}

# byte to human

# file to byte

# -- Example usage
# echo "Generated UUID: $(generateUUID)"

# uuidToValidate="550e8400-e29b-41d4-a716-446655440000"
# if [ "$(isValidUUID "$uuidToValidate")" == "true" ]; then
#     echo "Valid UUID: $uuidToValidate"
# else
#     echo "Invalid UUID: $uuidToValidate"
# fi
