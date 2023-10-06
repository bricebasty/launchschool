countries_and_capitals = {
  'France' => 'Paris',
  'Belgium' => 'Brussels',
  'Morocco' => 'Rabat',
  'Barbados' => 'Bridgetown',
  'Peru' => 'Lima',
  'Bolivia' => 'La Paz',
  'Brazil' => 'Brasilia'
}

def begins_with_b(string)
  string[0] == 'B' # "F" == "B" --> false
end

array = countries_and_capitals.find_all do |country, capital| # key = country = 'France'
  country.start_with?("B") # begins_with_b("France")
end

p array

a = {foo: 0, bar: 1, baz: 2}.find_all {|key, value| key.start_with?('b') }
p a
