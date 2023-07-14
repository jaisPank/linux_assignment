#!/usr/bin/bash


#Question 1
# Find all files in a directory larger than 10 kb.

# To find Command used : find 
# flag used : -type => for type of file
# flag used : f => regular file
# flag used : size => File size

find -type f -size +10k


#Question 2

#Find private IP address of your device.

# To find private ip of device.
# we have various command
# Command 1 : ifconfig a
# Command 2 : ip a
# Command 3 : hostname -I
# For command 1 and 2 , it gives all other details of wlan , eth and loopback.
# Command 3 , give private ip of device

hostname -I


#Question 3

#Find all commands from history which contains ‘sudo’.

# For above query , we will use pipeline method "|". In pipeline output of one
# command is given to input of other command

# command used : history => give all command entered in terminal
# Command used : grep = > it matches a given string via regular expression

history | grep "sudo"


#Question 4

#Write command for stopping a process on a specific port number.

#Command used : netstat -nlp | grep :5353 | awk '{print $6}' | cut -d/ -f1
# Command Used : netstat -nlp | grep :5353 | awk '{print $6}' | awk -F "/" '{print $1}'
## At last we can use kill command.

##netstat command gives all details of a process with pid, port number,process name, We can use flag -nlp for listening ,disable
#grep command is used as filter for given port number
# awk command is used as cut and get value of column six, we can also use cut command
#cut command is used to cut with specifi delimiter , and then value is take for any use. We can also use awk command also

kill $(netstat -nlp | grep :5353 | awk '{print $6}' | cut -d/ -f1)




#Question 5

#Count the number of lines in a text file.


#Coomand used : wc => word count , this comman give line number, word count, character. 
#if used with flag , then we get a specfic output
#For example if flag -l , then it gives total number of lines in a file

wc -l file.txt
