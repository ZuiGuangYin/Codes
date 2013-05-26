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

	#使用for循环判断当前之目录和文件，并使用echo换行
	for file in $( ls )
	do 
		if [ -d $file ]
		then
			let "dirnum =dirnum + 1"
		else
			let "filenum = filenum + 1"
		fi
	done

	#使用echo命令显示当前目录下的之目录和文件个数 
	echo "The number of directories is $dirnum"
	echo "The number of files is $filenum"
}

#脚本中调用函数
directory

