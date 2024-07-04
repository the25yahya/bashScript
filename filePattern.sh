#! /bin/bash

echo "Enter directory to path to search for file pattern"
read dirLocation
echo "Enter file pattern to look for"
read filePattern


cd "$dirLocation" || {echo "Directory not found"; exit 1;}
output = $(find . -type f -name "$filePattern")
echo $output

