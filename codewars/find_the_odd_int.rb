# Given an array of integers, find the one that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.

# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

=begin
PROBLEM
----------------
INPUT: Array of integers with one appearing a odd number of times
OUTPUT: The integer appearing an odd numbenr of times

RULES:
-

EXAMPLES
----------------
BEGIN: [1,2,2,3,3,3,4,3,3,3,2,2,1]
=>
=>
END:

DATA STRUCTURES
----------------
BEGIN:
INBETWEEN:
END:


ALGORITHM
----------------

=end

def find_it(seq)
  seq.tally.select { |_, v| v.odd? }.keys.join.to_i
end
