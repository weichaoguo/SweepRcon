#!/bin/bash

TIMEOUT=2
COUNT=2
IP_PREFIX=$1
USERNAME=$2
PASSWORD=$3
if [ $0 -ne 3 ]
then
    echo "./sweep_rcon.sh IP_PREFIX (such as: 192.168.1) USERNAME PASSWORD"
    exit
fi
for ((i=1; i<=255; i++));
do
    lines=`ping -w $TIMEOUT -c $COUNT $IP_PREFIX.$i | wc -l`;
    if [ $lines -gt 5 ]
    then
        rdesktop -u $USERNAME -p $PASSWORD $IP_PREFIX.$i
    fi
done
