# Complete the method/function so that it converts dash/underscore delimited words
# into camel casing. The first word within the output should be capitalized only
# if the original word was capitalized (known as Upper Camel Case, also often
#   referred to as Pascal case). The next words should be always capitalized.
# end

# Examples
# "the-stealth-warrior" gets converted to "theStealthWarrior"

# "The_Stealth_Warrior" gets converted to "TheStealthWarrior"

# "The_Stealth-Warrior" gets converted to "TheStealthWarrior"
=begin
PROBLEM
----------------
INPUT: non camel case string
OUTPUT: camel cased string

RULES:
-

EXAMPLES
----------------
BEGIN: the_stealth_warrior
=> _s --> S
=> _w --> W
END: theStealthWarrior

BEGIN: The-Stealth-Warrior
=> -S --> S
=> -W --> W
END: TheStealthWarrior

BEGIN: A-B-C
=>
=>
END: ABC

DATA STRUCTURES
----------------
BEGIN: String
=> Substring
END: String

NOTES:
gsub
regexp group

ALGORITHM
----------------

=end
def to_camel_case(str)
  str.gsub(/[-_]([a-z])/i) { $1.upcase }
end

p to_camel_case("") # => ""
p to_camel_case("the_stealth_warrior") # => "theStealthWarrior"
p to_camel_case("The-Stealth-Warrior") # => "TheStealthWarrior"
p to_camel_case("A-B-C") # => "ABC"
