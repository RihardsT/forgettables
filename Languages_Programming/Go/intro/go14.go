package main

import "fmt"


// var grades map[string]float32// maps
func main() {
  grades := make(map[string]float32) // maps
  grades["Car"] = 464
  grades["Bike"] = 978
  grades["Feet"] = 346

  CarGrade := grades["Car"]
  fmt.Println(CarGrade)

  delete(grades,"Car") // delete item FROM WHAT
  fmt.Println(grades)

  for k, v := range grades {
    fmt.Println(k,":",v)
  }
}
