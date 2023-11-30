# Write a function that takes a string of braces, and determines if the order of
# the braces is valid. It should return true if the string is valid, and false if
# it's invalid.
# end

# This Kata is similar to the Valid Parentheses Kata, but introduces new characters:
# brackets [], and curly braces {}. Thanks to @arnedag for the idea!

# All input strings will be nonempty, and will only consist of parentheses,
# brackets and curly braces: ()[]{}.

# What is considered Valid?
# A string of braces is considered valid if all braces are matched with the correct brace.

# Examples
# "(){}[]"   =>  True
# "([{}])"   =>  True
# "(}"       =>  False
# "[(])"     =>  False
# "[({})](]" =>  False

=begin
PROBLEM
----------------
INPUT: String
OUTPUT: Boolean

RULES:
-

EXAMPLES
----------------
INPUT: "[(])"
=> { "()": , '{}':, '[]': }
=>
OUTPUT: false

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

ALGORITHM
----------------

NOTES:

HIGH-LEVEL:

LOW-LEVEL:

=end

def validBraces(braces)
  parentheses = []
  opened_parentheses_index = 0
  closed_parentheses_index = 0
  string.each_char do |char|
    return false if char.match?(/[\)\]\}]/) && (parentheses.empty? || parentheses[closed_parentheses_index].nil?)
    if char.match?(/[\(\[\{]/)
      parentheses[opened_parentheses_index] = char
      opened_parentheses_index += 1
    elsif char.match?(/[\)\]\}]/)
      parentheses[closed_parentheses_index] << char
      closed_parentheses_index += 1
    end
end

parentheses.all? { |element| element.size.even? }

p validBraces( "()" ) # => true
p validBraces( "[(])" ) # => false
