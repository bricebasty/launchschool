# For a given nonempty string s find a minimum substring t and the maximum number k,
# such that the entire string s is equal to t repeated k times.

# The input string consists of lowercase latin letters.

# Your function should return :

# a tuple (t, k) (in Python)
# an array [t, k] (in Ruby and JavaScript)
# in C, return k and write to the string t passed in parameter
# Example #1:

# for string

# s = "ababab";
# the answer is

# ("ab", 3)
# Example #2:

# for string

# s = "abcde"
# the answer is

# ("abcde", 1)
# because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

# Input "abab"
# Output ["ab", 2]
#
# Normal cases
# "abcdeabcde" --> ["abcde", 2]
# "xyzxyz" --> ["xyz", 2]
#
# Edge cases
# "abiobiohubzqdmpisqh" -- ["abiobiobiobiobiobiohubzqdmpisqh", 1]
#
# Data structures
# Arrays
#
# Algorithm
# find the minimum substring in the string
# - for each char, add it to a new variable unless it encounters a letter with the same value as first char in substring
# - if it encounters a letter with the same value as first char in substring (and then second and on until the length is done)
#   - add these values to a new variable
# - if var1 == var2
#   - add +1 to k
#
# Pseudocode
# repetition = 0
# string = ''
# iterator = 0
# s.each_char do |char|
#   unless char == t[iterator]
#     string += char
#
#
# end
#
# return the minimum substring and the times it can be multiplied by

def f(original_string)
  final_string = ''
  iterator = 0

  original_string.each_char do |char|
    iterator += 1 if char == final_string[iterator]
    final_string += char if
  end
  p [final_string, original_string.split(/#{final_string[-1] + final_string[0]}/).length]
end

f("abab")
f("abcdeabcde")
f("xyzxyz")
f("abiobiohubzqdmpisqh")
