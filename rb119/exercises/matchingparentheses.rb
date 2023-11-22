# Write a method that takes a string as an argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# end

# Note that balanced pairs must each start with a (, not a ).

# 09:28
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


HOW ?

=end

def balanced?(string)
  parentheses = ""
  string.each_char.with_index do |char, index|
    if char == ')' && (parentheses.empty? || parentheses[index - 1] == ')')
      return false
    end
    parentheses << char if char.match?(/\)|\(/)
  end

  parentheses.size.even?
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
