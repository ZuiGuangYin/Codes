#!/bin/bash

output()
{
	for(( num1=1;num1<=5;num1++))
	do
		echo -n "$num1"
	done
}

let "num2=1"
while [ "$num2" -le 5 ]
do 
	output
	echo " "
	let "i=i+1"
done

directory()
{
	let "filenum = 0"
	let "dirnum = 0"

	ls $l
	echo " "

	#ʹ��forѭ���жϵ�ǰ֮Ŀ¼���ļ�����ʹ��echo����
	for file in $( ls )
	do 
		if [ -d $file ]
		then
			let "dirnum =dirnum + 1"
		else
			let "filenum = filenum + 1"
		fi
	done

	#ʹ��echo������ʾ��ǰĿ¼�µ�֮Ŀ¼���ļ����� 
	echo "The number of directories is $dirnum"
	echo "The number of files is $filenum"
}

#�ű��е��ú���
directory

