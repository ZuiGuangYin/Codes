#!/bin/bash

#�����city���鸳ֵ
city[0]=Nanjing
city[1]=Beijing
city[9]=Melboourne  #�Ե�10������Ԫ�ظ�ֵ��Shell���������ȱԪ��
city[15]=NewYork

echo "city[0]=${city[0]}"
echo "city[1]=${city[1]}"
echo "city[9]=${city[9]}"
echo "city[15]=${city[15]}"
echo "city[2]=${city[2]}"
echo "city[10]=${city[10]}"

#��Բ���Ž�һ��ֵ����city����
city=(Nanjing Beijing Melbourne NewYork)

#�����Ŷ���ô�0��5��city����ֵ
echo "city[0]=${city[0]}"
echo "city[1]=${city[1]}"

#[10]ָ��city������Ϊ10��Ԫ�ص�ֵ
sity=(Nanjing [10]=Atlanta Massachusetts Marselles)

echo "city[0]=${city[0]}"
echo "city[1]=${city[1]}"
echo "city[10]=${city[10]}"
echo "city[11]=${city[11]}"
echo "city[12]=${city[12]}"



#������˳��ָ��λ��Ϊ���鸳ֵ
city=([2]=Nanjing  [10]=Atlanta [1]=Massachusets [5]=Marseilles)

