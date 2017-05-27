//Comments 
/* Multi line comments */
Operators: + - * / ++ --
Bool operators	&& || !
Assignment operators: = += -= *=
Comparators: > < >= <= != !==
	==  // 123 == "123" => true, JS is weakly typed.
	=== // 123 === "123" => false, strict equality. Checks if types are identical

I/O:
	alert("Message"); //Popup box with message
	var inp = promt("Please input message"); //Inputs to variable. Popup input.

Variables:
	var name = value; //Variables can have any type of data in them.
	//Variables are available within the scope they're defined, within functions

If/Else/Switch:
	if ( true/false ) { /*code*/ }
	else { /*code*/ }

	switch ( varName ) {
		case "Option1":	alert("Option1"); break;
		case "Option2": alert("Option2"); break;
		case "Option3": alert("Option3"); break;
		default: alert("Default"); }

Loops:
	while ( true ) { /*code*/ }
	do { } while ( true );
	for (var i = 1; i < 10; i++) { /*code*/ }

Functions:
	function myFunction () { /*code*/ 
		return result; }
	var result = myFunction(); //function call with return
	function myFunction2 (param1, param2) { /*code*/ }
	myFunction(arg1, arg2); 
		//Parameters when creating function, arguments - when calling.

Imports:
	//In HTML import many script files. Order is important. Dependencies.