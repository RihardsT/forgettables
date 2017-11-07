package main

import "fmt"

func main() {
  for i:=0; i<10; i++ { // initialize i with :=. And go only has for loops
    fmt.Println(i)
  }

  j:=0
  for j<10 {
    fmt.Println(j)
    j+=5
  }
  // for {
  //   fmt.Println("Infinte loop") // Like while true
  // }
  x:=5
  for {
    fmt.Println("Adding stuff to x. Now at: ",x)
    x+=5
    if x > 25{
      break // look!, a break
    }
  }
  for x:=5; x<25; x+=5{
    fmt.Println("Adding stuff to x. Now at: ",x) // Same as above one.
  }

}
