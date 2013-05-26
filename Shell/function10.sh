#!/bin/bash

#一个函数调用多个函数
count_of_int()
{
	if [$1 -gt 9999 ]  #当该函数的值大于9999是，表示该数为5位数
	then
		let "place=5"
	elif [$1 -gt 999]  #当概述大于999而小于9999时，表示该数为4位数
	then 
		let "place=4"
	elif [$ -gt 99]
	then
		let "place=3"
	elif [$1 -gt 9]
	then 
		let "place=2"
	else
		let "place=1"
	fi

	echo "The place of the $1 is $place"
		
}
