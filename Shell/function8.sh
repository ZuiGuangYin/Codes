#!/bin/bash

#该函数在一行中显示周一到周日
show_week()
{
	for day in Monday Tuesday Wednesday Thursday Friday
	do
		echo -n "$day"
	done
}

#该函数在一行中显示1-7
show_number()
{
	for(( integer = 1; integer <= 7; integer++))
	do
		echo -n "$integer"
	done
}

#该函数用于显示1~7的平方
show_square()
{
	i = 0
	until [[ "$i" -gt 7 ]]
	do 
		let "square=i*1"
		iecho "$i * $i = $square"
		let "i++"
	done
}

show_week()
show_number()
show_square()

