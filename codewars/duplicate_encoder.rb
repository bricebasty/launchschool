# The goal of this exercise is to convert a string to a new string where each
# character in the new string is "(" if that character appears only once in the
# original string, or ")" if that character appears more than once in the original
#  string. Ignore capitalization when determining if a character is a duplicate.
# end

# Examples
# "din"      =>  "((("
# "recede"   =>  "()()()"
# "Success"  =>  ")())())"
# "(( @"     =>  "))(("
# Notes
# Assertion messages may be unclear about what they display in some languages.
# If you read "...It Should encode XXX", the "XXX" is the expected result, not the input!

=begin
PROBLEM
----------------
INPUT: string of characters
OUTPUT: string of parentheses with ( if it appears 1 time and ) in the other case

RULES:
- Ignore capitalizaion

EXAMPLES
----------------
BEGIN: din
=> din -> d -> 1 -> (
=> din -> i -> 1 -> (
=> din -> n -> 1 -> (
END: (((

DATA STRUCTURES
----------------
BEGIN: string
INBETWEEN: string
END: string


ALGORITHM
----------------

for each character in the input string map into a new array ternary

=end

def duplicate_encode(word)
  word.downcase.chars.map { |char| word.count(char) > 1 ? 2 : 1 }.join
end
