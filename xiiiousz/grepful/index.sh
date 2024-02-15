#!/bin/bash

# Function to index xiiiousz_grepful based on package imported
xiiiousz_grepful() {
    start_timer
    local grepful_directory="$XIIIOUSZ_HOME/grepful"
    local conditions=("$@")
    local indexed_packages=()
    grepful_small_logo
    for condition in "${conditions[@]}"; do
        case "$condition" in
        "~")
            for file in "$grepful_directory"/*/"index.sh"; do
                # echo "package: $file"

                # Extract basename and store in another variable
                baseName=$(echo "$file" | rev | cut -d'/' -f2 | rev)
                # baseName="${baseName%.sh}"
                # echo "Basename: $baseName"
                echo "${GREPFUL_COLOUR_01}GREPFUL ${NC}- imported package: $baseName"
                indexed_packages+=("$indexed_package")
                for package_file in "$grepful_directory"/$baseName/"package"/*."sh"; do
                    # echo "$baseName package: $package_file"

                    # Extract basename and store in another variable
                    package_name=$(basename "$package_file")
                    package_name="${package_name%.sh}"
                    # echo "Basename: $baseName"
                    # echo "${GREPFUL_COLOUR_01}xiiiousz - grepful-$baseName ${NC}- imported package: $package_name"
                    source "$package_file"
                    indexed_packages+=("$indexed_package")
                done
            done
            ;;
        *)
            echo "${COLOUR_ERROR}Invalid package."
            exit 1
            ;;
        esac

        # echo "${GREPFUL_COLOUR_01}xiiiousz-grepful ${COLOUR_DEFAULT}-  $condition"
    done
    echo "${GREPFUL_COLOUR_01}GREPFUL Imported Successfully ${COLOUR_DEFAULT}"
    stop_timer
}
