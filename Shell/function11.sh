#!/bin/bash

#�ֲ�������ȫ�ֱ���

text = "global variable"

#������ʹ�õľֲ�������ȫ�ֱ�����������ͬ
use_local_var_fun()
{
	local text="local varivable"
	echo "In function user_local_var_fun "
	echo $text
}

#�������use_local_var_fun�ڵľֲ�����ֵ
echo "Execute the function use_local_var_fun"
use_local_var_fun

#�������use_local_var_fun���ȫ�ֱ���ֵ
echo "Out of function use_local_var_fun"
echo $text
exit 0

