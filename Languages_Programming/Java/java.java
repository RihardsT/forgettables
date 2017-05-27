Compile:
  javac ExampleProgram.java
  java ExampleProgram

/**  Multi line comment   */
// Single line comment

public class HelloWorld {
    public static void main(String[] args) {
    	System.out.println("Hello World!");
    }
}

Assignment operators: = += -= *= /=
Math: + - * / %
Comparators: > < >= <=	instanceof == !=
	// == compares objects, whether they are the same object.
	// == works to compare primitives.
	// .equals() use this for objects.
Conditional (bool) operators:	! && ||  // bool precedence, left to right !true = false
	++ --
	// System.out.println(intValue ++); #Output: 10 New value: 11
	// System.out.println(++ intValue); #Output: 11 New value: 11
	// ++ or -- position as pre or postfix matter,
	//because they mean when math will be done. Before/after evaluation
Compare strings: string1.equals(string2)

Numeric Variables: //Primite variables
	byte		8bits		-128 						127							byte b = 1;
	short		16bits	-32,768					32,767					short s = 10;
	int			32bits	-2,147,483,648	2,147,483,647		int i = 1_000_000; //Underscores == readability
	long		64bits	-9.22337E+18 		9.22337E+18 		long l = 100L;
	float		32bits																	float f = 150.5f;
	double	64bits																	double d = 150.5d;
	boolean 					//Boolean.parseBoolean("true")
	char 		2bytes
//long, float, double syntax, with L,f,d at the end. Without
//Lynda 4.3
Number helper classes: Byte, Short, Integer, Long, Float, Double
	//To convert to other types.
	double doubleValue = 156.5d;
	Double doubleObj = new Double(doubleValue);
	byte myByteValue = doubleObj.byteValue()
	.byteValue() .intValue() .floatValue() .toString()
	//Primitive values are not guaranteed to retain numeric precision when calculation and rounding
	//Use BigDecimal class for currency values that have guaranteed precision
	BigDecimal payment = new BigDecimal(1115.37);
	System.out.println(payment.toString()); //1115.36999999999
	//Some interesting things with this
	double d = 1115.37;
	String ds = Double.toString(ds);
	BigDecimal bd = new BigDecimal(ds)
	System.out.println(bd.toString()); //1115.37

Variables:
	String //strings are immutable, so value can't be changed.
	//"Changing" value points to another instance of string class.
	//Changed objects old value is still in memory.
	StringBuilder sb = new StringBuilder("string"); //For single threaded environments
	sb.append(" next");	//StringBuilder doesn't create new instances like String does,
	//so string builder is more memory efficient.	// Unsynchronized by default == not thread safe
	StringBuffer	//For multi threaded env's // Synchronized by default == Thread safe

	//String is a class.
	String s2 = new String("This"); //So creating string is like creating new object.
	String s1 = "This"; // double quotes "" are used for string. Single '', for char
	/*Note*/ s1 == s2 // == is unreliable for compiring strings.
	s1.equals(s2)	//Case sensitive
	s1.equalsIgnoreCase(s2) //Case insensitive

	Array:	//Not resizable during runtime. Ordered, with one data type
		int name[] = new int[size]; //Empty array
		int[] name = {item1, item2};

	ArrayList<String> name = new ArrayList<String>();	//Resizable array, with one data type
		name.add("Item");
		System.out.println(name);
	List<String> name = new ArrayList<String>(); //Better than previous ex
		//because this allows to reinitialize another kind of list.
	name = new LinkedList<>();

	HashMap<Key, Value>: //Resizable, unordered array, also with one data type.
		HashMap<String, String> name = new HashMap<String, String>();
		//Key and Value can be any object, int/String/etc
		name.put("key","value");

	Set<String> set = new HashSet<String>(); //set can't have duplicates, auto removed.

//Variable class methods:
	Character.toUpperCase(char1)

If Else Switch
	if (true){ code; }
	else if (true){ code; }
	else { code; }
  char res = (true) ? 'Y' : 'F'; // Ternary operator. if/else

	switch (key){
		case value:
			code;
			break;
		case value:
			code;
			break;
		default:
			code;
			break; }

