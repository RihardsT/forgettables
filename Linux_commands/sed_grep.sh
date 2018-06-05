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
# Add text to beginnign of string
sed -i 's/^/test /' FILE


# Return the line with the match
grep "^s[0-9].*" FILE
# grep with OR \|. or statement | || I needed to find this once and I didn't find it easily
grep "^s[0-9].*\|wave.*" actionLabel.txt
# inverse grep. Match anything that doesn't match a pattern
grep -v "PATTERN" FILE
# show 2 lines before and 2 lines after match
grep -B 2 -A 2 'PATTERN' FILE
# Output only after match. -o output only match, -P user perl, \K lookbehind.
grep -oP "PATTERN_BEFORE\KPATTERN_TO_MATCH"
# Output between matches.
grep -oP "(?<=PATTERN_BEFORE)PATTERN(?=PATTERN_AFTER)"
# (?<=PATTERN) == PATTERN\K lookbehind
# (?=PATTER) look ahead


# grep ps aux without grep showing in results. Use [] lel
ps aux | grep "[p]ython3"


# Remove newlines in file
tr -d "\n\r" < input_filename
# Replace <LF> with \\n
sed ':a;N;$!ba;s/\n/\\n/g' file
# Replace <CR><LF> with \n
sed ':a;N;$!ba;s/\r\n/\\n/g' filename
# Replace newlines with \\n
sed -z 's/\n/\\n/g' file
# Remove newlines, to create single line cert
awk 1 ORS=''

# grep multiple lines. -P perl-regexp, -z substitute newline for null char, -o only matching.
grep -Pzo "EXPRESSION" FILE

# Delete lines with pattern
sed '/PATTERN/ d' FILE

# Append line after match
sed  '/pattern/a Hello World' FILE
# Append line before match
sed  '/pattern/i Hello World' FILE

# Remove First N Characters Of Each Line
cut -c 6-
# Print Strings Between First and Last Characters
cut -c 9-20
# Print First N Characters Of Each Line
cut -c 1-20
# Remove Last Character Of Each Line
rev file | cut -c 2- | rev
# Remove Last N Characters Of Each Line
rev file | cut -c 9- | rev


# Find empty lines
^(?:[\t ]*(?:\r?\n|\r))+


### awk
# Output specific column from output
awk '{print $1}'

# First the RS= in awk separates records by the empty lines.
# Then in each record $0, newline and spaces are replaced with +,
# so each enry takes single line in OUTPUT_FILE
VARIABLE=($(awk -v RS= '{gsub(/\n| /,"+",$0); print $0 > "OUTPUT_FILE"}' INPUT_FILE))
