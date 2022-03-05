#!/bin/bash

# head ./Property_Tax_Roll.csv

file="./Property_Tax_Roll.csv"
cat $file | grep "MADISON SCHOOLS" | cut -d , -f 7 | \
    { sum=0; num=0; while read n; do sum=$(($sum + $n)); num=$(($num + 1)); done; \
      avg=$(echo "scale=4; $sum/$num" | bc); echo $avg; }


