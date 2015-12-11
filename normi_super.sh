#!/bin/sh

for file in `find . -name "*.c"`
do
	output=`norminette $file | grep -v Norme:`
	while [[ -n $output ]]
	do
		vim $file
		output=`norminette $file | grep -v Norme:`
		if [[ -n $output ]]; then
			echo $output
			read
		fi
	done
done
