package main

import "fmt"

// Something like classes
type car struct {
  gasPedal uint16 // Unsigned int
  brakePedal uint16
  steeringWheel int16 //
  TopSpeedKhm float64 // Notice that it starts with uppercase.
  // Struct's attributes are public(upper) or private(lower)
}

func main() {
  // var a_car car = ...
  vehicle := car{ gasPedal: 2342, brakePedal: 0,
                steeringWheel: 2786, TopSpeedKhm: 201.5 }
  // a_car := car{2342, 0, 2786, 201.5} // can set variables non-explicitly
  fmt.Println(vehicle.gasPedal)
}
