package main

import (
	"fmt"
	"sync" // for WaitGroup
	"time"
)

var wg sync.WaitGroup

func boo() {
	defer fmt.Println("Done")
	defer fmt.Println("Is it done?") // FILO order
	fmt.Println("Print this")
}

func cleanup() {
	defer wg.Done()
	if r := recover(); r != nil {
		fmt.Println("Recovered here, from error:", r)
	}
	// wg.Done()
}

func say(s string) {
	defer cleanup()
	for i := 0; i < 3; i++ {
		fmt.Println(s)
		time.Sleep(time.Millisecond * 100)
		if i == 2 {
			panic("Oh noo! Panic!") // Panic!
		}
	}
	wg.Done()
}

func main() {
	wg.Add(1)
	go say("Oh my")
	wg.Add(1)
	go say("Bungee jump")
	wg.Wait()

	wg.Add(1)
	go say("This goes after previous ones, because of the wait")
	wg.Wait()

	boo()
}
