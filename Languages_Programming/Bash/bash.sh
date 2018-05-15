######################## Comments ##############################################
# Simple pimple comments with #

######################## Command chaining
# A; B    Run A and then B, regardless of success of A
# A && B  Run B if A succeeded
# A || B  Run B if A failed
# A &     Run A in background.

######################## Print #################################################
echo "This stuff" # -n flag to disable new line in terminal
# echo special chars. Use echo with -e flag to interpret these. echo -e "Hi\nhi"
\\ # backslash
\a # alert
\b # backspace
\c # supress trailing newline
\f # form feed
\r # carriage return
\t # horizontal tab
\v # vertical tab
\n # newline

# Metachars: * ? [ ] ' " \ $ ; & ( ) | ^ < > new-line space tab

######################## Operators #############################################
! # Negate. [ ! false ]
&& # AND operator. Same as -a
|| # OR operator. Same as -o

= # String equality operatot. [ "abc" = "ad" ]. Also assignment for vars, lel
!= # Not euqal [ $a = $b ]
-z # If string is of size 0 [ -z "" ]; echo $?
-n # # If string is not of size 0 [ -z " " ]; echo $?
[ $a ] # Same as -n ? Checks if string is not empty

# Arithmetic evaluation:
$(( )) #http://www.gnu.org/software/bash/manual/bashref.html#Arithmetic-Expansion

## Arithmetic operators with expr
+ - \* / %
expr $a + $b

### File operators
-b FILE # Check if file is block special file [ -b $FILE ]
-c FILE # if character special file
-d FILE # if file is directory
-f FILE # if ordinary file
-g FILE # if group ID (SGID) bit is set
-k FILE # if sticky bit is set
-p FILE # if file is name pipe
-t FILE # if file descriptior is open and associated with terminal
-u FILE # if user ID (SUID) bit is set
-r FILE # if reeadable
-w FILE # if writeable
-x FILE # if executable
-s FILE # if size greather than 0
-e FILE # if file exists


######################## Comparators ###########################################
# Generaully use test for comparing variables. man test
-eq # Equals
-ne # Not Equals
-gt # a greather than b
-lt # a less than b
-ge # a greater or euqals b
-le # a less or euqals b
[ $a -eq $b ] # This is how to use them. Note the spaces
[ $a == $b ] # check equality. Works for strings
[ $a != $b ]


######################## Variables #############################################
# Variable names can't start with number. Can start with a letter or _
VARIABLE="Make it read only after assignment with readonly command"
readonly VARIABLE
unset VARIABLE # Remove var from shell. Can't unset readonly variables

### Special Variables
$0 # Current script filename
$n # Arguments that are passed to script. $1 $2
$# # Numeber of args passed to script
$* # All args as single string ? for TOKEN in $*; do echo $TOKEN; done
$@ # All args as array of strings?
$? # Exit status of last command
$$ # PID of current shell
$! # PID number of last bacground command

# Get file into array. Line by line. Without the cut, array[0] is the whole file
# Would be nice, if I'd find a proper newline delimiter here
subjects=( $(cat subjects| cut -d' ' -f1) )

arrayName=(Value1 Value2 Value3 .. ValueN)
${arrayName[0]} # This is how to access the item
${#arrayName[*]} # Array size

${array_name[*]} # Get all array items at once
${array_name[@]}

# Variable substitions
${var}
${var:="Default"} # If var is unset it will be set to default value here
${var:-"Message if var is unset"} # If var is unset, will print message. Will not assign value
${var:+"Message if var is set"} # If var is set. var value will not change
${var:?"Error Message if var unset"} # If var is unset, prints stderr



######################## if else ##############################################
# man test # for expressions usable in if statements
# -z to check if variable is empty.
if [ -z ${MYWLANIP} ]; then echo "Yep"; fi
# -z to check if output is empty.
if [ -z "$(ls -a | grep stuff)" ]; then echo "Yep"; fi
# -n to check if variable is not empty.
if [ -n ${MYWLANIP} ]; then echo "Yep"; fi
if [[ -n $1 ]] && [[ -r $1 ]] # File Exists and is readable


# if with OR
if [ ${MYIP} != ${LASTIP} ] || [${MYWLANIP} != ${LASTIP}]
then
  echo "yes"
elif [ -z ${MYWLANIP} ]
  echo "Oh hey. An elif example."
else
  echo "nay"
fi
# If string equals a string
if [ $(uname -m) = "x86_64" ]; then echo "Yep"; fi


# case
case word in
  pattern )
    ;;
esac

######################## Loops ################################################
# Can use break and continue keywoards
# continue breaks out of current iteration. Will skip code below continue to go to next iteration
# break goes out whole loop

for i in "${arrayName[@]}"
do
  echo $i
done

echo "Array items:"
for item in ${array[*]}
do
    printf "   %s\n" $item
done

echo "Array indexes:"
for index in ${!array[*]}
do
    printf "   %d\n" $index
done

echo "Array items and indexes:"
for index in ${!array[*]}
do
    printf "%4d: %s\n" $index ${array[$index]}
done

# Example of continue keywoard
NUMS="1 2 3 4 5 6 7"
for NUM in $NUMS
do
   Q=`expr $NUM % 2`
   if [ $Q -eq 0 ]
   then
      echo "Number is an even number!!"
      continue
   fi
   echo "Found odd number"
done

# While
a=0
while [ "$a" -lt 10 ]
do
   a=`expr $a + 1`
   echo $a
   if [ $a -eq 5 ]; then
      break
   fi
done

# until
a=10
until [ $a -lt 10 ] # Infinite loop because of condition
do
   echo $a
   a=`expr $a + 1`
done

######################## Functions #############################################
function_name () {
   # code
   # return 2
}
