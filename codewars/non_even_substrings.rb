# Given a string of integers#  return the number of odd-numbered substrings that can be formed.

# For example#  in the case of "1341"#  they are 1#  1#  3#  13#  41#  341#  1341#  a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.

# Good luck!

# If you like substring Katas#  please try
#
=begin
PROBLEM
----------------
INPUT: string of integers
OUTPUT: number of odd-numbered substrings that can be formed

RULES:
-

EXAMPLES
----------------
BEGIN: 1341
=> 1
=> 1
=> 3
=> 13
=> 41
=> 341
=> 1341
END: 7

BEGIN: 1357
=> 1 0 - 0
=> 13 0 - 1
=> 135 0 - 2
=> 1357 0 - 3
=> 3 1 - 1
=> 35 1 - 2
=> 357 1 - 3
=> 5 2 - 2
=> 57 2 - 3
=> 7 3 - 3
END: 10

BEGIN: 13471
=> 1
=> 13
=> 1347
=> 13471
=> 3
=> 347
=> 3471
=> 47
=> 471
=> 7
=> 71
=> 1
END: 12

BEGIN: 134721
=> 1
=> 13
=> 1347
=> 134721
=> 3
=> 347
=> 34721
=> 47
=> 4721
=> 7
=> 721
=> 21
=> 1
END: 13

DATA STRUCTURES
----------------
BEGIN: String of integers
INBETWEEN: String & Integer
END: Integer


ALGORITHM
----------------
Initialize a count variable
for each character in the string
  for each character in the string
    add + 1 a count si string[index 1 a index2] is odd?

=end

def solve(string)
  count = 0
  string.chars.each_index do |i1|
    string.chars.each_index do |i2|
      count += 1 if string[i1..i2].to_i.odd?
    end
  end
  count
end

def count_odd_substrings(s)
  (0...s.size).sum { |i| (i...s.size).count { |j| s[i..j].to_i.odd? } }
end


solve("1341")# 7 -> 1 1 3 13 41 341 1341
solve("1357")# 10 -> 1 3 13 5 35 135 7 57 357 1357
solve("13471")# 12 -> 1 1 3 7 13 47 347 1347 71 471 3471 13471
solve("134721")# 13
solve("1347231")# 20
solve("13472315")# 28

count_odd_substrings("1341")# 7 -> 1 1 3 13 41 341 1341
count_odd_substrings("1357")# 10 -> 1 3 13 5 35 135 7 57 357 1357
count_odd_substrings("13471")# 12 -> 1 1 3 7 13 47 347 1347 71 471 3471 13471
count_odd_substrings("134721")# 13
count_odd_substrings("1347231")# 20
count_odd_substrings("13472315")# 28
