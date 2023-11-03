# Complete the solution so that the function will break up camel casing, using a space between words.

# Example
# "camelCasing"  =>  "camel Casing"
# "identifier"   =>  "identifier"
# ""             =>  ""
#
#
=begin
PROBLEM
----------------
INPUT: camel cased string
OUTPUT: uncamel cased string separated by a space

RULES:
-

EXAMPLES
----------------
BEGIN: "camel Casing"
=>
=>
END: "camelCasing"

DATA STRUCTURES
----------------
BEGIN:
INBETWEEN:
END:


ALGORITHM
----------------

Replace every uppercase character by space uppercase

=end
def solution(string)
  string.gsub(/[A-Z]/, ' \0')
end

p solution("camelCasing")
