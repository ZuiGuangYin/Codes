#!/bin/bash

city=(Nanjing Beijing Melbourne NewYork)  #数组赋值

for i in ${city[@]}   #  @和*代表全部
do
	echo $i
done


