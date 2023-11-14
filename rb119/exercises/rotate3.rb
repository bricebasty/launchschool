# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits,
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
# The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.
# 10:01 10:25
#
# PROBLEM:
#
# INPUT: Integer
# OUTPUT: Integer rotated
#
# RULES :
# - Fix 1 digit on the left after rotation
# - Rotate only the remaining digits
# - Don't handle multiple 0
# EXAMPLES:
=begin
INPUT: 735291

OUTPUT:*

INPUT: 735291
=> 352917 -> 3
=> 329175 -> 2
=> 321759 -> 1
=> 321597 -> 5
OUTPUT: 321579

INPUT: 8_703_529_146
=> 7 035 291 468 -> 7
=> 7 352 914 680 -> 3
=> 7 329 146 805 -> 2
=> 7 321 468 059 -> 1
=> 7 321 680 594 -> 6
OUTPUT:

INPUT: 105
=> 051 -> 0
=> 015
OUTPUT: 15

INPUT: 35
=> 53
OUTPUT: 53

ALGO

HIGH LEVEL:

Rotate rightmost until we get to the last 2 numbers
Remove 1 to the rotation argument every time

LOW LEVEL

Initialize a variable_rotation variable to the size of the integer in string
Loop until variable_rotation is equal to 2
  reassign the return value of
    Take the integer and put it as an argument to the rotate righmost digits method

=end

def max_rotation(integer)
  variable_rotation = integer.to_s.size
  until variable_rotation == 1
    integer = rotate_rightmost_digits(integer, variable_rotation)
    variable_rotation -= 1
  end
  integer
end

def rotate_rightmost_digits(integer, rotation)
  array_of_integers = integer.digits.reverse
  array_of_integers << array_of_integers[-rotation]
  array_of_integers.delete_at(-(rotation + 1))
  array_of_integers.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
