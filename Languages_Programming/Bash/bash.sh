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


for i in "${arrayName[@]}"
do
  echo $i
done