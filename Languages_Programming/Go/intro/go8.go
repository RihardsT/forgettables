package main

import "fmt"

const usixteenbitmax float64 = 65535
const kmhMultiple float64 = 1.60934 // for kmh to mph

// Something like classes
type car struct {
  gasPedal uint16 // Unsigned int
  brakePedal uint16
  steeringWheel int16 //
  TopSpeedKhm float64 // Notice that it starts with uppercase.
  // Struct's attributes are public(upper) or private(lower)
}

func (c car) kmh() float64 { // function that refers to the struct. It's a method now!
  return float64(c.gasPedal) * (c.TopSpeedKhm/usixteenbitmax)
}
func (c car) mph() float64 { // function that refers to the struct = method
  return float64(c.gasPedal) * (c.TopSpeedKhm/usixteenbitmax/kmhMultiple)
}

func (c *car) newTopSpeed(newSpeed float64){ // Pointer receiver methods. These can modify attributes
  c.TopSpeedKhm = newSpeed
}

func newerTopSpeed(c car, speed float64) car { // a func that redefines a car here
  c.TopSpeedKhm = speed
  return c
}

func main() {
  // var a_car car = ...
  vehicle := car{ gasPedal: 2342, brakePedal: 0,
                steeringWheel: 2786, TopSpeedKhm: 201.5 }
  // a_car := car{2342, 0, 2786, 201.5} // can set variables non-explicitly
  fmt.Println(vehicle.gasPedal)
  fmt.Println(vehicle.kmh())
  fmt.Println(vehicle.mph())
  vehicle.newTopSpeed(400)
  fmt.Println(vehicle.kmh())
  fmt.Println(vehicle.mph())
  vehicle = newerTopSpeed(vehicle, 500) // Redefining vehicle just for fun
}
