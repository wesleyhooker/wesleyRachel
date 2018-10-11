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
ip=`hostname -I`
month=`date +%m`
logDirectory="$HOME/log"


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
       ./retrieveFile.sh $firstYear 
       ((firstYear++))
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
./compressFile.sh
}
#calls program 5 to FTP file to server
systemCall5()
{
    sh ./ftpFile.sh $user $passwd
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

checkError()
{
    if [[ $? -ne 0 ]]
    then
        `mail -s "Error" $email <<< "Error transfering file to FTP $ip Server"`
    fi
}



#OPT ARGUMENTS
while getopts ":f:l:e:u:p:" opt
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
        #?)
           # helpFunc
           # ;;
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
echo
echo "PROGRAM 1"
systemCall1 &>> log
echo
echo "PROGRAM 2"
systemCall2 &>> log
checkError
sleep 1
echo
echo "PROGRAM 3"
systemCall3 &>> log
checkError
echo
echo "PROGRAM 4"
systemCall4 &>> log
checkError
echo
echo "PROGRAM 5"
systemCall5 &>> log
checkError
echo
echo "PROGRAM 6"
systemCall6 &>> log
checkError
echo
echo $?

#MAIL ON SUCCESS
if [[ $? -eq 0 ]]
then
    `mail -s "SUCCESS" $email <<< "Successfully transferred file to FTP $ip Server"`
else
    `mail -s "Error" $email <<< "Error transfering file to FTP $ip Server"`
fi

#CHECKS IF TARGET DIRECTORY FOR LOG EXISTS
if [[ ! -d $logDirectory ]]
then
    echo "Log directory $logDirectory is missing"
    echo "Create folder"

    `mkdir $HOME/log` #creates directory for log
    `mkdir $HOME/log/$month` #creates directory for month
fi
echo >> log
echo "END OF PROGRAM" >> log

#MOVES LOG TO TARGET DIRECTORY
year=`date +%Y-%m-%d`
`mv log  $HOME/log/$month/finalProject_$year.log`

#END OF PROGRAM
echo "DONE"
today= `date`
echo"Today is my the date and time $today" >> log
exit 0
