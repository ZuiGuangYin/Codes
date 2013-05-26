#!/bin/bash
#Using for and loop
# user 2008/05/20

declare -i s #  <== ÉùÃ÷±äÁ¿
for ((i=1; i<=100; i=i+1))
do 
	s = s+i
done
echo "The count is ==> $s"


