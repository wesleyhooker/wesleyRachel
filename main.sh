#!/bin/bash -
#===============================================================================
#
#          FILE: main.sh
#
#         USAGE: ./main.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wesley Hooker (Whooker), wesleyhooker@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/01/2018 03:11:41 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

have_f=0
have_l=0
have_e=0

#calls program 1 to retrieve files
systemCalls1()
{
    echo "Calls program 1"
    #for (int i = firstYear)
}
#calls program 2 to expand files downloaded
systemCalls2()
{
    echo "Calls program 2"
}
#calls program 3 to filter data
systemCalls3()
{
    echo "Calls program 3"
}
#calls program 4 to compress data
systemCalls4()
{
    echo "Calls program 4"
}
#calls program 5 to FTP file to server
systemCalls5()
{
    echo "Calls program 5"
}


helpFunc()
{
    echo "Usage: $0 [-f first year] [-l last year] [-e email] [-u user] [-p passwd]"
    echo "Both arguments are required"
    exit 1
}


while getopts ":f:l:e:u:p" opt
do
    case $opt in
       f)have_f=1
           firstYear=$OPTARG
           ;;
        l)have_l=1
            lastYear=$OPTARG
            ;;
        e)have_e=1
            email=$OPTARG
            ;;
        u) user=$OPTARG
            ;;
        p) passwd=$OPTARG
            ;;
        ?) helpFunc
            ;;
        *) helpFunc
            ;;
    esac
done

if [[ $have_f -eq 1 && $have_l -eq 1 && $have_e -eq 1 ]]
then
    echo "Have required information"
    systemCalls1
else
    helpFunc
fi

exit 0