Loops:
	for (int i = 0; i < 10; i++){ /*code;*/ } //i++ i--
	for (String month : months){ /*code;*/ } //foreach
	int count = 0
	while (count < 10){ /*code;*/ count++;}
	do {/*code;*/ count++;} while(count<10);

	Iterator:
		ListIterator<String> listIterator = list.listIterator();
		while (listIterator.hasNext()){ String value = listIterator.next();
			System.out.println(value); }
	HashMap Iterator:
		Set<String> keys = map.keySet();
		Iterator<String> iterator = keys.iterator();
		while (iterator.hasNext()) { String value = iterator.next();
			System.out.println(value + map.get(value)); }

Classes:
	public class ClassName {
		//Each ClassName must the same as filename, file can only have one main public class.
		//All other same level classes can't be public and can only be accessible within this class/file.
		public static final long CONSTANTNAME = value; //final means that value can't be reinitialized.
			//final makes static only primitive types. Objects can still be changed.
		public static int GLOBVAR = value; //Global for class objects.
		public String InstanceVariableName = value; //Instance variables => Fields
		private int SecondInstVar = val;
		public int getSecondInstVar(){return val;}	//Getter, setter
		public int setSecondInstVar(int val){ this.SecondInstVar = val; }
		public ClassName(){	//Constructor
				System.out.println("Constructor of "+ this.name); }
		public ClassName(int value){ this.value = value; }	//Custom constructor
	}
	//...
	public class HelloWorld {
    public static void main(String[] args) {
    	System.out.println("Hello World!"); }}

  //Inheritance - In Java, each class can only extend one superclass
  //Polymorphism - Can instantialize with superclass/subclass types
  public class SubClass extends SuperClass {
  	public SubClass(){	//subclasses constructor
  		super();	//super(); calls SuperClasses constructor.
  		//super(arg); //can call SuperClass consturctor with arguments
  	}

  	@Override
  	public int SuperClassMethod(){
  		/* Overriding code */
  		return super.SuperClassMethod(); //calls SuperClasses function
  	}
		//Downcasting - Lynda 10.5
  	SubClass object1 = (SubClass)objects.get(0); //Treat object as (SubClass) object, not SuperClass object
  }

  //Interface - when modeling behavior
  public interface Name{ public void method1(int arg); }

	public static class ClassName { /*Code*/} //Class method, can be called from class definition
	//static is the difference.
	public class ClassName { /*Code*/ } //Instance class - Must make object, to use
	public static final
	private 	//available to code within that class
	public		//available to entire application
	protected	//available to current class and subclasses

Methods(Functions):
	//Every function is a function of a class. Such functions are called methods
	//In OOP class functions are called methods. Global functions are functions
	private 	//available to code within that class
	public		//available to entire application, if class is also public
	protected	//abailable to current class and subclasses
	//without access keyword methods and stuff is available to curr class and within that programs package
	static //static means it creates class method. Can be called without object initialization ???
	//static methods don't need instance of that object. So not static methods for classes - objects
	Return type:
	void int double string //And so on
	private static void doSomething(int args){ /*code;*/}
	private static double addMultitpleValues(double ... values){ //Multiple arguments
		double result = 0d;
		for (double d: values){
			result += d;}
		return result;}

Method overloading:
	//Able to make multiple methods with same name, with different inputs.
	private static int addValues(int int1, int int2){ /*code;*/ }
	private static int addValues(int int1, int int2, int int3){ /*code;*/ }
	//calling addValues(1,2) will call first method. Calling addValues(1,2,3) will call the other method.
	private static string addValues(string str1, string str2){ /*code;*/ }
	//calling addValues("1","2") will call this method.

Errors:
	try{
		// code
	}
	catch (Exception e) {
		e.printStackTrace();
		System.out.println("Custom error code");
		System.out.println(e.getMessage());
	}

	private static void myFunction() throws KindOfException {
		// code
	}


Files:
	try{
		File f1 = new File("sourcefile.txt");
		File f2 = new File("targetfile.txt");
		InputStream in = new FileInputStream(f1);
		OutputStream out = new FileOutputStream(f2);
		byte[] buf = new byte[1024];
		int len;
		while ((len = in.read(buf)) > 0){
			out.write(buf,0, len);
		}

		in.close();	//close streams
		out.close();
	} catch (Exception e){ }



	Generics:
	//Allow a type or method to operate on objects of various types while
	//providing compile-time type safety
