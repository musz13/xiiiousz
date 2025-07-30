#!/bin/bash

# Import other function
source "$XIIIOUSZ"

# xiiiousz "~"
xiiiousz "bashful"
xiiiousz_bashful "~"

clear

# Get the total number of columns in the terminal
TOTAL_COLUMNS=$(tput cols)

# Calculate the percentage you want (e.g., 80%)
PERCENTAGE=80

# Calculate the actual width based on the percentage
WIDTH=$((TOTAL_COLUMNS * PERCENTAGE / 100))

# Set the TERMINAL_WIDTH variable
TERMINAL_WIDTH=$WIDTH

# Function to print title
print_title() {
    title="$1"

    # Calculate the padding needed on each side
    padding=$((($TERMINAL_WIDTH - ${#title}) / 2))

    # Print the padded title
    printf "%*s%s%*s\n" $padding '' "${COLOUR_01}$title${COLOUR_DEFAULT}" $padding ''
}

# Function to print a command and description, wrapping text if necessary
print_row() {
    local command="$1"
    local description="$2"

    # Calculate widths based on percentages
    command_width=$((TERMINAL_WIDTH * 30 / 100))
    description_width=$((TERMINAL_WIDTH - command_width))

    # Print command and description
    printf "${COLOUR_01}%-*s${COLOUR_DEFAULT} : %s\n" $command_width "$command" "$description"
}

hardware_information() {
    # Print the header of the table
    create_line_00 $TERMINAL_WIDTH "-"
    print_title "Hardware Information Commands"
    create_line_00 $TERMINAL_WIDTH "-"

    # Print each command and its description
    print_row "lscpu" "See CPU information."
    print_row "lsblk" "See information about block devices."
    print_row "lspci -tv" "Show PCI devices (graphics card, network card, etc.) in a tree-like diagram."
    print_row "lsusb -tv" "Display USB devices in a tree-like diagram."
    print_row "lshw" "List hardware configuration information."
    print_row "cat /proc/cpuinfo" "Show detailed CPU information."
    print_row "cat /proc/meminfo" "View detailed system memory information."
    print_row "cat /proc/mounts" "See mounted file systems."
    print_row "free -h" "Display free and used memory."
    print_row "sudo dmidecode" "Show hardware information from the BIOS."
    print_row "hdparm -i /dev/[device_name]" "Display disk data information."
    print_row "hdparm -tT /dev/[device_name]" "Conduct a read speed test on the device/disk."
    print_row "badblocks -s /dev/[device_name]" "Test for unreadable blocks on the device/disk."
    print_row "fsck /dev/[device_name]" "Run a disk check on an unmounted disk or partition."

    # End of the table
    create_line_00 $TERMINAL_WIDTH "-"
    echo ""
}

search_command_list() {
    # Print the header of the table
    create_line_00 $TERMINAL_WIDTH "-"
    print_title "Searching Commands"
    create_line_00 $TERMINAL_WIDTH "-"

    # Print each command and its description
    print_row "find [path] -name [search_pattern]" "Find files and directories that match the specified pattern in a specified location."
    print_row "find [path] -size [+100M]" "See files and directories larger than a specified size in a directory."
    print_row "grep [search_pattern] [file_name]" "Search for a specific pattern in a file with grep."
    print_row "grep -r [search_pattern] [directory_name]" "Recursively search for a pattern in a directory."
    print_row "locate [name]" "Locate all files and directories related to a particular name."
    print_row "which [command]" "Search the command path in the \$PATH environment variable."
    print_row "whereis [command]" "Use the whereis command to find the source, binary, and manual page for a command."
    print_row "awk '[search_pattern] {print \$0}' [file_name]" "Print all lines matching a pattern in a file. See also the gawk command, the GNU version of awk."
    print_row "sed 's/[old_text]/[new_text]/' [file_name]" "Find and replace text in a specified file."

    # End of the table
    create_line_00 $TERMINAL_WIDTH "-"
    echo ""
}

file_command() {
    # Print the header of the table
    create_line_00 $TERMINAL_WIDTH "-"
    print_title "File Commands"
    create_line_00 $TERMINAL_WIDTH "-"

    print_row "mkdir [directory_name]" "Create a new directory."
    print_row "rm [file_name]" "Remove a file."
    print_row "rm -r [directory_name]" "Remove a directory recursively."
    print_row "rm -rf [directory_name]" "Recursively remove a directory without requiring confirmation."
    print_row "cp [source_file] [destination_file]" "Copy the contents of one file to another file using the cp command."
    print_row "cp -r [source_directory] [destination_directory]" "Recursively copy a directory to a second directory."
    print_row "mv [source_file] [destination_file]" "Move or rename files or directories."
    print_row "ln -s [path]/[file_name] [link_name]" "Create a symbolic link to a file."
    print_row "touch [file_name]" "Create a new file using touch."
    print_row "cat [file_name]" "Show the contents of a file."
    print_row "cat [source_file] >> [destination_file]" "Append file contents to another file."
    print_row "head [file_name]" "Show the first ten lines of a file."
    print_row "tail [file_name]" "Show the last ten lines of a file with the tail command."
    print_row "more [file_name]" "Display contents of a file page by page."
    print_row "less [file_name]" "Show the contents of a file with navigation using the less command."
    print_row "nano [file_name]" "Open or create a file using the nano text editor."
    print_row "vi [file_name]" "Open or create a file using the Vi text editor."
    print_row "vim [file_name]" "Open or create a file using the Vim text editor."
    print_row "gpg -c [file_name]" "Encrypt a file."
    print_row "gpg [file_name].gpg" "Decrypt an encrypted .gpg file."
    print_row "wc -w [file_name]" "Show the number of words, lines, and bytes in a file using wc."
    print_row "ls | xargs wc" "List the number of lines/words/characters in each file in a directory with the xargs command."
    print_row "cut -d [delimiter] [file_name]" "Cut a section of a file and print the result to standard output."
    print_row "[data] | cut -d [delimiter]" "Cut a section of piped data and print the result to standard output."
    print_row "shred -u [file_name]" "Overwrite a file to prevent its recovery, then delete it."
    print_row "diff [first_file] [second_file]" "Compare two files and display differences."
    print_row "source [file_name]" "Read and execute the file content in the current shell."
    print_row "[command] | tee [file_name] >/dev/null" "Store the command output in a file and skip the terminal output."

    # End of the table
    create_line_00 $TERMINAL_WIDTH "-"
    echo ""
}

# Main function
main() {

    echo ""
    print_title "LINUX CHEATSHEETS"
    echo ""

    hardware_information
    search_command_list
    file_command
}

main
enter_to_skip
exit
