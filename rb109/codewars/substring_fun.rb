# Complete the function that takes an array of words.

# You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

# For example:

# ["yoda", "best", "has"]  -->  "yes"
#   ^        ^        ^
#   n=0     n=1     n=2
# Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

# Input --> Output
# ["yoda", "best", "has"]  -->  "yes"

# Cases
# ['yoda', 'best', 'has'] --> yes
# [] --> ;
# ['X-ray'] --> X;
# ['No','No'] --> No;
# ['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia'] --> Codewars;
#
# variable finale
# iterator
# for each element in collection
# add current element letter iterated
# iterator += 1
#

def nth_char(words)
  words.map.with_index { |e, i| e[i] }.join
end
