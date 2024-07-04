#!/bin/bash

# Ensure the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 wordlist domain outputfile"
    exit 1
fi

# Run gobuster with the provided arguments
gobuster dns -w "$1" -d "$2" -o "$3" --wildcard

# Process the output file to extract subdomains
cat "$3" | awk '{print $2}'
