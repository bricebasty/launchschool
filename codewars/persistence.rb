# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

# For example (Input --> Output):

# 39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
# 999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
# 4 --> 0 (because 4 is already a one-digit number)

# Problem
#
# Given a positive integer, return an integer counting the number of operations
# made by multiplying every number in the integer given, and then its result recursively, until it is only one digit
#
# Examples
#
# 39
# 3*9 1
# 27
# 2*7 2
# 14
# 1*4 3
# 4
# 3
#
# 999
# 9*9*9 1
# 729
# 7*2*9 2
# 126
# 1*2*6 3
# 12
# 1*2 4
# 2
# 4
#
# Data Structures
#
# Integers
# Recursion
#
# Algorithm
# Initialize a count variable
# Take every digit in the integer input and multiply each one of them
#   Store the return in another variable
#   Add 1 to the count variable
# Until number.size is not equal
#
#
# Code

# def persistence(number, count=0)
#   result = 1

#   unless (result * number).to_s.size == 1
#     number.digits.each { |digit| result *= digit }
#     count += 1
#   end

#   return count if result.to_s.size == 1
#   persistence(result, count)
# end

# p persistence(39) # 3
# p persistence(4) # 0
# p persistence(25) # 2
# p persistence(999) # 4
# p persistence(444) #3


def persistence(n = 4) #
  return 0 if n < 10
  1 + persistence(n.digits.reduce(&:*))
  # this method call returns 0 because 4 < 10
end

p persistence

def persistence(n = 14)
  return 0 if n < 10
  1 + persistence(4)
  # this method call returns 1 because:
  # persistence(4) returned 0
  # 1 + 0 = 1
end

p persistence

def persistence(n = 27)
  return 0 if n < 10
  1 + persistence(14)
  # this method call returns 2 because :
  # persistence(14) returned 1
  # 1 + 1 = 2
end

p persistence

def persistence(n = 39)
  return 0 if n < 10
  1 + persistence(27)
  # this method call returns 3 because:
  # persistence(27) returned 2
  # 1 + 2 = 3
end

p persistence
