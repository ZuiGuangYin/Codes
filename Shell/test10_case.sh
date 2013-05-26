#!/bin/bash

echo "Press your select one, two , three"
read number
case $number in 
	one)
		echo "your choice is oone"
		;;
	two)
		echo "Your choice is two"
		;;
	three)
		echo "your choice is three"
		;;
	*)
	echo "Usage (one|two|three)"
esac

