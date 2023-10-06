# Given an array (arr) as an argument complete the function countSmileys that
# should return the total number of smiling faces.

# Rules for a smiling face:

# Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
# A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
# Every smiling face must have a smiling mouth that should be marked with either ) or D
# No additional characters are allowed except for those mentioned.

# Valid smiley face examples: :) :D ;-D :~)
# Invalid smiley faces: ;( :> :} :]

# Example
# countSmileys([':)', ';(', ';}', ':-D']);       // should return 2;
# countSmileys([';D', ':-(', ':-)', ';~)']);     // should return 3;
# countSmileys([';]', ':[', ';*', ':$', ';-D']); // should return 1;
# Note
# In case of an empty array return 0. You will not be tested with invalid input
# (input will always be an array). Order of the face (eyes, nose, mouth) elements
#  will always be the same.
#
=begin
PROBLEM
----------------
INPUT: Array of smileys
OUTPUT: Number of smiling faces

RULES:
- : or ;
- optional - or ~
- ) or D
- 0 if []

EXAMPLES
----------------
BEGIN: [':)', ';(', ';}', ':-D']
=>
=>
END: 2

BEGIN: [';D', ':-(', ':-)', ';~)']
=> ';D' -> true -> 1
=> ':-(' -> false -> 1
=> ':-)' -> true -> 2
=> ';~)' -> true -> 3
END: 3

BEGIN: [';]', ':[', ';*', ':$', ';-D']
=>
=>
END: 1

DATA STRUCTURES
----------------
BEGIN: Array
INBETWEEN: String, boolean, integer
END: Integer

NOTES:
- count method
- match? regexp
- ternary operator empty? ? 0 :

ALGORITHM
----------------

For each element in the array, count the number of elements who match the regexp for smiling faces

:), ;), :D, ;D, :-), ;-), :-D, ;-D

- : or ;
- optional - or ~
- ) or D


=end

def count_smileys(arr)
  arr.count { |e| e.match?(/[:;][-~]?[)D]/) }
end
