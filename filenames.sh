#!/bin/bash

# This script dertermines the file type, and advises the operator of what kind of file it is

echo "$1"

filetst=$1       #get file name to test from 1st entered parameter


# determine if the entered file is a file or a directory, then issue a message

if [ -f $filetst ]; then
       #it is a file, ignore
       echo "file ${filetst} exists"
elif [ -e $filetst ]; then
       echo "file ${filetst} is a directory rather than a file"
      #it is a directory, ignore
else
	echo "I do not know what kind of file $filetst is"
fi

