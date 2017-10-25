package main
/* Multiple line comment */
import ("fmt")

// With types. Retirm type after ()
// func add(x float64,y float64) float64 {
func add(x ,y float64) float64 { //Same as above, but shorter
  return x+y
}

const x int = 5

// Return multiple things. Need to define return type for both
func multiple(a,b string) (string, string) {
  return a,b
}

func main() {
  // var NAME TYPE
  // var num1 float64 = 4.7
  // var num2 float64 = 6.2
  // var num1,num2 float64 = 4.7, 6.2
  num1,num2 := 4.7, 6.2 // Shorter variables. Let Go figure out the type by itself. It'll

  fmt.Println(add(num1,num2))
  w1, w2 := "Hey","there"

  fmt.Println(multiple(w1,w2))

  var a int = 43
  var b = float64 = float64(a)
  x := a // x will be int
}
