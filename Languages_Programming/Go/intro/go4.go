package main

import "fmt"

func main() {
  x := 14
  a := &x // Pointer -> memory address
  fmt.Println(a) // Returns memory address
  fmt.Println(*a) // Read through the pointer
  *a = 4
  fmt.Println(x) // Pointer changed the original x
  *a = *a**a
  fmt.Println(*a)
  fmt.Println(x)
}
