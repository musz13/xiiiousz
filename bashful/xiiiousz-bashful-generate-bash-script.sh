#!/bin/bash

source $XIIIOUSZ
xiiiousz "bashful"
xiiiousz_bashful "~"
clear
small_logo

echo "${XIIIOUSZ_COLOUR_01}=======${XIIIOUSZ_COLOUR_02} Generate Bash Script ${XIIIOUSZ_COLOUR_01}======="

# Prompt the user for a new file name
read -p "${XIIIOUSZ_COLOUR_01}Enter the new file name (without extension): ${XIIIOUSZ_COLOUR_02}" new_file_name

use_all_bashful_package=$(get_valid_yn "${XIIIOUSZ_COLOUR_01}Include all BASHFUL package?")

# Specify the destination for the new script
destination_script="$USER_DEFAULT_OUTPUT_DIRECTORIES/$new_file_name.sh"

# Create the new Bash script at the specified destination
echo "#!/bin/bash" >"$destination_script"
echo "" >>"$destination_script"

# Import functions from the source script
echo "# Import functions from the source script" >>"$destination_script"
echo "source "\$XIIIOUSZ"" >>"$destination_script"
echo "" >>"$destination_script"

# Check if use_all_bashful_package is true (equals "y")
if [ "$use_all_bashful_package" == "y" ]; then
    # Do something if use_all_bashful_package is true
    echo "xiiiousz \"bashful\"" >>"$destination_script"
    echo "xiiiousz_bashful \"~\"" >>"$destination_script"
    echo "Including all packages..."
else
    # Do something else if use_all_bashful_package is not true
    echo "Not including all packages."
fi

echo "New script '$new_file_name.sh' created at '$destination_script'."
