/bin/bash -
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


`wget -r http://icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$year.tar.gz`


exit 0
