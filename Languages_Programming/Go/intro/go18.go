package main

import ("fmt"
        "time")

func say(s string) {
  for i:= 0; i < 3; i++ {
    fmt.Println(s)
    time.Sleep(time.Millisecond*100)
  }
}

func main(){
  go say("Oh my") // go routine. go routine is like thread. Concurrency
  say("Bungee jump")

  // say("Oh my")
  // go say("Bungee jump") // doesn't output this, as goroutine is not blocking
  // it doesn't wait until it's done. 

  // go say("Oh my")
  // go say("Bungee jump")
}
