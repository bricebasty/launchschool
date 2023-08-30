# frozen_string_literal: true

# number = 3

def factors(number)
  divisor = number # 3 = 3
  factors = [] # []
  while divisor.positive?
    factors << number / divisor if (number % divisor).zero?
    divisor -= 1
  end
  factors
end

# number % divisor == 0 is checking if the number is a factor of divisor
# factors returns the array so by example if we do puts factors(3), we would get in the console factors
print factors(3)
