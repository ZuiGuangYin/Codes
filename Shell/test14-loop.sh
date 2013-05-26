#使用while
#!/bin/bash

declare -i i
declare -i s
while ["$s" != "101"]
do 
	s=s+i
	i=i+1
done
echo "The count is ==> $s"


#使用until
until ["$i" = "101"]
do 
	s=s+i
	i=i+1
done
echo "The count is ==> $s"

#循环输出
LIST="Tomy Jony Mary Geoge"
for i in $LIST
do
	echo i  #以空格当作i变量

done

