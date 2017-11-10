package main

import ("fmt"
        "time"
        "sync") // for WaitGroup

var wg sync.WaitGroup

func say(s string) {
  for i:= 0; i < 3; i++ {
    fmt.Println(s)
    time.Sleep(time.Millisecond*100)
  }
  wg.Done() // Notify WaitGroup to stop waiting
}

func main(){
  // go say("Oh my") // go routine. go routine is like thread. Concurrency
  // say("Bungee jump")

  // say("Oh my")
  // go say("Bungee jump") // doesn't output this, as goroutine is not blocking
  // it doesn't wait until it's done.
  wg.Add(1) // Add this before a goroutine, to have it be waited on
  go say("Oh my")
  wg.Add(1)
  go say("Bungee jump")
  wg.Wait()

  wg.Add(1)
  go say("This goes after previous ones, because of the wait")
  wg.Wait()
}
