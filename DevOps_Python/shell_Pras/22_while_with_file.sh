#!/bin/bash

while read myvar

do
  echo "value from file is $myvar"
done < new.txt