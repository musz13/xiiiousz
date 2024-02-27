#!/bin/bash

user_headers() {
    clear
    echo " "
    echo " "
    echo "${COLOUR_01}$(printf '%.0s⚡' {1..31})${COLOUR_DEFAULT}"
    echo "${COLOUR_02}$(printf '%.0s-' {1..62})${COLOUR_DEFAULT}"
    echo "${COLOUR_01} __  __  ___   ___   ___    ___    _   _   ___   ____"
    echo " \ \/ / |_ _| |_ _| |_ _|  / _ \  | | | | / __| |_  /"
    echo "  >  <   | |   | |   | |  | (_) | | |_| | \__ \  / /"
    echo " /_/\_\ |___| |___| |___|  \___/   \___/  |___/ /___|${COLOUR_DEFAULT}"
    echo "${COLOUR_02}$(printf '%.0s-' {1..62})${COLOUR_DEFAULT}"
    echo "${COLOUR_01}$(printf '%.0s⚡' {1..31})${COLOUR_DEFAULT}"
    echo " "
    echo " "
}

ibs_header() {
    grails_operation=$1
}

rib_header() {
    grails_operation=$1
}

bo_header() {
    grails_operation=$1
}
