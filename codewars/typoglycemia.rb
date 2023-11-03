# Background
# There is a message that is circulating via public media that claims a reader
# can easily read a message where the inner letters of each words is scrambled,
# as long as the first and last letters remain the same and the word contains all the letters.

# Another example shows that it is quite difficult to read the text where all the
# letters are reversed rather than scrambled.

# In this kata we will make a generator that generates text in a similar pattern,
# but instead of scrambled or reversed, ours will be sorted alphabetically

# Requirement
# return a string where:

# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't
# Assumptions

# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-) #  apostrophe(') #  comma(,) and period(.)
# ignore capitalisation
# for reference: http://en.wikipedia.org/wiki/Typoglycemia
#
# PROBLEM
# ---------
# Given a string with words, return a string with each word with it's first and
# last letter unchanged, but the letters in between them are sorted alphabetically.
#
# RULES
# ---------
# - Do it for every word in a multi word string
# - Words are separated by spaces only
# - Do not change punctuation's order :  - ' , .
#
# EXAMPLES
# ----------
# "professionals"
# "ps" "rofessional"
# "ps" "aefilnoorss"
# "paefilnoorsss"
#
# "card-carrying"
# "cg" "ardcarryin" "char: -, index: 4"
# "cg" "aacdinrrry" "char: -, index: 4"
# "caac-dinrrryg"
#
# "shan't"
# "st" "han'"
# ""
# "sahn't"
#
# INPUT: "lor'em ips'um dol'or sit amet, con-sect-etur adipi'scing elit."
#
# ["lor'em", "ips'um", "dol'or", "sit", "amet,", "con-sect-etur", "adipi'scing", "elit."]
#
# "lor'em" OK
# "or'e" OK
# ["o", "r", "'", "e"] OK
# [["'", 2]] special chars OK
# ["o", "r", "e"] OK
# ["e", "o", "r"] OK
# ["e", "o", "'", "r"]
# leo'rm

# cr
# on-sect-etu
# [["-", 2], ["-", 7]]
# onsectetu
# ceenosttu
# ce-enos-ttu
# cce-enos-ttur
#
# -dc--ba.
# dc--ba
# c--b

# OUTPUT: "leo'rm ips'um dlo'or sit aemt, cce-enos-ttur acdii'inpsg eilt."
#
#
# "you've gotta dance .pramt"
# "you've" "gotta" "dance"

# ["youv'e", "gotta", "dacne" ]
# "you've gotta dacne"
#
# DATA STRUCTURES
# ---------------
# INPUT: STRING
# INBETWEEN: ARRAY and HASH
# OUTPUT: STRING
#
# NOTES
# -----
# range?
# map? or each
# first and last
# sort
#
# ALGORITHM
# ---------
# Split the words string by space
# On each string with an array object
# - in the 1st index of string to second last index in string put the chars into array
#   - for each element of this array
#    - create array with element and index for each allowed special character then compact it and store it
#   - then delete the special characters from the array
#   - then sort the array
#   - then for each element in the special char array, add char at index in the sorted array
#   - now join the complete array
# - add the complete array at index 1 in s[0] and s[-1] string

# match the first alphabetic character to the last alphabetic character

def scramble_words(words)
  words.split.map do |word|
    sorted_inner = sort_word(word)

    word[1..-2].each_char.with_index do |char, idx|
      sorted_inner.insert(idx, char) if char.match(/[-',.]/)
    end

    word[0] + sorted_inner + (word.size > 1 ? word[-1] : '')
  end.join(' ')
end

def sort_word(word)
  word.match(/[a-z]/).to_s.gsub(/[-',.]/, '').chars.sort.join
end


puts scramble_words('-dcba') #  '-dbca'
puts scramble_words('dcba.') #  'dbca.'


p scramble_words('professionals') #  'paefilnoorsss', 'The first and last letters of a word should reamin in place with the inner letters sorted'
p scramble_words('i') #  'i', 'Must handle single charater words'
p scramble_words('') #  '', 'Must handle empty strings'
p scramble_words('me') #  'me', 'Must handle 2 charater words'
p scramble_words('you') #  'you', 'Must handle 3 charater words'
p scramble_words('card-carrying') #  'caac-dinrrryg', 'Only spaces separate words and punctuation should remain at the same place as it started'
p scramble_words("shan't") #  "sahn't", 'Punctuation should remain at the same place as it started'
p scramble_words('-dcba') #  '-dbca', 'Must handle special character at the start'
p scramble_words('dcba.') #  'dbca.', 'Must handle special character at the end'
p scramble_words("leo'rm ips'um dlo'or sit aemt, cce-enos-ttur acdii'inpsg eilt.")
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") #  "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth.", 'Must handle a full sentence'
