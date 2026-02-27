#!/bin/bash

#AND Operator

read -p "what is your age? " age
read -p "Name of the country: " country
# || (then you can vote if any one condition is true)

if [[ $age > 18 ]] && [[ $country == "India" ]]
then 
    echo "You can Vote "
else
   echo "You can't vote "
fi