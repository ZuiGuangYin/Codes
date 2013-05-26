#!/bin/bash

#函数实现两数加，减，乘，除四则运算
count()
{
	if [ $# -ne 3 ]
	then 
		echo "The number of argumets is not 3!"  #提示输入参数个数错误
	fi
	let "s = 0"

	case $2 in
	+)
		let "s=$1+$3"
		echo "$1+$3 = $s";;
	-)
		let "s=$1-$3"
		echo "$1-$3=$s";;
	*)
		let "s=$1*$3"
		echo "$1 * $3 = $s"
	\/)
		let "s = $1 / $3"

		echo "$1 / $3 = $s";;
	*)
		ehco "what you imput is wrog!";;
	esac
}

#提示输入的
echo "Please type your wore: ( e.g. 1+1)"

#读取输入的参数
read a b c 
count $a $b $c

