Simple Server
python3 -m http.server # 8000 # --bind 127.0.0.1
python2 -m SimpleHTTPServer # 8000

Python'ā atstares ir svarīgas.'
#Single line coment
""" Multiline comment.
Apostrofi apzīmē string, tāpat kā pēdiņas. \ zīme ļauj to labot.
There\'s a snake. Ir Python'am saprotami.
"""

Operators: = - * / ** % // #// floor divide
Comparators > < >= <= == !=
Assignment operators: += -= *= /=
Bool operators not and or #evaluated in this order. # 2<3 and 5<6 => True
Bitwise Operators: >> /Right shift << /Left shift & /Bitwise AND
	| /Bitwise OR ^ /Bitwise XOR ~ /Bitwise NOT # & | return int, convert to binary with bin()
	To write number in binary start with 0b #0b10 = 2, 0b11 = 3

#Python 2.* style
print "Life"+"of"+"Brian"+str(2) # +
name = "Name"
print "Hello %s" %(name) # %s and %(var) formatting operator.
print "String", var + 1 #var=0, prints String 1
print char, # , nozīmē, ka izprintēs bez \n
print a, b
#Python 3.* style
print('{0} and {1}'.format('var1', 'var2'))
# Python 3.6 String interpolation
f'can_put_text_here {variable}'
# print array contents without brackets
print(*array, sep=', ')


Variables:
	name = value #value var būt jebkas. int, float, bool, array, string, obj
		String: a= "string"[0] #Piekļuve ar index.
			String methods: len(variable) string.lower() .upper() str(var_to_string)
				.isalpha() #Pārbauda, vai string satur tikai burtus
				.split() #returns list with words
				" ".join(list)
	name = raw_input("Question") #Input konsolē.
	name = input('Enter something')
	list = [var1, var2]	# Array
	list[0] = changeVal
	list[1:9:2] #list slicing [start:stop:step] [3:] [:2] [::2] / [::-1] #reverse
	list.append(var) .insert(1,var) #.insert(position, var)
	.sort() .index(var) #animals.index("bat") => returns index of bat
	.pop(index) #Izņem no list un atgriež vērtību
	.remove(item) #Izņem elementu, ja to atrod.
	del(list[index]) #kā .pop, bet neatgriež vērtību
	evens_to_50 = [i for i in range(51) if i % 2 == 0] #generate list

	dictionary = {'key':value, 'key2':value} # Hash in ruby
	dictionary[key] = newValue
	del dictionary[key]
	# dictionary.remove(key) # Python 2 ?
	.items() #returns key/value pairs, not ordered
	.keys()
	.values()
	.clear()
	.replace() # replace char in string

if/elif/else
if True:
	#Do code
	pass #does nothing
elif True:
	#Else if code
else:
	#Code
if var not in list:
	#var pievienot list'am, ja tas jau nav tajā iekšā.
if True: #code
'Yes' if fruit == 'Apple' else 'No' #value_when_true if condition else value_when_false


####for, for/else // while, while/else
for var in list_name:
	#code #Šādi ejot cauri list nevar mainīt vērtības
else:
	#else izpildas tikai tad, ja for izpildas normāli, ja nav break
for key in dictionary:
	print dictionary[key]
for i in range(0, 5): #for: from to. Skaita i. Tipisks for cikls
	n[i] = n[i] * 2
	#Šādi iterē ar indexiem un var mainīt list vērtības.
for index, item in enumerate(choices): #enumerate dod indexu
	print index+1, item

while True:	#var izmantot break, praktiski radot do while loop
	#code
	if True:
		break
while True:
	#code
else:
	#Else condition

Built in functions:
range(stop) // range(start, stop) // range(start, stop, step)
max(1,2,3) min()
abs(-3) #absolūtā pozīcija no 0. Proti -3 => 3
sum()
type(var) #atgriež var tipu: int, float, str
len(var)
str(var_to_string)
float(var_to_float) # int to float
int(to_int)
zip(list_1, list_2) #zip sapāro divu vai vairāk listu elementus
filter(function_what_to_filter, object_to_filter) #See lambda
bin(1) #returns binary representation of int #or vice versa ?
oct()
hex()
int("number_in_string", base_of_that_number) #returns value of that in base 10

