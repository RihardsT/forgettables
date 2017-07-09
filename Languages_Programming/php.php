<?php code ?> //php code block
<?php
//Coment
Operators + - * /
Comparators > < >= <= == !=
Operators && ||
Variables
$var = "value"; //variables always start with $
$array = array("var1", "var2");
	echo $array[0]; //same as: echo $array{0}
	$array[0] = "newVal";
	unset($array[0]); //Unset izdzēš elementu vai visu array. unset($array)
	array_push($array, "Element"); //Adds element to end
$associativeArray = array('key1'=> value, 'key2'=>value);
	echo $associativeArray['key1'];
	//Associatibe array, also called map
	foreach ($associativeArray as $key => $value) {	code}
$deck = array(array('2 of Diamonds', 2), //Multidimensional array
                      array('5 of Diamonds', 5),
                      array('7 of Diamonds', 7),
                      array('some card', 8));
      echo 'You have the ' . $deck[2][0] . '!';

if/elseif/else/switch:
if(false){echo "This is if";}
elseif(true) {echo "This is elseif";}
else {print "This is else";}

switch (2) {
  case 0: echo 'The value is 0'; break;
  case 1: echo 'The value is 1'; break;
  case 2: echo 'The value is 2'; break;
  default:echo "The value isn't 0, 1 or 2";}
  //Ja nelieto break, tad kods turpinās izpildīties līdz break.
switch ($i) {}
switch ($i): endswitch;

Loops: for/foreach /while/ do/while 
for ($i = 0; $i < 10; $i++) { echo $i; }
foreach($array as $item){ echo $item; }
while($condtition == true){ echo "Code"; $condtion = false; } 
while(true): CODE; endwhile;
do{echo "Completes at least once.";} while(false);

Functions:
function name($params){code;} //return
	name(par); //call function

$length = strlen("string");
substr("string",0,3); //string, starting/end positions
strtoupper("string");
strtolower("string");
strpos("string", "i"); //returns index of first char ("ing"), or false. 
round(M_PI); //returns 3
round(M_PI,4); //returns 3.1416
rand(); //random between 0 and 32767
rand(1,10); //random between min max
count($array);
sort($array);
rsort($array); //reverse sort
join(":",$array); //prints 3:2:1

Methods working with objects;
is_a($object, "ClassName"); //Atgriež true/false vai objekts pieder klasei
property_exists(class, property);
method_exists(object, method_name);

Objects:
class Classname {
	const alive = true; //Konstantēm neraksta klāt $. Konstantes strādā klases ietvaros. Scope.
  public static $var = true; //static ļauj izmantot klases īpašības/metodes pat tad, kad nav neviena objekta.
  public $prop1 = true;
  public $prop2;
  public function __construct($prop2) {
    $this->prop2 = $prop2;}
  public function functionname($params){
  	code;}
}
  $obj1 = new Classname($prop2);
  $obj2 = new Classname("name");
  echo $obj1->prop1;
  echo $obj2->prop2;
  $obj1->funcionname($params); //Call function
  if(Classname::alive){echo "This.";}
  Classname::var;
  // :: is scope resolution operator; :: var tikt klāt const, static pat bez objekta radīšanas.


Inheritance:
class ParentClass {
	final public $prop1 = true; //Šo īpašību child klase nevarēs pārrakstīt.
	public $prop2 = false; }//Šo īpašību child klase var pārrakstīt
class ChildClass extends ParentClass{ code; } 


?>

<?php
 echo "Stuff";
echo "Hello," . " " . "world" . "!"; 
//Punkts . ir tas pats kas + Javā, strādājot ar string.
?>