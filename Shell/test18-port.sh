#!/bin/bash

www='netstat -an|grep LISTIEN|grep :80'
if ["$www" != " "]; then
	echo "www is running"
else
	echo "www is NOT running"
fi

#3.ftp
ftp = 'netsat -an|grep LISTEN|grep :21'
if ["$ftp" != " "]; then
	echo "ftp is running...."
else 
	echo "ftp is NOT running"
fi

#4.ssh
ssh = 'netstat -an|grep LISTEN|grep :22'
if ["$ssh" != " "]; then
	echo "ssh is running..."
else 
	echo "ssh is Not running..."
fi


