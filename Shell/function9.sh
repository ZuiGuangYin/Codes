#!/bin/bash

#函数执行显示输入参数的平方
square()
{
	echo "Pleae input the num:"
	read num1

	let "squ=num1*num1"

	echo "Square of $num1 is $squ."
}

#函数执行显示输入参数的立方
cube()
{
	echo "Please input teh num:"
	read num2

	led "c = num2 * num2 * num2"
	echo "Cube of $num2 is $c"
}

#函数执行西那是输入参数的幂次方
power()
{
	echo "Please input the num:"
	read num3
	echo "Please input the power: "
	read p

	let "temp = 1"
	for (( i=1;i <= $p; i++))
	do 
		let "temp = temp*num3"
	done
	echo "power $p of $num3 is $temp."
}

#选择调用的函数 
choice()
{
	echo "jJPlease input the choice of operate(s for square ; c for cube and p for power):"
	read char
	#判断输入的参数是哪个,然后根据输入的不同执行不同的函数
	case $char in
	s)
		square;;  #执行平方函数
	c)
	        cube;;   #执行立方函数
	p)
		power;;  #执行幂运算
	*)
		echo "what you input is wrong!";;
	esac
}

#调用函数choice
choice

