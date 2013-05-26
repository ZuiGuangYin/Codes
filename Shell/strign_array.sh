#!/bin/bash

#数组的特殊方法


city=(Nanjing Atlanta Massachusetts Marseilles)

echo "Extracting Substring" #演示抽取子串功能
echo ${city[*]:0}  #抽取整个数组
echo ${city[*]:0:2} 

echo 
echo "Removing Substrign"
echo ${city[*]#M*a} #删除从M到a的最短子串
echo ${city[*]##M*a} #删除从M到a的最长子串

echo "Replcing Substring"  #演示替换子串功能]
echo ${city[*]/M*s/Year}  #替换第1与M*s匹配的子串
echo ${city[*]//M*s/Year}  #替换所有与M*s匹配的子串


