#!/bin/bash

#�ú�����һ������ʾ��һ������
show_week()
{
	for day in Monday Tuesday Wednesday Thursday Friday
	do
		echo -n "$day"
	done
}

#�ú�����һ������ʾ1-7
show_number()
{
	for(( integer = 1; integer <= 7; integer++))
	do
		echo -n "$integer"
	done
}

#�ú���������ʾ1~7��ƽ��
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

