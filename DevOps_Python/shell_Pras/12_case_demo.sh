#!/bin/bash

echo "Provide an option"
echo "a for printing date: "
echo "b for list scripts"
echo "Current locations: "

read choice

case $choice in
     a)
          echo "Today's date is: "
          date
          echo "Ending... "
          ;;
     b)ls;;
     c)pwd;;
     *)echo "Please provide valid option"
esac