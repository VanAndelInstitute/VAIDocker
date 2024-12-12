#!/bin/bash

USERID=`id -u`
if [ "$USERID" -gt "1350000000" ]  && [ ! -e $HOME ]; then
	echo "User Home directory does not exist, are you a new HPC user?"
	echo "please reach out to HPC support to have your account enabled"
	logger "NO_HOME_DIR for $USER on $HOSTNAME"
	exit
fi

