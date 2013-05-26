#!/bin/bash

echo "Press y to continue"
read yn
if ["$yn" = "y" ]; then
	echo "script is running..."
else
	echo "STOP!"
fi


echo "Press y to continue"
read yn
if ["$yn" = "y"] || ["$yn" = "Y"]; then
	echo "script is runing..."
else
	echo "STOP!"
fi


#²ÎÊý
if ["$1" = "hello"]; then
	echo "Hello! How are you ?"
elif ["$1" = " "]; then
	echo "You MUST input parameters"
else 
	echo "The only accept parameter is hello"
fi

