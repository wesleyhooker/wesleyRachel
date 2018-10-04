#!/bin/bash -
#===============================================================================
#
#          FILE: expandFile.sh
#
#         USAGE: ./expandFile.sh
#
#   DESCRIPTION: Expands the tar.gz files
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:13:27 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

echo "PROGRAM 2:" >> log
#create temp folder to expand tar.gz files in
`mkdir temp &>> log`
#check exit code
if [[ $? -ne 0 ]]
then
    echo
fi

#unzip and untar the files retrieved from wget
#"-zxvf" will untar and unzip in one command
#"-C temp/" is the directory where the files will extract
echo "Untaring Files" >> log
`tar -zxvf *.tar.gz -C temp/ &>> log`
#having trouble printing both MOCK DATA files at once#

#print the first name, lastname, email.
#file to be printed located in temp/MOCK_DATA
#Send awked cust info to temp/info.csv
echo "Retrieving first, last and email" >> log
`awk -F',' '{ print $2", "$3", "$4 }' temp/MOCK_DATA*.csv > temp/info.csv`
exit 0
