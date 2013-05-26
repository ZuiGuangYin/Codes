#!/bin/bash

#递归函数
foo()
{
	read y
	foo $y
	echo "$y"
}

#调用函数
foo
exit 0

#使用局部变量进行递归一般是针对数值运算来使用的。
fact()
{
	local num=$1

	if ["$num" -eq 0 ]
	then
		factorial=1
	else 
		let "decnum=num-1"

		#函数递归调用
		fact $decnum
		let "factorial=$num * $?"
	fi
	return $factorial
}

#脚本调用递归函数
fact $1
echo "Factorial of $1 is $?"

exit 0


