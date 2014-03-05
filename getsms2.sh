#!/bin/bash
# A program to listen for SMS, with the aid of crontab, from Google Voice and
#reply with some system, internet, or other data

#Uses a getmail script to grab emails
getmail -r ~/.getmail/getmail.gmail

#Checks for mail and if there is none it doesn't run the rest of the script.
if [ -f ~/mail/new/* ]
then

#Removes and recreates any old tmp file if ones exists
if [ -f ~/.text/tmp ]
then
rm ~/.text/tmp
echo "Deleted Old tmp File"
touch ~/.text/tmp #Recreates tmp
fi

#Searches incoming mail for a the string ##! which denotes the message intended for
#recieving. Saves output to the previously created tmp file.
cat ~/mail/new/* | grep -m 1 '#tri' >> ~/.text/tmp

#Defines TEXTER as the sender of the text
TEXTER=$(grep "SMS from" ~/mail/new/* | grep -o [0-9] | tr -d '\n')


#Stores the contents of tmp to SMS
SMS=$(cat ~/.text/tmp)

#Backs up emails to ~/mail/bak
mv ~/mail/new/* ~/mail/bak/

#Uses a python script to send a $SMS if there is new mail
python ~/.text/masstexttriangle.py "$SMS"

fi
