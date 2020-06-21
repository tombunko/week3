#!/bin/bash 

# This function creates a calcuator type function:
# Initilize the working variables

exit="N"                # keep showing menu while parameter is equal to "N"
string=""               # string holds the formulae with colors
string2=""              # string to hold the formulae without colors
result=0                # the total of the formulae
interact=""             # the info number or function read from the person
quit="q"                # the quit code
clear="c"               # the clear code
calccolor="white"       # white, to show formula if unknown action
add="blue"              # blue - color to show if addition
sub="green"             # green - color to show if subtraction
mult="red"              # red - color to show if multiplication
div="purple"            # purple - color to show if division
declare total2          # set total2 to an integer value

while [ $exit = "N" ]; do

	clear
	echo ""
	echo -e "      \e[40;38;5;82m    Simple Calculator \e[0m"  #header banner style
	echo ""
	echo -e " \e[1;4m Operators \e[0m"      #bold and underline
	echo "     + - Add"
	echo "     - - Subtract"
	echo "     * - Multiply"
	echo "     / - Divide"
	echo ""
	echo -e " \e[1;4m Other Functions \e[0m"      #bold and underline
     	echo "     Other functions"
        echo ""
        echo "     c - Clear, and start new calculation"
        echo "     q - Quit calculator"
        echo ""
	echo -e " \e[1;4m Instructions \e[0m"      #bold and underline
	echo ""
	echo "     Enter the operator, the integer value, or an other function, pressing enter after each selection."
	echo "     You may also enter numbers and functions all at once, but you must separate each with a space."
	echo "     Multiplications and divisions work using math rules. (i.e. done before any addition or subtraction.)"
	echo ""
	echo "     Colors: Blue - Add, Green - Subtract, Purple - Divide, Red - Multiply"
	echo "     The color of red/green/blue or purple is only assigned if entering the operator seperately from the"
	echo "         numeric values, and assigned for the last operator entered."
        echo ""   
     	
	case "$calccolor" in 
		white ) echo -e "     \e[1;4m Formula: \e[0m $string \e[0m"  # \e[1;4 is underline and bold, \e[0m no formatting
			;;
		blue ) echo -e "     \e[1;4m Formula:  \e[0m \e[34m $string \e[0m"
			;;	
                green ) echo -e "     \e[1;4m Formula:  \e[0m \e[32m $string \e[0m"
			;;
                red ) echo -e "     \e[1;4m Formula:  \e[0m \e[31m $string \e[0m"
			;;
                purple ) echo -e "     \e[1:4m Formula:  \e[0m \e[35m $string \e[0m"
			;;

         esac
      
        echo ""
	echo ""
	echo -e "      \e[40;38;5;82m    The Total Is:  $total2 \e[0m"
	

	read interact     #whatever the operator enters in the screen
		     
	if [ "$interact" == "$quit" ]; then
	
		exit="Y"
	
	        elif [ "$interact" == "$clear" ]; then
	        	string=""
			total2=0
	       	else
                
	        notnum="n"		
		if [ "$interact" == "+" ]; then	
			newstring="${string} ${interact}"    #add each entry as it is being coded
			calccolor="blue"                     #set color to the addition color

		elif [ "$interact" == "-" ]; then
                        newstring="${string} ${interact}"    #add each entry as it is being coded
			calccolor="green"                    #set color to the subtraction color

                elif [ "$interact" == "*" ]; then
                        newstring="${string} ${interact}"    #add each entry as it is being coded
			calccolor="red"                      #set color to the multiplication color

                elif [ "$interact" == "/" ]; then
                        newstring="${string} ${interact}"    #add each entry as it is being coded
			calccolor="purple"                   #set color to the divide color
                else
                        newstring="${string} ${interact}"    #add each entry as it is being coded
			notnum="y"
                fi   
			
		string=$newstring

		if [ "$notnum" == "y" ]; then
			total2=$((${string}))	
		fi
	fi
	
done
