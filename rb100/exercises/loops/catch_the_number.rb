# frozen_string_literal: true

loop do
  number = p rand(100)
  break if number.between?(0, 10)
end
