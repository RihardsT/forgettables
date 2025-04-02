### raw output with -r, without quotes
# select entries matching pattern
jq -r '.[] | .name | select(match("PATTERN"))' JSON

### Output reasonable formatter string, good for tables
# Multiple values in single line
jq -r '.[] | "\(.name) \(.another_value)"' JSON

# Something something
jq -r '.OBJECT | map_values(keys)' JSON

# Find paths to particular key
jq -c 'paths | select(.[-1] == "KEY")' JSON

### Select a matching object first by some match, then get stuff from it
jq '.[] | select(.FIELD == VALUE) | .FIELD'
jq 'map(select(.FIELD == VALUE)) | .FIELD'
jq '.[] | select(.FIELD | test("PATTERN")) | .FIELD' # with regex

# Find keys under specific key
jq '.field | keys'

# Output with single quotes.
# This could be useful for outputing values with special characters, like $?:
echo '{"name": "John"}' | jq -r '.name | @sh'
