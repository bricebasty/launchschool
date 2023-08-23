# Given a string of integers#  return the number of odd-numbered substrings that can be formed.

# For example#  in the case of "1341"#  they are 1#  1#  3#  13#  41#  341#  1341#  a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.

# Good luck!

# If you like substring Katas#  please try
#
# 1. Problem Understanding:
#    1. Comprehend problem statement
#    2. Inputs?
#     string of integers
#	   3. Outputs?
#	    number of oddnumbered substrings
#	   4. Rules & Constraints?
# 2. Test Cases:
#   1. Normal cases
#   2. Ege cases
# 3. Data Structures:
# 4. Algorithm:
#    1. Loose Pseudocode
#    2. Formal Pseudocode
#    2. Flowchart
# 5. Code Implementation:
#    1. Translate
#    2. Readability
#    3. Organization
#    4. Test
#    5. Refine code
#    6. Refactor

def solve(string)
  array = string.chars
  until
    first = 0
    until
    last = string.length - 1
    array << string[first..last] if string[first..last].to_i.odd?
  end
  p array.flatten.select! { |n| n.to_i.odd? }.length
end

solve("1341")# 7 -> 1 1 3 13 41 341 1341
solve("1357")# 10 -> 1 3 13 5 35 135 7 57 357 1357
solve("13471")# 12 -> 1 1 3 7 13 47 347 1347 71 471 3471 13471
solve("134721")# 13
solve("1347231")# 20
solve("13472315")# 28
