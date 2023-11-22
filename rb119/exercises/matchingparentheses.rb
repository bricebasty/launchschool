# Write a method that takes a string as an argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# end

# Note that balanced pairs must each start with a (, not a ).

# 09:28 09:57
=begin
PROBLEM
---

INPUT: String
OUTPUT: Boolean
RULES:
- Return true if parentheses opening and closing is matching
- When we encounter the first parenthese and it's closing we will default return false


EXAMPLES:
---

INPUT: ")()("
=>
OUTPUT: false

INPUT: "(())"
=>
OUTPUT: true

INPUT:'((What) (is this))?'
=> ['(']
=> ['(', '(']
=> ['()', '(']
=> ['()', '(', '(']
=> ['()', '()', '()']
=> ['()', '()', '()']
OUTPUT: true

DATA STRUCTURES:
---

INPUT: String
=>
OUTPUT: Boolean

ALGORITHM
---

WHAT ?

Initialize a empty string
Iterate over character with index
Check if it is a parenthese
  - If it is a closing one and the string is empty OR the char at index -1 is a closing one return false
  - add it to the string if its a parenthese
Check the size of the string if it is even
---

Initialize an empty array
Initialize a counter for opened parenthese
Initialize a counter for closed parenthese
Iterate over character
  If it is a closing parenthese and array is empty return false
  If it is an opening parenthese
    Add it to the array as a string at index of the opened counter
    add +1 to the opened counter
  If it is a closing parenthese
    Add it to the array as a string at index of the closed counter
    add +1 to the closed counter

Check if all elements size in the array are even

HOW ?

=end
# def balanced?(string)
#   parentheses = []
#   opened_parentheses_index = 0
#   closed_parentheses_index = 0
#   string.each_char do |char|
#     return false if char == ')' && (parentheses.empty? || parentheses[closed_parentheses_index].nil?)
#     if char == '('
#       parentheses[opened_parentheses_index] = char
#       opened_parentheses_index += 1
#     elsif char == ')'
#       parentheses[closed_parentheses_index] << char
#       closed_parentheses_index += 1
#     end
#   end

#   parentheses.all? { |element| element.size.even? }
# end
#
def balanced?(string)
parens = 0
string.each_char do |char|
  parens += 1 if char.match?(/[\(\[\{]/)
  parens -= 1 if char.match?(/[\)\]\}]/)
  break if parens < 0
end

parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ())(is() up') == false
p balanced?('What ((is))) up(') == false
