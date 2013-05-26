#!/bin/bash

#局部变量和全局变量

text = "global variable"

#函数中使用的局部变量和全局变量的名字相同
use_local_var_fun()
{
	local text="local varivable"
	echo "In function user_local_var_fun "
	echo $text
}

#输出函数use_local_var_fun内的局部变量值
echo "Execute the function use_local_var_fun"
use_local_var_fun

#输出函数use_local_var_fun外的全局变量值
echo "Out of function use_local_var_fun"
echo $text
exit 0

