#!/bin/bash

# Get the current date (in YYYY-MM-DD format)
currentDate() {
    date "+%Y-%m-%d"
}

# Get the current time (up to seconds)
currentTime() {
    date "+%H:%M:%S"
}

# Get the current epoch timestamp
epochTimestamp() {
    date "+%s"
}

# Get the current Unix timestamp (seconds since 1970-01-01 00:00:00 UTC)
unixTimestamp() {
    date "+%s"
}

# Get the day of the week (1-7, where Monday is 1 and Sunday is 7)
getDay() {
    date "+%A"
}

# Get the month (1-12)
getMonth() {
    date "+%m"
}

# Get the year
getYear() {
    date "+%Y"
}

# Get the current date and time
currentDateTime() {
    date "+%Y-%m-%d %H:%M:%S"
}

# get Hours
getHours() {
    echo $(date +"%H")
}

# get Minutes
getMinutes() {
    echo $(date +"%M")
}

#  get Seconds
getSeconds() {
    echo $(date +"%S")
}

# get Miliseconds
getMilliseconds() {
    echo $(date +"%s%3N")
}

# Add minutes to a given date/time
addMinutes() {
    local datetime="$1"
    local minutes="$2"
    date -d "$datetime + $minutes minutes" "+%Y-%m-%d %H:%M:%S"
}

# Add hours to a given date/time
addHours() {
    local datetime="$1"
    local hours="$2"
    date -d "$datetime + $hours hours" "+%Y-%m-%d %H:%M:%S"
}

# Add seconds to a given date/time
addSeconds() {
    local datetime="$1"
    local seconds="$2"
    date -d "$datetime + $seconds seconds" "+%Y-%m-%d %H:%M:%S"
}

# Add days to a given date
addDays() {
    local date="$1"
    local days="$2"
    date -d "$date + $days days" "+%Y-%m-%d"
}

# Add months to a given date
addMonths() {
    local date="$1"
    local months="$2"
    date -d "$date + $months months" "+%Y-%m-%d"
}

# Add years to a given date
addYears() {
    local date="$1"
    local years="$2"
    date -d "$date + $years years" "+%Y-%m-%d"
}

# Subtract minutes from a given date/time
subtractMinutes() {
    local datetime="$1"
    local minutes="$2"
    date -d "$datetime - $minutes minutes" "+%Y-%m-%d %H:%M:%S"
}

# Subtract hours from a given date/time
subtractHours() {
    local datetime="$1"
    local hours="$2"
    date -d "$datetime - $hours hours" "+%Y-%m-%d %H:%M:%S"
}

# Subtract seconds from a given date/time
subtractSeconds() {
    local datetime="$1"
    local seconds="$2"
    date -d "$datetime - $seconds seconds" "+%Y-%m-%d %H:%M:%S"
}

# Subtract days from a given date
subtractDays() {
    local date="$1"
    local days="$2"
    date -d "$date - $days days" "+%Y-%m-%d"
}

# Subtract months from a given date
subtractMonths() {
    local date="$1"
    local months="$2"
    date -d "$date - $months months" "+%Y-%m-%d"
}

# Subtract years from a given date
subtractYears() {
    local date="$1"
    local years="$2"
    date -d "$date - $years years" "+%Y-%m-%d"
}

# Function to convert milliseconds to seconds
msToSeconds() {
    local milliseconds=$1
    local seconds=$((milliseconds / 1000))
    echo "$seconds"
}

# Function to convert milliseconds to minutes
msToMinutes() {
    local milliseconds=$1
    local minutes=$((milliseconds / 60000))
    echo "$minutes"
}

# getHours

# getMinutes

# getMiliseconds

# -- Example usage
# echo "Current Date: $(currentDate)"
# echo "Current Time: $(currentTime)"
# echo "Epoch Timestamp: $(epochTimestamp)"
# echo "Unix Timestamp: $(unixTimestamp)"
# echo "Day of the Week: $(getDay)"
# echo "Month: $(getMonth)"
# echo "Year: $(getYear)"
# echo "Current Date and Time: $(currentDateTime)"

# # Example of adding and subtracting time
# newDateTime=$(addHours "$currentDate" 23)
# echo "After adding 2 hours: $newDateTime"

# newDateTime=$(subtractDays "$currentDate" 30)
# echo "After subtracting 5 days: $newDateTime"

# hours=$(getHours)
# minutes=$(getMinutes)
# seconds=$(getSeconds)
# milliseconds=$(getMilliseconds)

# echo "Current Time: $hours:$minutes:$seconds $days"
# echo "Milliseconds since epoch: $milliseconds"

# msToSeconds "$milliseconds"
# msToMinutes "$milliseconds"
