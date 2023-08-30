# frozen_string_literal: true

number_a = 0
number_b = 0

loop do
  p number_a += rand(2)
  p number_b += rand(2)
  next unless number_a == 5 || number_b == 5

  print '5 was reached!'
  break
end
