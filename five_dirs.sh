#!/bin/bash

mkdir five

for i in $(seq 1 5); do
    mkdir "five/dir${i}"
    for j in $(seq 1 4); do
	touch "five/dir${i}/file${j}"
	for k in $(seq $j); do
	    echo $j >> "five/dir${i}/file${j}"
	done
    done
done
