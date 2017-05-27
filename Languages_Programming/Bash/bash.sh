######################## Comments ##############################################
# Simple pimple comments with #

######################## Print #################################################
echo "This stuff"

######################## Operators #############################################
######################## Comparators ###########################################

######################## Variables #############################################
# Get file into array. Line by line. Without the cut, array[0] is the whole file
# Would be nice, if I'd find a proper newline delimiter here
subjects=( $(cat subjects| cut -d' ' -f1) )
${arrayName[0]} # This is how to access the item



######################## if else ##############################################
# man test # for expressions usable in if statements
# -z to check if variable is empty.
if [ -z ${MYWLANIP} ]; then echo "Yep"; fi
# -n to check if variable is notempty.
if [ -n ${MYWLANIP} ]; then echo "Yep"; fi

# if with OR
if [ ${MYIP} != ${LASTIP} ] || [${MYWLANIP} != ${LASTIP}]
then
  echo "yes"
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

######################## Functions #############################################