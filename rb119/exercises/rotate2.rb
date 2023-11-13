=begin
PROBLEM
----------------
INPUT: 2 integers
OUTPUT: 1 integer

RULES:
- Rotate the last "second integer" digits on the right in the first integer
- Rotation is from the first digits in the last "second integer digits"

EXAMPLES
----------------
INPUT: 735291, 2
=> [7, 3, 5, 2, 9, 1]
=> [7, 3, 5, 2, 9, 1, 9]
=> [7, 3, 5, 2, 1, 9]
OUTPUT: 735219

INPUT: 735291, 3
=>
=>
OUTPUT: 735912

INPUT: 735291,4
=>
=>
OUTPUT: 732915

DATA STRUCTURES
----------------
INPUT: Integer
=> Arrays
OUTPUT: Integer

ALGORITHM
----------------

NOTES:

HIGH-LEVEL:
Extract the digits of the integer into an array of integers
In this array we would push the element at negative index from the end
Remove the element at negative index + 1
Join the array

LOW-LEVEL:

=end

def rotate_rightmost_digits(integer, rotation)
  array_of_integers = integer.digits.reverse
  array_of_integers << array_of_integers[-rotation]
  array_of_integers.delete_at(-(rotation + 1))
  array_of_integers.join.to_i
end

p rotate_rightmost_digits(735291, 1)  == 735291
p rotate_rightmost_digits(735291, 2)  == 735219
p rotate_rightmost_digits(735291, 3)  == 735912
p rotate_rightmost_digits(735291, 4)  == 732915
p rotate_rightmost_digits(735291, 5)  == 752913
p rotate_rightmost_digits(735291, 6)  == 352917
