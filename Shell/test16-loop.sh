#������Y��yʱ,�������
#!/bin/bash

echo "Press Y/y to stop"
until ["$yn" = "Y" ] || [ "$yn" = "y"]
do 
	read yn
done
echo "Stop here"


