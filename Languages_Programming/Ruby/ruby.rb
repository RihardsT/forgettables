puts "foo" #prints but returns nil. Appends \n
print "foo" #prints but also returns nil. Doesn't append \n
'Single quotes dont allow #{interpolation} and are literal' #meaning  prints what you see
"Double quotes allow #{interpolation}"
"\#{'this'}" # \ to escape special symbols.+


Comparators > < >= <= == !=
=~ !~ # This operator matches strings against regular expressions. Returns offset if match || nil
# http://www.tutorialspoint.com/ruby/ruby_operators.htm
Combined comparison operator <=> #compares Ruby objects
#returns 0 if first ==second, 1 if first > second, -1 if first < second
Bool operators	&& || !#(!true=false) (3 < 4 || false) && (false || true)
+ - * / % **(exponent)
Assignment operators: = += -= *= /= << ||=
<< #ta ka .push priekš array, += priekš string
conditional assignment operator: ||= #Assign only if it hasn't assigned already.
<< also can be used to append to files/

Variables:
array = [1,2] #[start, length]
array[0..4] #return in range 0 to 4
array[-1] #return index -1 == last element. Usefull, because doesn't need to know array lenght
array << value #append value
	# key var definēt kā string, "key", vai kā simbolu :key
		hash = { key1 => value1,
		key2 => value2,
		key3 => value3 }
	my_hash = Hash.new # my_hash = {}
	my_hash["Stevie"] = "cat" # get it by  my_hash["Stevie"]
	my_hash = Hash.new("default return value") #atgriež default vērtību, ja izvēlas tukšu key.
	# hash var definēt kā key: value. key: joprojām skaitas kā simbols :key
	hash = { one: 1, two: 2}
	hash.keys
%w[this that too] # returns array of string. ["this", "that", "too"]
Multi line string: https://www.commandercoriander.net/blog/2014/11/09/a-multiline-string-cheatsheet-for-ruby/

If/Else/Unless //Case #switch //Ternary
puts "It's true!" if true
expression unless false #unless izpildas kad ir false
if 2<3
	print
elsif
	print
else
	print
end

unless hungry #if hungry=true izpilda else
	puts #Tāds pā print, tikai beigās pievieno \n
else
	puts
end

case choice
when '1'
	do_stuff
else
	puts 'nothing'
end
case language
  when "JS" then puts "Websites!"
  when "Python" then puts "Science!"
  when "Ruby" then puts "Web apps!"
  else puts "I don't know!"
end
Ternary conditional expression
boolean ? Do this if true : Do this if false
puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."
var = True/False ? foo : bar

######################################
Funkciju Simboli: ! - izmaina esošo mainīgo. ? atgriež true/false
Functions:
.upcase .downcase! .reverse! #some for capitalize
# .downcase! !-zīme nozīmē, ka a.downcase! ir vienāds ar a = a.downcase
#!-zīme izmaina to pašu mainīgo.
.send('length') .send(:length) #Can 'send' variable to the function (:length)
.include? #metodes ar ?-zīmi atgriež true/false
.gsub!(/toSubst/, "substitute") #Global Substitution
.split(",") #sadala string, atgriež array ar noteikto dalītāju (delimiter)
.sort .sort_by
.to_s (to string) .to_i .to_sym (to symbol :sym, same as .intern)
.object_id
.select # grades = { alice: 100, bob: 92, chris: 95, dave: 97}
	grades.select {|name, grade| grade < 97} # ==> {:bob=>92, :chris=>95}
	grades.select { |k, v| k == :alice } # ==> {:alice=>100}
.each_key .each_value #my_hash = { one: 1, two: 2, three: 3 }
	my_hash.each_key { |k| print k, " " }# ==> one two three
	my_hash.each_value { |v| print v, " " }# ==> 1 2 3
