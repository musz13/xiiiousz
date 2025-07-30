#!/bin/bash

user_line_01() {
    echo ""
    echo "${COLOUR_01}$(printf '%.0s.' {1..77})${NC}"
    echo ""
}

user_line_02() {
    echo ""
    echo "${COLOUR_01}$(printf '%.0s=' {1..77})${NC}"
    echo ""
}
