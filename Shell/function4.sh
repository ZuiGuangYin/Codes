#!/bin/bash

#该函数实现将n的值减半
half()
{
	let "n = $1"
	let "n = n/2"
	echo "In functio half() n is $n"
}

#函数调用
let "m = $1"
echo "Before the function half() is called ,m is $m"
half $m
echo "After the function half() is called, m is $m"

