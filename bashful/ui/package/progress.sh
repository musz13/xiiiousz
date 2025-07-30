#!/bin/bash
# Import other function

# Function to simulate a task with dynamic progress
# example:
# simulate_dynamic_task() {
#     local duration=$1
#     local total_steps=$2

#     # Simulate the task with dynamic progress
#     for ((step=1; step<=total_steps; step++)); do
#         draw_dynamic_progress_bar "$step" "$total_steps"
#         sleep "$duration"
#     done
#     echo ""
# }

draw_dynamic_progress_bar() {
    local current=$1
    local total=$2
    local bar_length=20
    local max_blocks=$((bar_length - 2)) # To accommodate brackets
    local num_blocks=$((current * max_blocks / total))

    hide_cursor

    # Draw the dynamic progress bar
    printf "${COLOUR_02}["
    for ((i = 0; i < num_blocks; i++)); do printf "${COLOUR_01}="; done

    for ((i = num_blocks; i < max_blocks; i++)); do printf " "; done
    printf "${COLOUR_02}]${COLOUR_DEFAULT}\r"

    # Show cursor if the progress is complete
    if [ "$current" -eq "$total" ]; then
        show_cursor
    fi
}

draw_dynamic_progress_bar_number() {
    local current=$1
    local total=$2
    local bar_length=20
    local max_blocks=$((bar_length - 2)) # To accommodate brackets
    local num_blocks=$((current * max_blocks / total))

    hide_cursor

    # Draw the dynamic progress bar
    printf "${COLOUR_02}["
    for ((i = 0; i < num_blocks; i++)); do printf "${COLOUR_01}="; done
    for ((i = num_blocks; i < max_blocks; i++)); do printf " "; done
    printf "] ${COLOUR_02}%d / %d${COLOUR_DEFAULT}\r" "$current" "$total"

    # Show cursor if the progress is complete
    if [ "$current" -eq "$total" ]; then
        show_cursor
    fi
}

# Function to draw a dynamic filling progress bar
draw_dynamic_progress_bar_percentage() {
    local current=$1
    local total=$2
    local bar_length=20
    local progress=$((current * 100 / total))
    local num_blocks=$((progress * bar_length / 100))

    hide_cursor

    # Draw the dynamic progress bar
    printf "${COLOUR_02}["
    for ((i = 0; i < num_blocks; i++)); do printf "${COLOUR_01}=${COLOUR_02}"; done
    for ((i = num_blocks; i < bar_length; i++)); do printf " "; done
    printf "]%d%%\r${COLOUR_DEFAULT}" "$progress"

    # Show cursor if the progress is complete
    if [ "$current" -eq "$total" ]; then
        show_cursor
    fi
}

# percentage_progress
# example: percentage_progress "$current" "$total"
percentage_progress() {
    local current=$1
    local total=$2
    local color="${3:-${COLOUR_01}}" # Default to green color if not provided
    local reset_color="${COLOUR_02}" # Reset color code

    hide_cursor

    local progress=$((current * 100 / total))

    printf "${color}%d%%${reset_color}\r" "$progress"

    # Show cursor if the progress is complete
    if [ "$current" -eq "$total" ]; then
        show_cursor
    fi
}

# progrees number
# example: number_progress "$current" "$total"
number_progress() {
    local current=$1
    local total=$2
    local color="${3:-${COLOUR_01}}"    # Default to color_01 if not provided
    local reset_color=${COLOUR_DEFAULT} # Reset color code

    hide_cursor

    printf "${color}%d / %d${reset_color}\r" "$current" "$total"

    # Show cursor if the progress is complete
    if [ "$current" -eq "$total" ]; then
        show_cursor
    fi
}
