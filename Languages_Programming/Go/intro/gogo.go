package main

import ("fmt"
        "math" // Multiple imports
        "math/rand") // subpackages in imports with /

func main() {
  fmt.Println("Sqrt of 4 =", math.Sqrt(4))
  fmt.Println("Random num up to 100:", rand.Intn(100))
}
