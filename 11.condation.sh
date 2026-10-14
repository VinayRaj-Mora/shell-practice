#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "The given number $NUMBER is less than 10."
else 
    echo "The given number $NUMBER is grater than or equal to 10."
fi