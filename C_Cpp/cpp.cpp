//Program has to be firstly:
//Correct
//Simple
//Efficient

#include <iostream>	//cin cout
#include <fstream>
#include <sstream>
#include <cmath>
#include <cstdlib>
#include <string>
#include <list>
#include <vector>
#include <algorithm>
#include <stdexcept>

int main(){
	string variable1;
	int variable2;
	double variable3 = 2.3;
	cout << "Hello " << variable3 << "\n";
	cin >> variable1 >> variable2;
	return 0; //if program returns 0, system it executed correctly
}
Comparators: == != > < >= <=
Bool operators || && 

Table of operations: bool	char	int 	double 	string
assignment					 =		=		  =			=				=
addition						 						+			+
concatenation																	+
subtraction											-			-
multiplication									*			*
division												/			/
remainder -modulo								%
increment by 1									++		++
decrement by 1									--		--
increment by n									+=n   +=n
decrement by n									-=n		-=n
add to end 																		+=
multiply and assign 						*=		*=
divide and assign 							/=		/=
remainder and assign 						%=
read from s into x	 s>>x	s>>x	s>>x	s>>x		s>>x
write x to s 				 s<<x	s<<x	s<<x 	s<<x		s<<x

Safe conversions: /*No data lost*/ Unsafe conversions:
bool to char												double to int 
bool to int 												double to char 
bool to double											double to bool
char to int 												int to char
char to double 											int to bool
int to double												char to bool

Variables:
string int double bool char

If/Else
if(first < second)
	cout << first << " < " << second;
else if (condition)
	code;
else code;

Loops:
while(true){ /*code*/ }