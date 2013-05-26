#将Linux主机上的账号(account)显示出来，利用cut和sort以及/etc/passwd文件
#!/bin/bash

account 'cut -d ":" -fl /etc/passed|sort'
echo "The following is your linux server's account"
for i in $account
do 
	echo $i
done


