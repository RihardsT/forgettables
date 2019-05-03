### raw output with -r, without quotes
# select entries matching pattern
jq -r '.[] | .name | select(match("PATTERN"))' JSON

### Output reasonable formatter string, good for tables
# Multiple values in single line
jq -r '.[] | "\(.name) \(.another_value)"' JSON