.nil? #atgriež true, ja objekts ir tukšs
.delete(what) #delete from hash or array?
.upto() .downto() #95.upto(100) {|x| puts x} #izvadîs skaitïus no lîdz
.push or <<
[1,2,3].respond_to?(:push) #atgriež true/false, ja objektam der funkcija.
#Proti, tagad true, jo uz array var izmantot push.
#Atgrieztu false, ja :push vietā būtu :to_sym, jo array nevar pārvērst par simbolu.
.is_a? Integer #checks if object is a Integer or.
.collect #same as .map // izpilda bloku ar katru objekta elementu
#my_nums = [1, 2, 3]  my_nums.collect { |num| num ** 2 } # ==> [1, 4, 9]
.delete .count #array methods
.compare .flatten #hash methods
.first
.even? #pārbauda vai int ir even. ? atgriež true/false

######################################
Loops: #while until for iterator .each .times
counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end
	i = 0
until i == 6
	puts i
  i += 1
end
for num in 1...10 # trīs ... punkti nozīmē neiekļaujot pēdējo vērtību
  puts num # divi .. punkti nozīmē iekļaut arī pēdējo vērtību
end
	i = 0
loop do
  i += 1
  print "#{i}"
  break if i > 5
end

for i in 1..5
  next if i % 2 == 0 # next keyword
  print i
end

object.each { |item| # Do something } #Iterate through arrays
object.each do |key, value| #iterate hash
  puts "#{key}: #{value}"
end
object.each do |item| # Do something end
10.times { print "Chunky bacon!" } #Ta ka īss for

######################################
Methods #By default are public
def welcome
  puts "Welcome to Ruby!"
end
welcome #call it

def func(n=false) #with arguments and with default value
	puts n
end
func(n)
def what_up(greeting, *bros) #variable count multiple arguments
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
what_up("What up", "Justin", "Ben", "Kevin Sorbo")

Blocks are like Nameless Methods #Similar to anonymous functions in JavaScript or lambda in Python
1.times do #nodefinē ar do end, vai {}
  puts "I'm a code block!"
end
1.times { puts "As am I!" }
(1..5).each { |i| puts 2 * i }
%w[A B C].map { |char| char.downcase } #returns array with the downcased chars.
%w[A B C].map(&:downcase) #same as one line above

Implicit return
def add(a,b)
  a + b
end
add(1,1) #atgriezîs 2, pat bez return. Ruby returns result of last evaluated expression
def string_message(str = '')
  return "It's an empty string!" if str.empty?
  return "The string is nonempty."
end

Public, Private
class Dog
    def initialize(name, breed)
        @name = name
        @breed = breed
    end
    public ###### Public
    def bark
        puts "Woof!"
    end
end

######################################
Other:
class Dragon < Creature; end #write stuff on one line with ;
a = gets.chomp #gets dabū ievadi lietotāja un pieliek \n. chomp noņem \n
my_string = "muchachos"
print "Adios, #{my_string}!"
# ==> "Adios, muchachos!"
age = 26
"I am " + age.to_s + " years old."
"I am #{age} years old." #String interpolation
{} ir vienādas ar do end #Bloks

yield:
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end
yield_name("Eric") { |n| puts "My name is #{n}." }

Bloku var saglabāt izmantojot Proc.new #Blocks
cube = Proc.new { |x| x ** 3 }
[1, 2, 3].collect!(&cube) #same as [1, 2, 3].collect! { |x| x ** 3 }
cube.call #izsauc bloku

& #&pārvērš par atkal izmantojamu bloku
strings = ["1", "2", "3"]
nums = strings.map(&:to_i)

lambda {|param| block}
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda {|x| x.is_a? Symbol}
symbols = my_array.select(&symbol_filter)
#lambda is similar to Proc, but 2 differences:
##First, a lambda checks the number of arguments passed to it, while a proc does not.
#This means that a lambda will throw an error if you pass it the wrong number of arguments,
#whereas a proc will ignore unexpected arguments and assign nil to any that are missing.
##Second, when a lambda returns, it passes control back to the calling method;
#when a proc returns, it does so immediately, without going back to the calling method.
def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end
puts batman_ironman_proc
## Batman will win!
def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end
puts batman_ironman_lambda
## Iron Man will win!

###########################################
Class Klases
$ #Global variable
@ #Instance variable
@@ #Class variable
 #Local variable #Bez nekā ekstra. a = 4
 class ClassName
    def MethodName( parameter )
        @classVariable = parameter
    end
end

#Count number of instances with Class variable
class Person
    @@people_count = 0
  def initialize(name)
    @name = name
    @@people_count += 1
  end
  def self.number_of_instances
    return @@people_count
  end
end
matz = Person.new("Yukihiro")
dhh = Person.new("David")
puts "Number of Person instances: #{Person.number_of_instances}" ##2

Inheritance
#Ruby klases var mantot īpašības tikai no vienas (super) klases.
class DerivedClass < BaseClass
	def method_name #Metode ar tādu pašu nosaukumu kā Base klasē, to pārraksta. Override.
	end
end
###
class Creature
  def initialize(name)
    @name = name
  end
  def fight
    return "Punch to the chops!"
  end
end
class Dragon < Creature
    def fight
        puts "Instead of breathing fire..."
        super #super izsauc Base klases metodi
    end
end
dr = Dragon.new("Puk")
dr.fight
###
class Message
   @@messages_sent = 0
    def initialize(from, to)
        @from = from
        @to = to
        @@messages_sent += 1
    end
end
my_message = Message.new(3,40)
class Email < Message
    def initialize(from, to)
        super
    end
end
###
class Person
  def initialize(name, job)
    @name = name
    @job = job
  end

