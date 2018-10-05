#!/bin/bash -
#===============================================================================
#
#          FILE: sshFile.sh
#
#         USAGE: ./sshFile.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:15:10 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

#log
echo"PROGRAM 5:" >>log

#variables from main.sh
user=$1
passwd=$2
fileName=$3
fileDirectory="/home/wsu007/ftp/files/"
host="icarus.cs.weber.edu"

#check if user AND password exist
if [[ ! -z "$user" && ! -z "$passwd" ]]
then 
    echo"user and passwd both defined"
    #put file in $HOME/ftp/files
    cp $fileName $fileDirectory

    #automatically sends through ftp
    ftp -n $host <<END_SCRIPT
    quote USER $user
    quote PASS $passwd
    put $fileName
    quit
    #create log

 else
    echo "Enter both a user name and password"
fi
