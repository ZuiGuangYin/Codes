#!/bin/bash

declare -a arrivedcity #��arrivedcity����Ϊ����

echo "What city have you been arrived?"
echo "The input should be separated from each other by a space"
read -a arrivedcity #���û�����洢��arrivedcity����
echo

#forѭ����������ȫ������
for i in "${arrivedcity[@]}"
do
	echo "$i"
done

echo "The length of this array is ${#arrivedcity[@]}."
echo "Executing UNSEToperation...."
unset arrivedcity[1]

echo "The length of this array is ${#arrivedcity[@]}."
ech "Executing UNSET operation...."
unset arrivedcity  #�����������
echo "The lengh of this array is ${arrivedcity[@]}"

