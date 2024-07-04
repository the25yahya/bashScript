#! /bin/bash
echo "Enter file location to copy:"
read file
echo "Enter location to copy file:"
read location
cp -r $file $location
