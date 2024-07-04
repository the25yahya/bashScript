#! /bin/bash 


declare -a numbers
sum=0


#prompt user for values
while true; do 
  read -p "Enter values each in a single line , press q to quit:  "  value

  #CHECK IF USER WANTS TO QUIT 
  if [[ "$value" == "q" ]]; then
     break
  fi
  #ELSE APPEND VALUE TO THE ARRAY
  numbers+=("$value")
done


maximum=${numbers[0]}
minimum=${numbers[0]}


# Iterate over the elements of the array
for number in "${numbers[@]}"; do
  # Sum up all the values
  ((sum += number))
  
  # Check if the current number is bigger than the maximum
  if (( number > maximum )); then
    # If yes, update the maximum
    maximum=$number
  fi

  # Check if the current number is smaller than the minimum
  if (( number < minimum )); then
    # If yes, update the minimum
    minimum=$number
  fi
done

# Calculate the average
average=$(bc <<< "scale=2; $sum / ${#numbers[@]}")




echo "maximum value entered : $maximum"
echo "minimum value entered : $minimum"
echo "Average value entered : $average"
