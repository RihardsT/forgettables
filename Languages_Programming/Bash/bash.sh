######################## Comments ##############################################
# Simple pimple comments with #

######################## Print #################################################
echo "This stuff"

######################## Operators #############################################
%
! && ||

# Arithmetic evaluation:
$(( )) #http://www.gnu.org/software/bash/manual/bashref.html#Arithmetic-Expansion

######################## Comparators ###########################################
# Generaully use test for comparing variables. man test
-gt
-eq

######################## Variables #############################################
# Get file into array. Line by line. Without the cut, array[0] is the whole file
# Would be nice, if I'd find a proper newline delimiter here
subjects=( $(cat subjects| cut -d' ' -f1) )

arrayName=(Value1 Value2 Value3 .. ValueN)
${arrayName[0]} # This is how to access the item
${#arrayName[*]} # Array size




######################## if else ##############################################
# man test # for expressions usable in if statements
# -z to check if variable is empty.
if [ -z ${MYWLANIP} ]; then echo "Yep"; fi
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





######################## Loops ################################################
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

######################## Functions #############################################