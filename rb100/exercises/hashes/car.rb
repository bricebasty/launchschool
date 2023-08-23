# frozen_string_literal: true

car = {
  type: 'sedan',
  color: 'blue',
  mileage: 80_000
}

car[:year] = 2003
car.delete(:mileage)

p car[:color]

[[type: sedan], [color: blue], [year: 2003]]
