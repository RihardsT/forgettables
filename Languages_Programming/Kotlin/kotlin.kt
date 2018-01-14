fun main(args: Array<String>){
  print("Hello you!")
}
////////// Compile as class and run:
/*
kotlinc FILE.kt
java -cp .;/A_PLACE_WHERE_KOTLIN_RUNTIME_IS/kotlin-runtime.jar FILE
// Compile as jar
kotlinc FILE.kt -include-runtime -d FILE.jar
java -jar FILE.jar
*/

////////// Comments

////////// Operators:
////////// Comparators:

////////// Print
print("Value is: $VAR_NAME") // String interpolation. Called string templates ?

////////// Variables:
val name:String = "NAME" // immutable value
val name = "NAME" // auto implied string
var VAR_NAME:String // can change it later

////////// if/else:
// if (a<b) a else b

////////// Loops:
////////// Classes:
Class Person(val name:String)

class Person {
  val name:String
  val numberOfPies: Int
}

////////// Functions:
fun NAME(VARIRABLE_NAME: TYPE) : RETURN_TYPE {
  return WHAT_TO_RETURN // if (a<b) a else b
}

////////// Imports:
