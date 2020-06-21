#!/bin/bash

# This program prompts for the secret password,
# creates a hash of the password entered, 
# then compares the hash value against the hash value stored in file secret.txt

# If the password entered is correct, it issues a menu for the operator to choose one of the following:
#   1) to create a new folder (runs script foldermaker.sh)
#   2) to copy a folder (runs script foldercopier.sh)
#   3) to set a password (runs script password.sh)

# ask for the password, hash it using sha256, then compare to the one stored in file secret.txt
exit="N"


read -sp "enter password. " user_password        # get password
echo $user_password | sha256sum > testpwd.txt
#hashedpw=$user_password | sha256sum             # get hash value of entered password
hashedpw="$(cat testpwd.txt)"
savedpw="$(cat secret.txt)"                      # load value of secret.txt to variable savedpw

if [ "$hashedpw" == "$savedpw" ]; then           # if equal, the hashed password matches the entered hashed password
	echo "Access Granted"
while [ $exit = "N" ]; do                        # set $exit to "N" to keep in loop, anything else to exit

	clear
	echo ""
	echo -e "      \e[40;38;5;82m    MegaMenu \e[0m"  #header banner style
	echo ""
	echo -e " \e[1;4m Select an Option \e[0m"         #bold and underline
        echo ""
	echo "     1 - Create a Folder"                #runs foldermaker.sh
	echo "     2 - Copy a Folder"                  #runs foldercopier.sh
	echo "     3 - Set the Password"               #runs password.sh
	echo "     4 - Calculator"                     #runs calculator.sh
	echo "     5 - Create Week Folders"            #runs weekfolders.sh
	echo "     6 - Check Filenames"                #runs filenames.sh
	echo "     7 - Download a File"                #runs InternetDownloader.sh
	echo "     8 - Quit"                           #ends the program
	echo ""
        echo -e " \e[1m Make your Selection: \e[0m"    #Show selection message
	read interact                                  #Read selection

#	string=$interact
	case "$interact" in
		1 ) ./foldermaker.sh                   # 1 has been selected
			echo "" 
			read -p "Press Enter to Continue" keyin
			;;
		2 ) ./foldercopier.sh                  # 2 has been selected
			echo ""
			read -p "Press Enter to Continue" keyin
			;;
                3 ) ./password.sh                      # 3 has been selected
			echo ""
			read -p "Press Enter to Continue" keyin
			;;
		4 ) ./calculator.sh                    # 4 has been selected
			echo ""
			read -p "Press Enter to Continue" keyin
			;;
		5 ) read -p "Enter week number of first folder to create: " FrmWeek
			read -p "Enter week number of last folder to create: " ToWeek
			./megafoldermaker.sh $FrmWeek $ToWeek       # 5 has been selected 
			echo ""
			read -p "Press Enter to Continue" keyin
			;;
		6 ) read -p "Enter File name to check:  " Namein    # 6 has been selected
			./filenames.sh $Namein          
			echo ""
			read -p "Press Enter to Continue" keyin
			;;
		7 ) ./InternetDownloader.sh            # 7 has been selected
			echo ""
			read -p "Press Enter to Continue" keyin
			;;
		8 ) exit="Y"                           # 8 (exit) has been selected
			;;
                q ) exit="Y"                           # q for quit has been selected    
			;;
		Q ) exit="Y"                           # Q for quit has been selected 
			;;	
	esac
done

else
	echo ""                                        # failed password attempt
	echo "Access Denied"                           # issue a message to tell them logon failed
	echo "Goodbye"
	echo ""
	echo -en "\007"                                # make a sound to attract attention
	return=1
fi





