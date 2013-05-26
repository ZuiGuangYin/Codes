#!/bin/bash
#suing if and then to seect file or directory
#user 2008/05/20

if [ ! -e logical ]; then
	touch logical
	echo "Just make a file logical"
	exit 1
elif [ -e logical ] && [ -f logical ]; then
	rm logical
	echo "remove file ==> logical"
	echo "and make directory logical"
	exit 1
elif [ -e logical ] && [ -d logical ]; then
	rm -rf logical 
	echo "remove directory ==> logical"
	exit 1
else 
	echo "Does here have anything"
fi
