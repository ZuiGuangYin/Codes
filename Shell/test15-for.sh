#��Linux�����ϵ��˺�(account)��ʾ����������cut��sort�Լ�/etc/passwd�ļ�
#!/bin/bash

account 'cut -d ":" -fl /etc/passed|sort'
echo "The following is your linux server's account"
for i in $account
do 
	echo $i
done


