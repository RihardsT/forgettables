Compiling:
gcc program.c -o program-output

//Comment
/*Multiline comment */
#include <stdio.h>
int main(void){
	int num = 0;
	return 0;
}


I/O:
	int aNumber;
	puts("This is string");		//
	printf("Text", aNumber);	//formatting features to display multiple types
	scanf("%d", %aNumber);	//Receive and store input
		// space also means end of input
// %d for digit (int), %s - string
	int c = getchar();	//for single char input
	putschar(c);


Operators:
Comparators:

Variables:
	short int 			//printf("%d format for int", var); //Format as in Python
	float double		//printf("%f Float %lf LongFloat=Double", var); //%Lf long double

		Type						Size/*bytes*/ 	Range
	char							1					-128 to 127 or 0 to 255
	unsigned char			1					0 to 255
	signed char 			1					-128 to 127
	int 							2 or 4 		-32,768 to 32,767	or -2,147,483,648 to 2,147,483,647
	unsigned int 			2 or 4		0 to 65,535 or 0 to 4,294,967,295
	short							2					-32,768 to 32,767
	unsigned short		2					0 to 65,535
	long 							4					-2,147,483,648 to 2,147,483,647
	unsigned long 		4 				0 to 4,294,967,295
	float 						4 				1.2E-38 to 3.4E+38 					Precision: 6 decimal places
	double 						8					2.3E-308 to 1.7E+308 				Precision: 15 decimal places
	long double 			16 				3.4E-4932 to 1.1E+4932 			Precision: 19 decimal places
	void 							1

	void *ptr; //void for pointers. and * for pointers too.
	bool											1 == TRUE, 0 == FALSE

	//string is char array
	char str[30] = "This is string";
		//shorter or longer string added to char array might not be that good


if/else:

Loops:

Functions:
	puts();
	sizeof(char);
Custom Functions:
	int camelCase(a,b){}

Imports and definitions:
	#include <file> //used for system header files in standart list of system directories. Standart imports
	#include "file" //used for header files of your own program
	#define name //Define macro
		#define BUFFER_SIZE 1024 //global value. In code BUFFER_SIZE will be replaced by 1024. Readability.

	typedef int Bool; 	//Defining new type.
	#define True 1
	#define False 0

	#include <stdio.h> //Standart IO
	#include <stdlib.h>
	#include <stdbool.h>
	#include <string.h>
		strcmp(str1,str2); //Compare two strings
		strcpy(destination,source); //copy string
		memcpy(destination,source,numberofchars); //Copy n chars from source to dest
		strlen(str); //Length of string

Expressions:
	Contain variables, constants, operators
	25 + 12, x^2

Statements: //Execute action
	age = todayDate - birthdayDate;
	if (age > 17) can_drive = TRUE;

Other:
char name[20];
scanf("%s",&name); // & means name is an adress for name[] array