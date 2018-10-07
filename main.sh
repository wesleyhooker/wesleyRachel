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

#set -o nounset                                  # Treat unset variables as an error

#GLOBAL VARIABLES
have_f=0
have_l=0
have_e=0

#START PROGRAM MESSAGES
echo "STARTING MAIN"
echo >> log
echo "STARTING MAIN" >> log




#SYSTEM CALLS
##################################
#calls program 1
#loops over years and passes in values to retreivefile.sh
systemCall1()
{
    while [[ $firstYear -le $lastYear ]]
    do
        sh ./retrieveFile.sh $firstYear &>> log
        firstYear=$((firstYear+1))
    done
}
#calls program 2 to expand files downloaded
systemCall2()
{
sh ./expandFile.sh
}
#calls program 3 to filter data
systemCall3()
{
sh ./parseFile.sh
}
#calls program 4 to compress data
systemCall4()
{
sh ./compressFile.sh
}
#calls program 5 to FTP file to server
systemCall5()
{
    sh ./ftpFile $user $passwd
}
#Calls program 6 to rm temp file directory
systemCall6()
{
    sh ./cleanFile.sh
}
##################################

#HELP FUNCTION
helpFunc()
{
    echo "Usage: $0 [-f first year] [-l last year] [-e email] [-u user] [-p passwd]"
    echo "First Year, Last Year and Email are required."
    exit 1
}




#OPT ARGUMENTS
while getopts ":f:l:e:u:p" opt
do
    case $opt in
       f)
           have_f=1
           firstYear=$OPTARG
           ;;
        l)
            have_l=1
            lastYear=$OPTARG
            ;;
        e)
            have_e=1
            email=$OPTARG
            ;;
        u)
            user=$OPTARG
            ;;
        p)
            passwd=$OPTARG
            ;;
        ?)
            helpFunc
            ;;
        *)
            helpFunc
            ;;
    esac
done

#CHECK FOR REQUIRED ARGUMENTS
if [[ $have_f -eq 0 || $have_l -eq 0 || $have_e -eq 0 ]]
then
    helpFunc
fi

#RUN MAIN PROGRAM
systemCall1
systemCall2
systemCall3
systemCall4
systemCall5
systemCall6
#mail
ip=`hostname -I`
`mail -s "SUCCESS" $email <<< "Successfully transferred file to FTP $ip Server"`
#redirect
month=`date +%m`
`mkdir $HOME/log` #creates directory for log
`mkdir $HOME/log/$month` #creates directory for month
year=`date +%Y-%m-%d`
`mv $HOME/log/$month/finalProject_$year.log`


#END OF PROGRAM
echo >> log
echo "END OF PROGRAM" >> log
echo "DONE"
exit 0
