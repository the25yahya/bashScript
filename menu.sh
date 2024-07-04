#!/bin/bash

# menu function
show_menu() {
  echo "options:"
  echo "1: display current date and time"
  echo "2: show system info"
  echo "3: list files that match a pattern in a directory"
  echo "4: exit"
}

execute_option() {
  case $choice in
    1) display_date_time ;;
    2) show_system_info ;;
    3) list_files ;;
    4) exit ;;
    *) echo "Invalid option";;
  esac
}

display_date_time() {
  date
}

show_system_info() {
  uname -a
}

list_files() {
  echo "Enter directory path to search for file pattern"
  read dirLocation
  echo "Enter file pattern to look for"
  read filePattern

  cd "$dirLocation" || { echo "Enter a valid directory location"; exit 1; }
  output=$(find . -type f -name "$filePattern")
  echo "$output"
}

while true; do
  show_menu
  echo "Enter your choice:"
  read choice
  execute_option "$choice"
  echo
done

# This is the closing curly brace for the while loop
