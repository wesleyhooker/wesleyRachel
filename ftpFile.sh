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
#will work if there is /temp/candianFemales.csv
#log
#echo"PROGRAM 5:" >>log

#variables from main.sh
user=$1
passwd=$2
fileName="temp/canadianFemales.csv"
fileDirectory="$HOME/ftp/files/"
host="137.190.19.85"

    cp $fileName $fileDirectory

ftp -inv $host <<EOF
    user $user $passwd
    cd files/
    put $fileName
    bye
EOF
   
    
