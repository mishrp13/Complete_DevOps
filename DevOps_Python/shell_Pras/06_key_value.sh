#!/bin/bash

# How to store the key value pairs

declare -A myArray

myArray=( [name]=Prabal [age]=28 [city]=Rewa)

echo "Name is ${myArray[name]}"
echo "age is ${myArray[age]}"
echo "City is ${myArray[city]}"

