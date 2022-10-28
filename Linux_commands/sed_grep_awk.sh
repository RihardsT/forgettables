# Return portion after match
sed -n -e 's/FROM //p' Dockerfile
# Replace something in file. sed can take different delimiters. Here it's #. g for global, everywhere where the expression is found
sed -i 's#FROM #FROM armhf/#g' Dockerfile
# -i to do apply changes to the same file
# Remove lines FROM TO. http://www.yourownlinux.com/2015/04/sed-command-in-linux-delete-lines-from-file.html
sed -i '55,56 d' Dockerfile
# Remove last line in file
sed -i '$ d' Dockerfile
# Delete first two lines
sed -i '1,2 d' Dockerfile
# Delete lines containing a pattern. Can use !d to delete lines NOT containing pattern
sed '/PATTERN/ d' FILE
# Add text to beginnign of string
sed -i 's/^/test /' FILE
# Remove line with pattern and number of lines after it
sed -i -e '/PATTERN/,+2d' FILE


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

# Not greedy match. ? to match the pattern only once. I was using it so: .+?
#
grep -oP "(?<=PATTERN_BEFORE)PATTERN?(?=PATTERN_AFTER)"

# Repetition
grep -oP "PATTERN+" # match at least once
grep -oP "PATTERN*" # match or no match. Zero or all
grep -oP "PATTERN?" # Match at most once.
grep -oP "PATTERN{n}" # match at least n times
grep -oP "PATTERN{n,m}" # match n to m times. {n,} to match n to inf


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
# (?s) - to make . match chars and newlines
grep -Pzo "(?s)EXPRESSION" FILE
# awk multiple lines - nice and simple
awk '/START/,/END_OF_PATTERN/' FILE

# Delete lines with pattern
sed '/PATTERN/ d' FILE

# Append line after match
sed '/pattern/a Hello World' FILE
sed -i '/pattern/a\   Hello World' FILE # Including spaces
# Append multiple lines after match. a\ and then \a for line breaks.
sed '/pattern/a\
LINE1\
LINE2' FILE
# Append multiple lines after match with different delimiter
# Finds pattern, then in substitute matches the whole line with .*
# & selects the matched line, \ for line break, append new lines.
sed '/PATTERN/s#.*#&\
LINE1\
LINE2#' sed_test.txt
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


# Change uppercase to lowercase
tr '[:upper:]' '[:lower:]' < FILE


### awk
# Pattern matching and output column
awk '/PATTERN/ {print $1}'
# Output specific column from output
awk '{print $1}'
# Output last column
awk '{print $(NF)}'
# 2 columns before last
awk '{print $(NF-2)}'
# awk delimiter. Here a .
awk -F'.' '{print $1}'

# First the RS= in awk separates records by the empty lines.
# Then in each record $0, newline and spaces are replaced with +,
# so each entry takes single line in OUTPUT_FILE
VARIABLE=($(awk -v RS= '{gsub(/\n| /,"+",$0); print $0 > "OUTPUT_FILE"}' INPUT_FILE))
