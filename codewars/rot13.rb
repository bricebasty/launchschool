# ROT13 is a simple letter substitution cipher that replaces a letter with the
# letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

# Create a function that takes a sing and returns the sing ciphered with Rot13.
# If there are numbers or special cacters included in the sing,
# they should be returned as they are. Only letters from the latin/english
# alphabet should be shifted, like in the original Rot13 "implementation".
#
=begin
PROBLEM
----------------
INPUT: sing
OUTPUT: sing with each a-z c replaced by 13 letter after it

RULES:
- Do not take special cs into account

EXAMPLES
----------------
INPUT: test
=> t -> g
=> e -> r
=> s -> f
=> t -> g
OUTPUT: grfg

DATA sUCTURES
----------------
INPUT:
=>
OUTPUT:

NOTES:

ALGORITHM
----------------
Convert sing to array of cs
- For each c `c` with object "" `s`
-- If the c is is in the alphabet
--- Calculate the 13 letter after it
---- If the ord number of c is greater than or equal to 78 OR 110
----- Push (c.ord - 13).chr to `s`
---- Else
----- Push (c.ord + 13).chr to s
-- Else
--- Push the c into `s`


=end
def rot13(string)
  string.chars.each_with_object('') do |c, s|
    if c.match?(/[a-z]/i)
      (78..90).include?(c.ord) || c.ord >= 110 ? s << (c.ord - 13).chr : s << (c.ord + 13).chr
    else
      s << c
    end
  end
end

puts 'Test result is ' + ("grfg" == rot13("test")).to_s.upcase
p rot13("test") # "Input: test , Expected Output: grfg

puts 'Test result is ' + ("Grfg" == rot13("Test")).to_s.upcase
p rot13("Test") # "Input: Test , Expected Output: Grfg
