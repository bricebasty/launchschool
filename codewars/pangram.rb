#  A pangram is a sentence that contains every single letter of the alphabet at
#  least once.
#  For example, the sentence "The quick brown fox jumps over the lazy dog" is a
#  pangram,
#  because it uses the letters A-Z at least once (case is irrelevant).
#  end

# Given a string, detect whether or not it is a pangram. Return True if it is,
# False if not. Ignore numbers and punctuation.

=begin
PROBLEM
----------------
INPUT: String of words
OUTPUT: Boolean of if the string contains A-Z or not

RULES:
-

EXAMPLES
----------------
BEGIN: "The quick brown fox jumps over the lazy dog"
=> "Thequickbrownfoxjumpsoverthelazydog"
=> "thequickbrownfoxjumpsoverthelazydog"
=> {"t"=>2, "h"=>2, "e"=>3, "q"=>1, "u"=>2, "i"=>1, "c"=>1, "k"=>1, "b"=>1, "r"=>2, "o"=>4, "w"=>1, "n"=>1, "f"=>1, "x"=>1, "j"=>1, "m"=>1, "p"=>1, "s"=>1, "v"=>1, "l"=>1, "a"=>1, "z"=>1, "y"=>1, "d"=>1, "g"=>1}
=> [a-z]
=>
END: true

DATA STRUCTURES
----------------
BEGIN: String
INBETWEEN:
END: Boolean

NOTES:
- Ranges a-z ?
- Hash a-z ?
- gsub [^a-z]

ALGORITHM
----------------

Create a a-z range into an array
Chars and then uniq the string
For each element in the string array remove the char from the a-z array
If at the end the range is empty, return true, if not return false

=end

def pangram?(string)
  (("a".."z").to_a - string.downcase.gsub(/[^a-z]/, '').chars.uniq).empty?
end

string = "Cwm fjord bank glyphs vext quiz"
p pangram?(string)
