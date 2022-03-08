#!/bin/bash

function mean {
	if [[ $# -lt 1 ]];
	then 
		echo "usage: $0 <column> [file.csv]" 1>&2;
		exit 0;
	fi;

	if [[ $# -eq 1 ]];
	then
		dfile=/dev/stdin;
	else
		dfile=$2;
	fi;

	local col=$1;
	local file=$dfile;


	touch new_file.csv;
	file_1="new_file.csv";
	
	
	tail -n +2 "$file" | cut -d , -f $col > $file_1;

	count=0;
	sum=0;
		
	while read -r line;
	do 
		sum=$(($sum+$line));
		count=$(($count+1));
	done < $file_1;
	mean=$(echo "$sum / $count" | bc -l);
	echo $mean;
	rm new_file.csv;
}
mean $1 $2
