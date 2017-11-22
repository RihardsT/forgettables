package main

import "fmt"

func foo(c chan int, someValue int) {
  c <- someValue * 5 // <- channel operator. Sending value to a channel
}

func main() {
  fooVal := make(chan int) // Go channel, to be used with goroutines
  go foo(fooVal, 5)
  go foo(fooVal, 3)

  // v1 := <- fooVal
  // v2 := <- fooVal
  v1, v2 := <- fooVal, <- fooVal

  fmt.Println(v1, v2)
}
