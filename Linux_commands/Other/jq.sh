# raw output with -r, without quotes
# select entries matching pattern
jq -r '.[] | .name | select(match("PATTERN"))' JSON
