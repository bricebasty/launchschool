numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each { |k, v| puts "A #{k} number is #{v}"}
p half_numbers = numbers.map { |_, v| v / 2}
p low_numbers = numbers.select! { |_, v| v < 25 }
p numbers