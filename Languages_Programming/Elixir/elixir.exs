# Run with docker
docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim elixir test.exs
# Interactive
docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim iex

#####
.exs # Elixir script files, will run from memory
.ex # Compiled and written to beam file

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

# Operators that can be used in guard clauses:
== != === !== > >= < <= and or not + - * / <> in

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

########## Modules, Functions
# Directives
import IO # imports, if you don't want to prepend IO for IO.puts for example
import IO, only: [puts: 1] # import only specific functions from module
import Kernel, except: [inspect: 1] # inspect function clashes with Kernel's function, so don't import that
alias Module
alias Module, as: MyModule
require Module

defmodule ModuleName do
  import IO
  def hello do
    puts "Hello"
  end
  import Kernel, except: [inspect: 1]
  def inspect(param1) do
    puts param1
  end
end

defmodule Sample.enum do
  def first([]), do: nil # Single line function
  def first([head | _]),  do: head
  def first(list) when length(list) == 0, do: nil # Guard clauses
end
### Guard clause type check functions
is_atom/1 is_binary/1 is_reference/1 ... # and others https://elixir-lang.org/getting-started/basic-types.html
# Also can use some functions in clauses

########## Functions
# {function_name} / {number_of_parameters}
def first(list, val \\ nil) # define default in a fun without body

def add(list, val \\ 0) do # by default val is 0
  [val | list] # add value to start of list
end

### Private Function with defp
defp trace(string) do
  IO.puts("The value was #{something}")
end

### Anonymous Functions # like lambda functions
Enum.map(list, fn(x) -> x*x end)
Enum.reduce(list, 0, fn(x, acc) -> acc + x end)
Enum.map(list, &(&1 * &1 )) # wit capture symbol &
Enum.map(list, 0, &(&1 + &2 ))

# Pass functions to functions
Enum.map(list, &Sample.Utils.square/1)
Enum.reduce(list, 0, &Sample.Utils.sum/2)

# Calling passed function in a function
deff custom_func(a, f) do
  f.(a) # call it with a dot .()
end


########## if/else:
def first(list) do
  if(length(list) == 0) do
    nil
  else
    hd(list)
  end
end
# But as Elixir has pattern matching abilties, this if/else would be equal to:
def first([]), do: nil
def first([head | _]),  do: head

if
else
unless # if not
# There's no else if

### Multiple conditions
cond do
  day == :Monday -> "M"
  day == :Tuesday -> "Tu"
  ...
  true -> "Invalid day" # Default value
end
# Same could be achieved with pattern matching
def day_abrev(:Monday), do: "M"
def day_abrev(_), do: "Invalid day"

### Case statement
case day do
  :Monday -> "M"
  _ -> "Invalid day"
end
# Case statements can take advandate of pattern matching
case date do
  {1, _, _} -> "It's a new month"
  {14, 12, _} -> "It's 14th of December. Congrats!"
  # A guard clause here
  {_, month, _} when month <= 12 -> "Nobody cares about this day"
  {_, _, _} -> "There's up to 12 months."
  # As soon as case is matched, Elixir will stop falling through
  # So sequence is important here
end


########## Loops:
# Elixir doesn't have for or while. Thus you shall use recursion.
def map([],_) do: []
def map([hd | tl], f) do
  [f.(hd) | map(tl, f)]
end

(100..1) # Range

# Body recursion
def length([]), do: 0
def length([_, tail]),
  do: 1 + length(tail)

# Tail recursion - that's something to look at
# Tail recursion is possible if last operation in function is recursion???
# This avoids overflowing the stack.
# Note that tail recursion would return data in reversed order.
# So another reverse would be required, if correct order is required

########## Imports:
import IO # imports, if you don't want to prepend IO for IO.puts for example
import IO, only: [puts: 1] # import only specific functions from module


########## Usefull stuff
# Show how Elixir interprets our code
quote do CODE_HERE end