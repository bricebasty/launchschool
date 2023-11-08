# Given a string, return a new string that has transformed based on the input:

# Change case of every character, ie. lower case to upper case, upper case to lower case.
# Reverse the order of words from the input.
# Note: You will have to handle multiple spaces, and leading/trailing spaces.

# For example:

# "Example Input" ==> "iNPUT eXAMPLE"
# You may assume the input only contain English alphabet and spaces

=begin
PROBLEM
----------------
INPUT: String
OUTPUT: String with case inversed and reverse the order of words

RULES:
- Only a-z and spaces

EXAMPLES
----------------
BEGIN: "Example Input"
=> "Example" -> "eXAMPLE" (swapcase)
=> "Input" -> "iNPUT"
=>
END: "iNPUT eXAMPLE"

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

=end

def string_transformer(str)
  # Your code here
end

puts 'Test result is ' + (string_transformer('Example string') == 'STRING eXAMPLE').to_s.upcase
p string_transformer('Example string') # 'STRING eXAMPLE'

# str.split.map(&:swapcase).reverse.join(" ")
p "You Know When  THAT  Hotline Bling".split.map(&:swapcase).reverse
