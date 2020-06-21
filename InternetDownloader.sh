#!/bin/bash

exit="EXIT"


while [ "$namein" != "$exit" ]; do

	#prompt the user for the name of the URL to download
	echo "Please type the URL of a file to download or type 'exit' to quit:"
	read name

	#convert to uppercase, so exit will work even in mixed caps format.
	namein=${name^^}
	
	if [ "${namein}" != "${exit}" ]; then
		echo "Type the location where you would like to download the file to:"
	        read location
		wget --show-progress ${name} -O ${location} -o logfile.txt
		
		#if no errors remove logfile.txt
		#if errors, then display error message
		if [ $? == "0" ]; then
			rm logfile.txt
		else
			echo "cannot find web page '$name'.  Check your spelling."
		fi

  	fi

done


