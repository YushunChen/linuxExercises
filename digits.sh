#!/bin/bash

sum=0

for i in {1000..2000}; do
    pattern="^[01]+$"
    if [[ "$i" =~ $pattern ]]; then
	sum=$(($sum+$i))
    fi
done

echo sum=$sum
