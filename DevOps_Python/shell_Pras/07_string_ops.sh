#!/bin/bash

myVar="Hey buddy how are you?"

myVarLength=${#myVar}
echo "Length of the myVar is $myVarLength"

echo "upper case is ----------${myVar^^}"
echo "Lower case is ---------------${myVar,,}"


#To replace a string

newVar=${myVar/buddy/Paul}
echo "New var is ---$newVar"

# To slice a string
echo "After slice ${myVar:4:5}"