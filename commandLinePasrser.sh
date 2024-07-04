#!/bin/bash

while getopts ":abc:" opt; do
  case ${opt} in
    a )
      echo "Option -a was selected"
      ;;
    b )
      echo "Option -b was selected"
      ;;
    c )
      echo "Option -c was selected with value $OPTARG"
      ;;
    \? )
      echo "Invalid option: $OPTARG"
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument"
      ;;
  esac
done

