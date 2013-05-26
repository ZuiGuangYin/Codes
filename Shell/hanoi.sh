#!/bin/bash

#汉诺塔
#初始化移动次数
move=0

dohanoi()
{
	if [ $1 -eq 0 ]
	then
		echo -n " "
	else
		dohanoi "$(($1-1))" $2 $4 $3  #把A上的n-1个圆盘移动到B上 
		ehco "move $2 ----> $3"

		let "move=move+1"  #把A上的一个圆盘移动到C上

		dohanoi "$(($1-1))" $4 $3 $2  #把B上的n-1个圆盘移动到C上
	fi

	if [$# -ed 1]
	then 
		if [$ (($1>1)) -eq 1] #至少要有ige圆盘
		then
			dohanoi $1 A C B
			echo "Total moves = $move"
		else
			echo "The number of disk which you input is illegall"

		fi
	fi
}

#调用函数
echo "Please input thenum of disk: "
read num dohandoi $num 'A' 'B' 'C'
