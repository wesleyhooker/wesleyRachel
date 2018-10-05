#!/bin/bash -
#===============================================================================
#
#          FILE: cleanFile.sh
#
#         USAGE: ./cleanFile.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:15:27 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
#Delete temp folder from program 2
echo "PROGRAM 6:" >>log

echo "Cleaning temporary files">>log
#move into temp directory
#remove all files
cd tmp/
rm *
#cd out of the directory 
#remove directory
cd ..
rmdir tmp/
echo "Directory & files removed" &>>log

#Log activity
