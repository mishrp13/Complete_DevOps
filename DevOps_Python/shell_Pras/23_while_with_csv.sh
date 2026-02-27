#!/bin/bash

# while IFS=","  read id name age
# do
#   echo "Id is $id"
#   echo "name is $name"
#   echo "age is $age"
# done < new.csv


cat new.csv | awk 'NR=!1 {print}' | while IFS="," read id name age
do
  echo "Id is $id"
  echo "name is $name"
  echo "age is $age"
done < new.csv

