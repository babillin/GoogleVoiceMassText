#!/usr/bin/bash

number=$(perl getnumbers.pl)
message=$(perl getmessage.pl)

if [[ -n $number ]]; then
	echo $number
fi

if [[ -n $message ]]; then
	echo $message
fi