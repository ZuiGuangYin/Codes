#!/bin/bash

declare -a arrivedcity #将arrivedcity声明为数组

echo "What city have you been arrived?"
echo "The input should be separated from each other by a space"
read -a arrivedcity #将用户输入存储到arrivedcity数组
echo

#for循环输出数组的全部内容
for i in "${arrivedcity[@]}"
do
	echo "$i"
done

echo "The length of this array is ${#arrivedcity[@]}."
echo "Executing UNSEToperation...."
unset arrivedcity[1]

echo "The length of this array is ${#arrivedcity[@]}."
ech "Executing UNSET operation...."
unset arrivedcity  #清空整个数组
echo "The lengh of this array is ${arrivedcity[@]}"

