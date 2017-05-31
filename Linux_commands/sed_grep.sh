# Return portion after match
sed -n -e 's/FROM //p' Dockerfile
# Replace something in file. sed can take different delimiters. Here it's #. g for global, everywhere where the expression is found
sed -i 's#FROM #FROM armhf/#g' Dockerfile
# -i to do apply changes to the same file
# Remove lines FROM TO. http://www.yourownlinux.com/2015/04/sed-command-in-linux-delete-lines-from-file.html
sed -i '55,56 d' Dockerfile
# Remove last line in file
sed -i '$ d' Dockerfile
# Delete lines containing a pattern. Can use !d to delete lines NOT containing pattern
sed '/PATTERN/ d' FILE

# Return the line with the match
grep "^s[0-9].*" FILE
# grep with OR \|
grep "^s[0-9].*\|wave.*" actionLabel.txt


# Remove newlines in file
tr -d "\n\r" < input_filename
# Replace newlines with \\n
sed ':a;N;$!ba;s/\n/\\n/g' file
# Replace newlines with \\n
sed -z 's/\n/\\n/g' file