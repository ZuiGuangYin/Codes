#!/bin/bash

#��ŵ��
#��ʼ���ƶ�����
move=0

dohanoi()
{
	if [ $1 -eq 0 ]
	then
		echo -n " "
	else
		dohanoi "$(($1-1))" $2 $4 $3  #��A�ϵ�n-1��Բ���ƶ���B�� 
		ehco "move $2 ----> $3"

		let "move=move+1"  #��A�ϵ�һ��Բ���ƶ���C��

		dohanoi "$(($1-1))" $4 $3 $2  #��B�ϵ�n-1��Բ���ƶ���C��
	fi

	if [$# -ed 1]
	then 
		if [$ (($1>1)) -eq 1] #����Ҫ��igeԲ��
		then
			dohanoi $1 A C B
			echo "Total moves = $move"
		else
			echo "The number of disk which you input is illegall"

		fi
	fi
}

#���ú���
echo "Please input thenum of disk: "
read num dohandoi $num 'A' 'B' 'C'
