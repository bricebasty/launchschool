# Write a function, persistence, that takes in a positive parameter num
# and returns its multiplicative persistence, which is the number of times
# you must multiply the digits in num until you reach a single digit.

# For example (Input --> Output):

# 39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
# 999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
# 4 --> 0 (because 4 is already a one-digit number)

=begin
PROBLEM
----------------
INPUT: Positive integer
OUTPUT: Persistence/Integer representing the number of times we need to multiply the integer until we reach a single digit

RULES:
- output 0 if already a one digit number

EXAMPLES
----------------
BEGIN: 39 | persistence = 0
=> [3, 9] -> 3 * 9 = 27 | persistence = 1
=> 2*7 = 14 | persistence = 2
=> 1*4 = 4 | persistence = 3
END: 3

BEGIN: 4 | persistence = 0
END: 0

DATA STRUCTURES
----------------
BEGIN: Integer
=> Array
END: Integer

NOTES:
digits ?

ALGORITHM
----------------
Initialize a `persistence` variable to 0 which will be the counter of iterations
Loop

Extract every digit in `n` (#digits)
Multiply each element of the array
Break the loop if the size of the array is 1

=end

def persistence(n)
  return 0 if n.to_s.size == 1

  persistence = 0
  loop do
    n = n.digits.inject(:*)
    persistence += 1
    return persistence if n.to_s.size == 1
  end
end

p persistence(39) # => 3
p persistence(4) # => 0
p persistence(25) # => 2
p persistence(999) # => 4
p persistence(444) # => 3
