#!/bin/bash

#下面对city数组赋值
city[0]=Nanjing
city[1]=Beijing
city[9]=Melboourne  #对第10个数组元素赋值，Shell允许数组空缺元素
city[15]=NewYork

echo "city[0]=${city[0]}"
echo "city[1]=${city[1]}"
echo "city[9]=${city[9]}"
echo "city[15]=${city[15]}"
echo "city[2]=${city[2]}"
echo "city[10]=${city[10]}"

#用圆括号将一组值赋给city数组
city=(Nanjing Beijing Melbourne NewYork)

#输出比哦啊好从0到5的city数组值
echo "city[0]=${city[0]}"
echo "city[1]=${city[1]}"

#[10]指定city数组标号为10的元素的值
sity=(Nanjing [10]=Atlanta Massachusetts Marselles)

echo "city[0]=${city[0]}"
echo "city[1]=${city[1]}"
echo "city[10]=${city[10]}"
echo "city[11]=${city[11]}"
echo "city[12]=${city[12]}"



#以任意顺序指定位置为数组赋值
city=([2]=Nanjing  [10]=Atlanta [1]=Massachusets [5]=Marseilles)

