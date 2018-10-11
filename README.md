# wesleyRachel

RetreiveFile
    This shell gets the web file depending on the year that is passed in as its
    first argument.
    
    Usage: ./retreiveFile.sh [Date]


ExpandFile
    This shell expands the files that were retreived from the web. Meaning
    it will untar and unzip the files and store the expanded files in the
    temp folder.

    Usage: ./expandFile.sh


ParseFile
    This shell will check the expanded files in the temp folder and retrieve
    only the information of canadian females. It will save this information in
    canadianFemales.csv inside of the temp folder.

CompressFile
    This shell creates a zip file from the previously parsed files named canadianFemales.csv.
    It renames it to wesleyRachel_DATA_FILTER_$timestamp.zip

    Usage: ./compressFile.sh
ftpFile
    This shell copies the filename to the ftp files folder.
    It then connects through ftp to the other host and signs in automatically therefore
    transferring the file.

    Usage: ./ftpFile [User] [Passwd]
cleanFile
    This shell removes the temp file as well as anything in it.

    Usage: ./cleanFile.sh

main
    This is the main shell. Pass in the correct arguments and it will call 
    every other shell. Main creates a log file that will be kept at the root
    directory. The log will be saved according to the date:time. Emails the user
    information about errors.

    Usage: ./main.sh [-f first year] [-l last year] [-e email] [-u user] [-p passwd]
    First Year, Last Year and Email are required.

