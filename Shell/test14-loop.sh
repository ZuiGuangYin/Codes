#ʹ��while
#!/bin/bash

declare -i i
declare -i s
while ["$s" != "101"]
do 
	s=s+i
	i=i+1
done
echo "The count is ==> $s"


#ʹ��until
until ["$i" = "101"]
do 
	s=s+i
	i=i+1
done
echo "The count is ==> $s"

#ѭ�����
LIST="Tomy Jony Mary Geoge"
for i in $LIST
do
	echo i  #�Կո���i����

done

