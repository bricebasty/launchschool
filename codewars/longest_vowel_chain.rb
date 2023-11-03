# The vowel substrings in the word codewarriors are o,e,a,io.
# The longest of these has a length of 2.
# Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces,
# return the length of the longest vowel substring. Vowels are any of aeiou.

# Good luck!

# If you like substring Katas, please try:

# 1. Problem Understanding:
#    1. Comprehend problem statement
#     Count the length of the longest vowel chain in a string
#    2. Inputs?
#     codewarriors
#	   3. Outputs?
#	    2 (because io is the longest vowel chain)
#	   4. Rules & Constraints?
# 2. Test Cases:
#   1. Normal cases
#   2. Ege cases
# 3. Data Structures:
#   Strings
#   Substrings
# 4. Algorithm:
#    1. Loose Pseudocode
#
#    2. Formal Pseudocode
#    2. Flowchart
# 5. Code Implementation:
#    1. Translate
#    2. Readability
#    3. Organization
#    4. Test
#    5. Refine code
#    6. Refactor

def solve(s)
  s.scan(/[aeiou]+/).sort_by!(&:size).last.length
end

solve("codewarriors")# 2
solve("suoidea") # 3
solve("iuuvgheaae") # 4
solve("ultrarevolutionariees")# 3
solve("strengthlessnesses") # 1
solve("cuboideonavicuare") # 2
solve("chrononhotonthuooaos") # 5
solve("iiihoovaeaaaoougjyaw") # 8
