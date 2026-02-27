#!/bin/bash

#Array

myArray=( 1 20 30.5 Hello "Hello Buddy!")
echo "Value of index 3 is ${myArray[3]}"

echo "All the values in array is ${myArray[*]}"

#How to find no of values in an Array
echo "No of values , length of an array is ${#myArray[*]}"

echo "values from index 2 to 3 is:  ${myArray[*]:2:2}"

#updating our array with new values

myArray+=(New 30 40)

echo "Values of new array are ${myArray[*]}"