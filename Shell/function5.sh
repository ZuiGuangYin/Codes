#!/bin/bash

#����ʵ�������ӣ������ˣ�����������
count()
{
	if [ $# -ne 3 ]
	then 
		echo "The number of argumets is not 3!"  #��ʾ���������������
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

#��ʾ�����
echo "Please type your wore: ( e.g. 1+1)"

#��ȡ����Ĳ���
read a b c 
count $a $b $c

