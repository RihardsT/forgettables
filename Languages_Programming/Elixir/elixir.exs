# Run with docker
docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim elixir test.exs
# Interactive
docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim iex

# Comments
# Single line comment

# Functions:
defmodule Account do # Functions must be inside a defmodule
  def investment_return(initial, interest) do
    initial + (initial*interest) # Last evaluated get's returned
  end
end
Account.investment_return(1000, 0.0001) # Call Functions like this. Module.function(args)

########## Operators:
+ - * /
|| # or operator
<> # concatenate. var1 <> var2 # "Hello" <> " Elixir"
<<0>> # a null byte. Byte operator I guess
= #
| # pipe
# in iex
  i VARIABLE/EXPRESSION # inspect variable. Ex: i 5*5 # a = 5 # i a

########## Comparators:

########## print
  IO.puts "Typical string with #{string_interpolation}"

########## methods - right out of the bat functions
div(10,5) #divison
rem(10,5) #reminder
byte_size(VARIABLE)
String.length(VARIABLE)

########## Variables:
Data is immutable so doing operations creates a copies, or creates pointers.
_ # underscore for droppable variables.

# Integers
  # No size limit on integer. ... Limited only by available memory
  0xFF # input hex numbers
  0b1111 # as binary
  2.0e2 # with exponent
  1_000_000 # with underscores. Same as without _ : 1000000
# atom - constant, whose name is also its value
  :firstname
  :"this too goes"
  :true # same as true
  :false
  :nil # nil and false are falsy
# String - UTF8 encoded
  "Typical string with #{string_interpolation}"
  "Try #{[1,2,3]}" # And it returns ascii codes of each letter. Woooow
# Tuples - ordered collection. Best for up to ~4 elements
  book = {"Book title", "Book Author", 23.3}
  elem(book,2)
  put_elem(book, POSITION, NEW_VALUE)
  {title,author,price} = book # matches each elem to the title, author, price respectively
# Lists - lists are singly linked
  list = [:ok, 1, "test", another_list]
  [:item | first_list ] # is supposedly faster than putting the item in the end
    # as elixir doesn't have to traverse the whole list to add it.
  options = [{:is_active, false}, {:notify_user, true}]
  options[:notify_user] # returns true
  hd() #head of list
  tl() #tail
  List.insert_at(LIST, POSITION, VALUE)
# Maps. Keys can be any type, values can be any type. Probably
  map = %{KEY => VALUE }
  map[KEY]

########## if/else:

########## Loops:

########## Imports:
