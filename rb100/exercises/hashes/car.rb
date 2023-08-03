car = {
  type: "sedan",
  color: "blue",
  mileage: 80_000
}

car[:year] = 2003
car.delete(:mileage)

p car[:color]

multiple_cars = {
  car: { type: "sedan", color: "blue", year: 2003 },
  truck: { type: "pickup", color: "red", year: 1998 }
}

car = [[type: sedan], [color: blue], [year: 2003]]