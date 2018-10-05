#!/bin/bash -
#===============================================================================
#
#          FILE: parseFile.sh
#
#         USAGE: ./parseFile.sh
#
#   DESCRIPTION: filters data according to requirements
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:09:42 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

echo >> log
echo "PROGRAM 3:" >> log

#replace empty email fields with null
#finds empty email strings in MOCK_DATA files
#replaces empty email strings with default waldo email
echo "Finding and replacing empty email values" >> log
`sed -i 's/,,/,waldo@weber.edu, /g' temp/MOCK_DATA*.csv`

#only canadian female residents
#awk delimiter = ,
#if female and from canada
#print first, last, email
#file to be awked = temp/MOCK_DATA*.csv
#output saved to temp/canadianFemales.csv
echo "Printing canadian females to output file \"canadianFemales.csv\"" >> log
`awk -F',' '{if($4 == ""){$4=fart}if($5 == "Female" && $6 == "Canada"){print $2", "$3", "$4} }' temp/MOCK_DATA*.csv > temp/canadianFemales.csv`
