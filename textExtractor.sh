#! /bin/bash
 show_menu(){
echo "OPTIONS - choose one or more option :"
echo ""
echo ""
echo "1: look for text pattern + numeric values"

echo "2: look for one or more ocurrences of a text"
echo "3: Replace text pattern with another string"
echo "4: Count occurrences of a specific text pattern"
echo "5: Extract lines containing a certain text pattern"
echo "6: Search for a text pattern in specific file types (e.g., .txt, .csv)"
echo "7: Perform a case-insensitive search for a text pattern"
echo "8: Display lines surrounding the matched text pattern"
echo "9: Perform a search for a text pattern recursively in directories"
echo "10: Output matched text patterns along with their line numbers"
echo "11: Exclude certain directories or files from the search"
echo "12: Search for text patterns using regular expressions"
echo "13: Highlight matched text patterns in the output"
echo "14: Save search results to a file"
echo "15: Limit the search to a specific range of lines within files"
echo "16: Display only unique occurrences of the text pattern"
echo "17: Perform a search for a text pattern in compressed files (e.g., .zip, .gz)"
echo "18: Display statistics about the search results (e.g., total matches found)"
echo "19: Perform a search for a text pattern within a specified character encoding"
echo "20: Output search results in a structured format (e.g., JSON, XML)"

 }

################################################################################################
#
#
execute_option(){
    local pattern
    case $1 in
        1)  pattern="$2[0-9]+";;
        2)  pattern="$2*";;
        # Add more cases as needed...
        *)  echo "Invalid option"; return;;
    esac

    grep -E "$pattern" "$3"
}

option1(){
grep -E 
}

while true; do
    show_menu
    echo "ENTER YOUR CHOICE"
    read userInput
    echo "ENTER FILE LOCATION"
    read fileLocation
    execute_option "$userInput" "$pattern" "$fileLocation"
    echo
    break
done
