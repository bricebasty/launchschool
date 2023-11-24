# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that
# is a multiple of 7, and whose digits occur exactly once each. So, for example,
#  49 is a featured number, but 98 is not (it is not odd), 97 is not
#  (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Return an error message
# if there is no next featured number.
#
=begin
10:16

PROBLEM
---
INPUT: Integer
OUTPUT: Next featured number/Integer or Error message
RULES:
- Featured number is
  - Multiple of 7
  - Odd
  - Each digit appears once


EXAMPLES
---
INPUT:
=>
OUTPUT:

DATA STRUCTURES
---
INPUT: 12
=> 14 -> odd ? -> no
=> 21 -> odd? -> yes -> digits?
OUTPUT: 21

ALGORITHM
---
WHAT

return "Error" if the input is has more than 10 digits
Check the next multiples of 7
  Divide the input by 7 and store the result
  Initialize an iterator to 1
  Do 7 by result + iterator
    If it's odd and all its digits are present once
      return this number
    if not
      iterator +1
      go back to the beginning of loop


HOW
=end

def featured(integer)
  return "Error" if integer > 9876543210
  next_product = (integer / 7) + 1

end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
