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
=> [ ok
=> ( ok
=> ] not ok
OUTPUT: false

INPUT: "([{}])"
=> '(' -> "("
=> '[' -> '(['
=> '{' -> '([{'
=> '}' -> '(['
=> ')' -> '
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

Take each char in the string
  If it's an opening character
    add it to a storing string
  If it's a closing character and the last character in the storing stirng is not the same
    return false
  If it's a closing character and the last character in the stroing string is the same
    remove the last character in the storing string


LOW-LEVEL:

=end

def validBraces(braces)
  storing_string = ""
  pairs = { ")" => "(", "}" => "{", "]" => "[" }
  braces.each_char do |char|
    return false if char =~ /[\)\]\}]/ && storing_string[-1] != pairs[char]

    braces.match?(/[\(\[\{]/) ? storing_string << char : storing_string.slice!(0..-2)
  end

end


p validBraces( "()" ) # => true
p validBraces( "[(])" ) # => false
