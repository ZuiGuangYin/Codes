#!/bin/bash

#һ���������ö������
count_of_int()
{
	if [$1 -gt 9999 ]  #���ú�����ֵ����9999�ǣ���ʾ����Ϊ5λ��
	then
		let "place=5"
	elif [$1 -gt 999]  #����������999��С��9999ʱ����ʾ����Ϊ4λ��
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
