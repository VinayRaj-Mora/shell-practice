#!/bin/bash

echo "Please enter a number:"

read NUMBER

if [ $(($NUMBER % 20)) -eq 0 ]; then
    echo "Given number $NUMBER EVEN"
else
    echo "Given number $NUMBER ODD Number"
fi