set(list_in_here) # Returns unique elements
map()

Functions:
def function_name(params):
	#code
function_name(params) #Call function

Anonymous function
lambda x: x % 3 == 0
#same as:
def by_three(x):
    return x % 3 == 0
languages = ["HTML", "JavaScript", "Python", "Ruby"]
print filter(lambda x: x == "Python" ,languages)

Classes:
class ClassName(object):
	member_variable = True #Pieejami jebkuram šīs klases objektam
	#Interesanti, ka pēc objekta definēšanas default vērtību var nomainīt.
	def __init__(self, name):
		self.name = name #Instance variables. Katram objektam pieejami tikai savas vērtības
	def method_name(self):	#self norāda, ka metode pieejama tikai atsevišķam objektam.
		pass
	def __repr__(self):
		return "(%d, %d, %d)" %(self.x, self.y, self.z)
		#__repr__() nosaka to, kādā veidā objekts tiks attēlots. print my_object

class_object = ClassName("Name") #Objekta izveidošana
print class_object.name #Var piekļūt objekta mainīgajiem ar punktu
class_object.member_variable = False #nomaina default vērtību.
	#Šis neizmaina pārējo objektu member_variable vērtību. Tiem tā joprojām ir default.

Inheritance:
class ChildClass(ParentClass):
	#pieejamas ParentClass funkcijas u.t.t
	def method_name(self): #Override. Pārraksta ar to pašu nosaukumu, kā ParentClass metodei.
		return super(Derived, self).method_name() #ar super var piekļūt ParentClass ...
		#CodeAcademy/Python/Introduction to Classes/14

class Employee(object):
    def __init__(self, employee_name):
        self.employee_name = employee_name
    def calculate_wage(self, hours):
        self.hours = hours
        return hours * 20.00
class PartTimeEmployee(Employee):
    def calculate_wage(self, hours):
        self.hours = hours
        return hours*12.00
    def full_time_wage(self, hours):
        return super(PartTimeEmployee, self).calculate_wage(hours)
milton = PartTimeEmployee("Milton")
print milton.full_time_wage(10)

FileInput/Output
f = open("output.txt", "w")
#modes: "w" write only, "r" read only, "r+" read and write, "a" append
f.write("Data to be written")
print(f.read()) #Izvada visu
print(f.readline()) #Pirmoreiz pirmā rinda
print(f.readline()) #Otru - otrā rinda
f.close() #Must close the file.
f.closed #returns True False. Atgriež vai fails ir atvērts vai aizvērts.
#You always need to close your files after you're done writing to them.
#During the I/O process, data is buffered: it is held in a temp before being written to the file.
#Python doesn't flush the buffer, write data to the file—until it's sure you're done writing.
#If you write to a file without closing, the data won't make it to the target file.
with open("file", "mode") as variable:
    # Read or write to the file
with open("text.txt", "w") as textfile:
	textfile.write("Success!")



import math #generic import. Jāraksta math pirms katras tās funkcijas. math.sqrt(9)
from module import function #function import
from module import * #universal imports. Nav jāraksta math. pirms katras funkcijas
#Universāli importi var radīt problēmas, ja pats uzraksta funkciju ar tādu pašu nosaukumu.
#Piem. Sava funkc sqrt radītu problēmas, ja izmantotu from math import sqrt.
#Ja izmanto import math, tad sqrt izsauktu savējo, bet math.sqrt izsauktu no math.
import math            # Imports the math module
everything = dir(math) # Sets everything to a list of things from math
print everything       # Prints 'em all!

from datetime import datetime
	print datetime.now()
	now = datetime.now()
	print '%s-%s-%s' % (now.year, now.month, now.day)

from random import randint #Random int
import random
random.random() # float in range [0.0 1.0]

### Run system command
# https://docs.python.org/3/library/subprocess.html
import subprocess
subprocess.run(["COMMAND", "ARGUMENT"])
