#!/bin/bash

function common_title() {
    local title=$1
    shift
    local options=("$@")

    echo " "
    echo " "
    echo "${COLOUR_01}$title ${COLOUR_01}${COLOUR_DEFAULT}"
}
