#!/bin/bash

#����ִ����ʾ���������ƽ��
square()
{
	echo "Pleae input the num:"
	read num1

	let "squ=num1*num1"

	echo "Square of $num1 is $squ."
}

#����ִ����ʾ�������������
cube()
{
	echo "Please input teh num:"
	read num2

	led "c = num2 * num2 * num2"
	echo "Cube of $num2 is $c"
}

#����ִ������������������ݴη�
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

#ѡ����õĺ��� 
choice()
{
	echo "jJPlease input the choice of operate(s for square ; c for cube and p for power):"
	read char
	#�ж�����Ĳ������ĸ�,Ȼ���������Ĳ�ִͬ�в�ͬ�ĺ���
	case $char in
	s)
		square;;  #ִ��ƽ������
	c)
	        cube;;   #ִ����������
	p)
		power;;  #ִ��������
	*)
		echo "what you input is wrong!";;
	esac
}

#���ú���choice
choice

