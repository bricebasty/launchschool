# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.
# end

# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.
# end

# You may assume that the string will always contain at least one character.
=begin
10:12 10:28
PROBLEM
---
INPUT: String of characters
OUTPUT: hash with symbols as keys and values being float numbers representing percentages
RULES:
- Whitespaces count in neither

EXAMPLES
---
INPUT: 'abCdef 123'
=> 'a' -> lowercase -> 1
=> { lowercase: 5, uppercase: 1, neither: 4 }
=> 5 / 10.0 * 100
OUTPUT: { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

DATA STRUCTURES
---

INPUT: String
=> Hash of symbols and integers
OUTPUT: Hash of symbols and floats

ALGORITHM
---
WHAT:

Iterate over each char
Add +1 to a hash depending on its lowercxase, uppercase or neither
Map the values of the hash to their value divided by 10.0 times 100

HOW:

Initialize a hash with lowercase: 0, uppercase: 0 and neither: 0
Iterate over each char
Add +1 to a hash depending on its lowercxase, uppercase or neither
  - lowercase +1 if the character is lowercase
  - uppercase +1 if the character is uppercase
  - neither +1 if the character is neither
Map the values of the hash to their value divided by string size times 100
Convert to hash again

=end

def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |char|
    if ("a".."z").include?(char)
      hash[:lowercase] += 1
    elsif ("A".."Z").include?(char)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash.transform_values { |value| (value / string.size.to_f * 100).round(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
