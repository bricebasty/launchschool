# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new
# string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the
# english alphabet letters.
=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN: "The Holy Bible"
=>
=>
END: "BbeehHilloTy"

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

=end
def alphabetized(s)
  s.gsub(/[^a-z]/i, "").chars.sort_by(&:downcase).join
end

puts 'Test result is ' + (alphabetized("") == "").to_s.upcase
p alphabetized("") # ""

puts 'Test result is ' + (alphabetized(" ") == "").to_s.upcase
p alphabetized(" ") # ""

puts 'Test result is ' + (alphabetized(" a") == "a").to_s.upcase
p alphabetized(" a") # "a"

puts 'Test result is ' + (alphabetized("a ") == "a").to_s.upcase
p alphabetized("a ") # "a"

puts 'Test result is ' + (alphabetized(" a ") == "a").to_s.upcase
p alphabetized(" a ") # "a"

puts 'Test result is ' + (alphabetized("A b B a") == "AabB").to_s.upcase
p alphabetized("A b B a") # "AabB"

puts 'Test result is ' + (alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ").to_s.upcase
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") # "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

puts 'Test result is ' + (alphabetized("!@$%^&*()_+=-`,") == "").to_s.upcase
p alphabetized("!@$%^&*()_+=-`,") # ""

puts 'Test result is ' + (alphabetized("The Holy Bible") == "BbeehHilloTy").to_s.upcase
p alphabetized("The Holy Bible") # "BbeehHilloTy"

puts 'Test result is ' + (alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy").to_s.upcase
p alphabetized("CodeWars can't Load Today") # "aaaaCcdddeLnooorstTWy"
