#!/bin/bash

my_array=("yahya" "idk" "idk2")

transform(){
    for i in "$1"; do
      echo "$1"
    done
}

transform "$my_array"
