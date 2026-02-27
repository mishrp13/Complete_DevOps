#!/bin/bash

# script to show how to use variables

a=10
name="Prabal"
age=28

echo "My name is $name and age is $age"

name="Paul"
echo "My name is $name"

# Variable to store the output of a command

HOSTNAME=$(hostname)
echo "Name of my machine is $HOSTNAME"