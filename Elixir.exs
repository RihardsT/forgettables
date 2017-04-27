# Run with docker
sudo docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim elixir test.exs

# Comments
# Single line comment

# Functions:
defmodule Account do # Functions must be inside a defmodule
  def investment_return(initial, interest) do
    initial + (initial*interest) # Last evaluated get's returned
  end
end
Account.investment_return(1000, 0.0001) # Call Functions like this. Module.function(args)
# Operators:
# Comparators:

# print
IO.puts "Typical string with #{string_interpolation}"

# Variables:

# if/else:

# Loops:

# Imports: