#!/bin/bash -
#===============================================================================
#
#          FILE: retrieveFile.sh
#
#         USAGE: ./retrieveFile.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:12:22 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

year=$1

echo "PROGRAM 1:" >> log

#wget retreives file based on the YEAR input paramater
#redirects stdout and error out to a log using "command &> file"
# "&>>" will append where as "&>" will overwrite
echo "Retrieving Web File" >> log
`wget http://icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz &>> log`

exit 0
