#!/bin/bash

#��������ⷽ��


city=(Nanjing Atlanta Massachusetts Marseilles)

echo "Extracting Substring" #��ʾ��ȡ�Ӵ�����
echo ${city[*]:0}  #��ȡ��������
echo ${city[*]:0:2} 

echo 
echo "Removing Substrign"
echo ${city[*]#M*a} #ɾ����M��a������Ӵ�
echo ${city[*]##M*a} #ɾ����M��a����Ӵ�

echo "Replcing Substring"  #��ʾ�滻�Ӵ�����]
echo ${city[*]/M*s/Year}  #�滻��1��M*sƥ����Ӵ�
echo ${city[*]//M*s/Year}  #�滻������M*sƥ����Ӵ�


