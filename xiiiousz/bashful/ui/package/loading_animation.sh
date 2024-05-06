# Import other function

# Simple Loading Animation
function loading_animation() {
  local delay=0.1
  local duration=3

  for ((i = 0; i < duration; i++)); do
    echo -e "\n."
    sleep "$delay"
  done

  echo # Move to the next line
}

# Spinning Animation
function spinning_animation() {
  local spinner="/-\\|"
  local delay=0.1
  local count=0
  local end_time=$((SECONDS + 2))

  while [ $SECONDS -lt $end_time ]; do
    count=$(((count + 1) % 4))
    echo -n -e "\r[${spinner:$count:1}] $1"
    sleep "$delay"
  done
  echo -e "\r" # Clear the animation line
}

# Dynamic Loading Animation
# example: dynamic_loading_animation "Exiting"
function dynamic_loading_animation() {
  local spinner="/-\\|"
  local delay=0.1
  local count=0
  local end_time=$((SECONDS + 2))
  # local colors=("[1;31m" "[1;32m" "[1;33m" "[1;34m" "[1;35m" "[1;36m" "[1;37m") # Colors
  local colors=("${COLOUR_01}" "${COLOUR_02}") # theme

  while [ $SECONDS -lt $end_time ]; do
    count=$(((count + 1) % 4))
    color_index=$((count % ${#colors[@]}))
    color="${colors[$color_index]}"

    echo -n -e "\r$color[${spinner:$count:1}] $1[0m"
    sleep "$delay"
  done
  echo -e "\r" # Clear the animation line
}

# Spinner
spinner() {
  local pid=$1
  local delay=0.1
  local spinstr="/-\|"
  tput civis # Hide the cursor
  while ps a | awk '{print $1}' | grep -q "$pid"; do
    local temp=${spinstr#?}
    printf "[%c]" "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
  tput cnorm # Show the cursor
}

# Simplified Spinner with direct ANSI color codes
#  example: colour_spinner "${RED}" "${BLUE}"
colour_spinner() {
  local delay=0.1
  local spinstr="/-\|"
  local color1="$1"
  local color2="$2"
  local color1="${1:-${COLOUR_01}}" # Default to COLOUR_01 if not provided
  local color2="${2:-${COLOUR_02}}" # Default to COLOUR_02 if not provided

  tput civis # Hide the cursor

  while true; do
    printf "%s[%c]%s" "$color1" "${spinstr:0:1}" "$color2"
    sleep $delay
    printf "\b\b\b\b\b"

    printf "%s[%c]%s" "$color2" "${spinstr:1:1}" "$color1"
    sleep $delay
    printf "\b\b\b\b\b"

    printf "%s[%c]%s" "$color1" "${spinstr:2:1}" "$color2"
    sleep $delay
    printf "\b\b\b\b\b"

    printf "%s[%c]%s" "$color2" "${spinstr:3:1}" "$color1"
    sleep $delay
    printf "\b\b\b\b\b"
  done

  tput cnorm # Show the cursor
}

dot_loading_animation() {
  local duration=0.5
  local max_length=7

  local counter=0

  # Hide the cursor
  hide_cursor

  while true; do
    printf "${COLOUR_01}. "
    sleep "$duration"

    counter=$((counter + 1))

    if [ "$counter" -eq "$max_length" ]; then
      counter=0
      printf "\r\e[K" # Move the cursor back to the beginning and clear the line
    fi
  done

  # Show the cursor
  show_cursor
}

enter_to_skip() {
  read -p "" enter
  unset enter
}
