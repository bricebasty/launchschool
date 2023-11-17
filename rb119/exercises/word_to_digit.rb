# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
# 09:32 09:51
#
# PROBLEM
# ---
# INPUT: String (sentence of words)
# OUTPUT: String with every word which represents a digit converted to its digit form
#
# RULES:
# -
#
# EXAMPLES
# ---
# INPUT: 'Please call me at five five five one two three four. Thanks.'
# => { "one"=> 1, }
# => ["Please", "call", "me", "at", "five", "five", "five", "one", "two", "three", "four.", "Thanks."]
# => "Please" -> number? -> false -> next iteration
# => "five" -> number? -> true -> get the value
# OUTPUT: 'Please call me at 5 5 5 1 2 3 4. Thanks.'
#
# DATA STRUCTURES
# ---
# Array
# Hash
#
# ALGO
# ---
#
# We initialize a hash with key being string one to nine and values from 1 to 9
# We scan the array by every word
# We map over each of these elements in the array
#   -If the current element is included in the hash keys
#     - return the value of the hash key
#   - ELse
#     - return the element
# Join the resulting array
#
HASH = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
  "zero" => 0
}

def word_to_digit(sentence)
  sentence.scan(/\w+|\W+/).map { |word| HASH.include?(word) ? HASH[word] : word }.join
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
