#!/bin/bash

#Getting values from a file names.txt

File="/c/Devops_Python/Python/Python_Projects_Nana/DevOps_Python/shell_Pras/new.txt"

for name in $(cat $File)
do
  echo "Name is $name"
done

