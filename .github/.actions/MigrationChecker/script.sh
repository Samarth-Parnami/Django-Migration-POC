#!/bin/bash

# imports
. helpers/match_format.sh
. helpers/migration_finder.sh
. helpers/order.sh

# Initialize variables
is_path=false

# Parse command-line options
while getopts ":p" opt; do
    case $opt in
        p)
            is_path=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            echo "Usage: $0 [-p] [input1 input2 ...]"
            exit 1
            ;;
    esac
done

# Shift the options, leaving only the positional arguments
shift "$((OPTIND-1))"

# Process input based on the flag
if [ "$is_path" = true ]; then
    # List files in the provided directories
    for directory in "$@"; do


        if [ ! -d "$directory" ]; then
            echo "Error: "$directory" is not a directory."
            continue
        fi
        echo "Files in $directory:"
        ls "$directory"

        echo
        resp=$(migrationFinder "$directory")
        migrations=($resp)
        echo "Found ${#migrations[@]} migrations in $directory"

        matchFormat "${migrations[@]}" 
        status=$?

        if [ $status = 1 ]; then
            echo -e "\\nExiting with status 1"
            exit 1
        fi    

        echo    
        migrationOrder "${migrations[@]}"
        status=$?

        if [ $status = 1 ]; then
            exit 1
        fi  
        
        echo
    done
else
    # Process other types of input (you can modify this part based on your needs)
    echo "Processing other types of input"
fi
