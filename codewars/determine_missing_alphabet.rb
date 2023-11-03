=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
=end

=begin
PROBLEM
- given an array with an alphabetic range, return inverse case missing char
----------------
INPUT:
- array of consecutive letters
OUTPUT:
- missing letter in array according to alphabet
- missing letter is the inverse (upper vs lowercase) than the exiting letters in the array
RULES:
- if array is empty return an empty array
- consider upper and lowercacse letters (check ASCII precendence or use a method to check?)

EXAMPLES
----------------
['a','b','c','d','f'] == 'E'
a b c d e f
=> e
=> E

['o','q','r','s'] == 'P'
o p q r s
=> p
=> P

['H','J','K','L'] == 'i'
H I J K L
=> H
=> h

[] == []
[]


DATA STRUCTURES
----------------
INPUT: ARRAY
INBETWEEN: RANGE
OUTPUT: STRING (single char)

OTHER:
- Create a range with first and last element in array?
- create a full range alphabet? a to z and A to Z
- ASCII?
- Array with string values

ALGORITHM
----------------

- Create a range
  - First element being the first element in the array
  - Second element being the last element in the array
- Convert this range to an array
- Subtract the range minus the inputted array
- Join the resulting array
- Reverse the case of the resulting string
- Return the value of the previous line



CODE
---------------
=end
def determine_missing_letter(array)
  array.empty? ? [] : ((array.first..array.last).to_a - array).join.swapcase
end

p determine_missing_letter(['a','b','c','d','f']) # == 'E'
p determine_missing_letter(['o','q','r','s']) # == 'P'
p determine_missing_letter(['H','J','K','L']) # == 'i'
p determine_missing_letter([]) # == []
