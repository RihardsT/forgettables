defmodule ModulePlayground do
  # defmodule is not a keyword, but a macro
  def say_here do
    IO.puts "Hello"
  end
  import IO # imports, if you don't want to prepend IO for IO.puts for example
  # import IO, only: [puts: 1] # import only specific functions from module
  def hello do
    puts "Hello"
  end

  import Kernel, except: [inspect: 1] #inspect function clashes with Kernel's function
  def inspect(param1) do
    puts param1
  end
  alias ModulePlayground.Misc.Util.Math # will alias to the last word, so Math
  # alias Module, as: MyModule
  require Integer
end

# run in interactive with module already loaded via docker lel
# docker run --rm -ti -v $PWD:/tmp -w /tmp elixir:slim iex "module_playground.exs"

# In iex:
# ModulePlayground.say_here

# reload module to take in updated file
# r(ModulePlayground)
# Import module in iex
# import_file("misc_util_math.exs")