  def name
    @name
  end
###Important part right here###############
  def job=(new_job)	#job=(new_job)
    @job = new_job
  end
end
## ^^ is same as below:
########################################
Atribute reader/writer/accessor
class Person
  def initialize(name, job)
    @name = name
    @job = job
  end
  attr_reader :name #Read the instance variable without method
  attr_writer :job #Write/change the job attribute.
  attr_accessor :job #Read/write for attribute.
end

###########################################
Module
#You can think of modules as being very much like classes,
#only modules can't create instances and can't have subclasses.
#They're just used to store things!
##Modules are for storing constants. Writen in ALL_CAPS
module ModuleName
  # Bits 'n pieces
end

Namespacing
Math::PI #Looks for PI in Math module. with the double colon ::
Circle::PI

require 'module' #somewhat like import as in python import tkinter
include 'module' #Any class that includes a certain module can use those module's methods!
extend 'module' #Class itself can use methods, as opposed to instances of class.

#Mixin. Include in action below
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end
class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
peter = Rabbit.new("Peter")
peter.jump

System Command:
system("commandhere")
`command` # returns command output
%x( cmd ) # returns command output
http://stackoverflow.com/questions/2232/calling-shell-commands-from-ruby


###################################### Files:
http://stackoverflow.com/questions/5545068/what-are-all-the-common-ways-to-read-a-file-in-ruby/5546681#5546681
IO.foreach("testfile") {|x| print "GOT ", x }
File.foreach('testfile') {|x| print "GOT", x }
# a w  - append, write
open('OUTFILE', 'a') { |f|
  f.puts "Hello, world."
}

File.basename(ABSOLUTE_PATH) # Gives plain filename

Regex search file:
https://stackoverflow.com/questions/6002868/finding-lines-in-a-text-file-matching-a-regular-expression#6003754
#Ruby 1.9
File.each_line('file.txt') do |line|
  puts line if (line[/ohn/])
end
# if (line['ohn']) # looks for 'ohn' anywhere in line, doesn't regex
http://ruby-doc.org/core-2.3.0/IO.html#method-i-each_line

List files in directory:
Dir['/path/to/search/*']

## Read file as string
IO.read(filename)