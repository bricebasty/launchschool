# frozen_string_literal: true

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

numbers.each { |k, v| puts "A #{k} number is #{v}" }
p(numbers.map { |_, v| v / 2 })
p(numbers.select! { |_, v| v < 25 })
p numbers
