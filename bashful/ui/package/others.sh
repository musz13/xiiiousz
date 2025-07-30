#!/bin/bash
# Import other function

# line
# create_line_00 30 "="
# create_line_00 "" "+"
# create_line_00 "s"
create_line_00() {
    local width=${1:-62} # Default width is 62
    local symbol=${2:--} # Default symbol is '-'
    local line=""
    for ((i = 0; i < width; i++)); do
        line+="$symbol"
    done
    echo "${COLOUR_01}$line${COLOUR_DEFAULT}"
}
