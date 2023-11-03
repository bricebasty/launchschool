# Write a function that, given a string of text (possibly with punctuation and line-breaks),
# returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

# Assumptions:
# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
# Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
# Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
# Matches should be case-insensitive, and the words in the result should be lowercased.
# Ties may be broken arbitrarily.
# If a text contains fewer than three unique words, then either the top-2 or
# top-1 words should be returned, or an empty array if a text contains no words.
# Examples:
# top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.")
# # => ["a", "of", "on"]

# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# # => ["e", "ddd", "aa"]

# top_3_words("  //wont won't won't")
# # => ["won't", "wont"]
# Bonus points (not really, but just for fun):
# Avoid creating an array whose memory footprint is roughly as big as the input text.
# Avoid sorting the entire array of unique words.
#
# PROBLEM
# ----------------
# INPUT : string of words separated by whitespaces
# OUTPUT : array of the 3 most frequent words
#
# RULES :
# - Apostrophes count as a word. Every other character is treated as a whitespace
# - Don't sort the entire array of unique words
# - Return empty array if the string is empty
# - Return top2 or top1 if the text contains fewer than 3 unique words
# - Matches are case insensitive
# - Words in the final array are lowercase

# # EXAMPLES
# ----------------

# INPUT: "In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income."
# =>
# =>
# =>
# =>
# OUTPUT:  ["a", "of", "on"]

# INPUT: "a a a  b  c c  d d d d  e e e e e"
# =>
# =>
# =>
# =>
# OUTPUT: ["e", "d", "a"]
#
# INPUT: "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
# =>
# =>
# =>
# =>
# OUTPUT: ["e", "ddd", "aa"]
#
# INPUT: "  //wont won't won't "
# =>
# =>
# =>
# =>
# OUTPUT: ["won't", "wont"]
#
# INPUT: "  , e   .. "
# =>
# =>
# =>
# =>
# OUTPUT: ["e"]
#
# INPUT: "  ...  "
# =>
# =>
# =>
# =>
# OUTPUT: []
#
# INPUT: "  '  "
# =>
# =>
# =>
# =>
# OUTPUT: []
#
# INPUT: "  '''  "
# =>
# =>
# =>
# =>
# OUTPUT: []

# # DATA STRUCTURES
# ----------------
# BEGIN: STRING
# INBETWEEN: HASH
# END: ARRAY

# NOTES:
# each
# regex
# groups

# # ALGORITHM
# ----------------
#
# Downcase the string and split in an array, separated by whitespaces or a regexp expression which would be more precise
# Initialize a hash with 0
# For each element in the array.uniq, store all words as keys and the count of words in original array as value
# Take the 3 elements with the highest value in the hash
# Return their keys in an array
#
# REGEXP
# ------
# Split by all non alphabetic characters, except apostrophes
# /(?<![a-z]/
# Anything that isn't an alphabetic character and anything that isn't an apostrophe
# Except if the apostrophe is not surrounded by an alphabetic character
#
# Match must have pattern after      => + Lookahead  => (?=pattern)
# Match must not have pattern after  => - Lookahead  => (?!pattern)
# Match must have pattern before     => + lookbehind => (?<=pattern)
# Match must not have pattern before => - Lookbehind => (?<!pattern)

def top_3_words(words)
  split_words = words.downcase.scan(/\b[a-z']+\b/)
  words_count = Hash.new(0)
  split_words.uniq.each { |word| words_count[word] = split_words.count(word) }
  words_count.sort_by(&:last).reverse.first(3).map(&:first).reject(&:empty?)
end

def top_3_words(text)
  text.downcase.scan(/\b[a-z']+\b/)
      .each_with_object(Hash.new(0)) { |word, count| count[word] += 1 }
      .sort_by { |_word, count| -count }
      .first(3)
      .map(&:first)
end

p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")

top_3_words("    '      ")
top_3_words("    '''    ")
top_3_words("  //wont won't won't ") # ["won't", "wont"]
top_3_words("  , e   .. ") # ["e"]
