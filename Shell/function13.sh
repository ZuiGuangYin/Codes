#!/bin/bash

#�ݹ麯��
foo()
{
	read y
	foo $y
	echo "$y"
}

#���ú���
foo
exit 0

#ʹ�þֲ��������еݹ�һ���������ֵ������ʹ�õġ�
fact()
{
	local num=$1

	if ["$num" -eq 0 ]
	then
		factorial=1
	else 
		let "decnum=num-1"

		#�����ݹ����
		fact $decnum
		let "factorial=$num * $?"
	fi
	return $factorial
}

#�ű����õݹ麯��
fact $1
echo "Factorial of $1 is $?"

exit 0


