#!/bin/bash -
#===============================================================================
#
#          FILE: compressFile.sh
#
#         USAGE: ./compressFile.sh
#
#   DESCRIPTION: Zip file back up
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:13:59 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

#compress final filter data file

#fileName being passed in
fileName="/temp/canadianFemales.csv"

#timestamp (YYYY-MM-DD-HH)
timestamp=`date +%Y-%m-%d:%M`

# zip <zippedFileName> <fileBeingZipped>

echo "PROGRAM: 4" >> log

`zip wesleyRachel_DATA_FILTER_$timestamp.zip $fileName &>> log`

