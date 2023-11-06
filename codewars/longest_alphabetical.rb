# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# There are tests with strings up to 10 000 characters long so your code will need to be efficient.

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.

# Good luck :)
#
=begin
PROBLEM
----------------
INPUT: String
OUTPUT: Longest string in A-Z order

RULES:
- If multiple solution, return the first
- Input is always lowercase
- Input is 1 character long minimum
- Code need to be efficient
- Multiple same characters count in the longest string
- Letters don't need to directly follow each other (ab is valid as much as ac)

EXAMPLES
----------------
BEGIN: asd
=> a
END: as

BEGIN: "bcab"
=> ["b"]
=> ["bc"]
=> ["bc", "a"]
=> ["bc", "ab"]
END: "bc"

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------
Create an empty stirng
For each char in the string with index
- add the character to the array if the string is empty
- add the character to the last string in array if the ord number of the previous char in the empty string is lower or equal of the last character in current string
- add the character as a new string in the array if not

=end

def longest(s)
  substrings = s.chars.each_with_object([]).with_index do |(char, arr), index|
    if arr.empty? || arr[-1][-1].ord > char.ord
      arr << char
    else
      arr[-1] << char
    end
  end

  substrings.max_by { |e| e.size }
end

p longest('asd') # => 'as'
p longest('nab') # => 'ab'
p longest('abcdeapbcdef') # => 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') # => 'aaaabbbbctt'
p longest('asdfbyfgiklag') # => 'fgikl'
p longest('z') # => 'z'
p longest('zyba') # => 'z'
