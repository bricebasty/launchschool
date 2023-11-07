# Task
# Given an integer n, find the maximal number you can obtain by deleting exactly
#  one digit of the given number.

# Example
# For n = 152, the output should be 52;

# For n = 1001, the output should be 101.

# Input/Output
# [input] integer n

# Constraints: 10 ≤ n ≤ 1000000.

# [output] an integer
#
#
=begin
PROBLEM
----------------
INPUT: integer
OUTPUT: Biggest integer where you can remove only 1 digit

RULES:
- Can remove any digit at any place
- Only 1
- n is between 10 and 1_000_000

EXAMPLES
----------------
BEGIN: 152
=> [[1, 5, 2], [1, 5, 2], [1, 5, 2]]
=> [[5, 2], [1, 2], [1, 5]]
=> [52, 12, 15]
END: 52

DATA STRUCTURES
----------------
BEGIN:Integer
=> Arrays of arrays of digits
END: Integer

NOTES:

ALGORITHM
----------------
Create a range from 1 to the size of the integer converted to a string
Map this range with element e with index i
- Puts e into digits then reverse it, then delete element at index i and join
Take the max from this array

=end
def delete_digit(n)
  (1..n.to_s.size).map.with_index do |_, i|
    arr = n.digits.reverse
    arr.delete_at(i)
    arr.join.to_i
  end.max
end

puts 'Test result is ' + (delete_digit(152) == 52).to_s.upcase
p delete_digit(152) # 52

puts 'Test result is ' + (delete_digit(1001) == 101).to_s.upcase
p delete_digit(1001) # 101

puts 'Test result is ' + (delete_digit(10) == 1).to_s.upcase
p delete_digit(10) # 1
