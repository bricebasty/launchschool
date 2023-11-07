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
=begin
PROBLEM
---------
INPUT: String with words, return a string with each word with it's first and
OUTPUT: String with each word have first and last letter unchanged letters in between are sorted alphabetically.

RULES
---------
- Do it for every word in a multi word string
- Words are separated by spaces only
- Do not change punctuation's order :  - ' , .
- If punctuation is first or last, go to the next letter

EXAMPLES
----------------
BEGIN: "professionals"
=> ["p", "s"], ["r", "o", "f", "e", "s", "s", "i", "o", "n", "a", "l"]
=> ["p", "s"], ["a", "e", "f", "i", "l", "n", "o", "o", "r", "s", "s"
=> ["a", "e", "f", "i", "l", "n", "o", "o", "r", "s", "s"].unshift("p").push("s").join
END: "paefilnoorsss"

BEGIN: 'card-carrying'
=> ["c", "g"], ["a", "r", "d", "-", "c", "a", "r", "r", "y", "i", "n"]
=> ["c", "g"], ["a", "r", "d", "c", "a", "r", "r", "y", "i", "n"], {"-"=>3}
=> ["c", "g"], ["a", "a", "c", "d", "i", "n", "r", "r", "r", "y"], {"-"=>3}
=> arr = ["c", "a", "a", "c", "d", "i", "n", "r", "r", "r", "y", "g"], {"-"=>3}
=> {"-"=>3}.each { |k, v| arr.insert(v, k) }
END:

BEGIN: ---d-cba---
=>
=> ["---", "---"], ["d", "a"], ["-", "c", "b"], OK
=> ["---", "---"], ["d", "a"], ["c", "b"], {"-"=> 0} OK
=> ["---", "---"], ["d", "a"], ["b", "c"], {"-"=> 0} OK
=> ["---", "---"], ["d", "a"], ["-", "b", "c"] OK
=> ["---", "d", "-", "b", "c", "a", "---"]
END: ---d-bca---

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

REGEXES:
--------
Premier charactères et dernier char : /(?<!\S)([-',\.]+)|([-',\.]+)(?!\S)/ -> flatten.comapct

Premiere lettre et derniere apres char: /(?<!\S)(?:[-',\.]*)([a-z])|([a-z])(?:[-',\.]*)(?!\S)/i   -> .flatten.compact

Tous char entre: string.scan(/(?<!\S)(?:[-',\.]*)(?:[a-z])(.+)(?:[a-z])(?:[-',\.]*)(?!\S)/i) -> .flatten

ALGORITHM
----------------

Split words
map each of words, element word
- create a variable `first_and_last_chars` for holding the first and last chars
- create a variable `first_and_last_letters` for holding the first and last letters
- create a variable `chars_in_between`
- create a variable `positions_of_special_chars` for holding the keys of special chars and values of their index
-- for each char in `chars_in_between` with object {} `hash` with index i
--- hash[char] = i
--- chars_in_between delete at index i
-- sort chars in between
- for each key value in `positions_of_special chars` , key k, value v
-- insert in `chars_in_between` at index v, string k

Create an array and populate with
- first element of `first_and_last_chars`
- first element of `first_and_last_letters`
- chars_in between
- last element of `first_and_last_letters`
- last element of `first_and_last_chars`
join this array

=end


def scramble_words(words)
  words.split.map do |word|
    first_and_last_chars = word.scan(/(?<!\S)([-',\.]+)|([-',\.]+)(?!\S)/).flatten
    first_and_last_letters = word.scan(/(?<!\S)(?:[-',\.]*)([a-z])|([a-z])(?:[-',\.]*)(?!\S)/i).flatten.compact
    chars_in_between = word.scan(/(?<!\S)(?:[-',\.]*)(?:[a-z])(.+)(?:[a-z])(?:[-',\.]*)(?!\S)/i).join.chars

    positions_of_special_chars = chars_in_between.each_with_object({}).with_index do |(c, h), i|
      if c.match?(/[-'\,\.]/)
        h[c] = i
        chars_in_between.delete_at(i)
      end
    end
    chars_in_between.sort!
    positions_of_special_chars.each { |k, v| chars_in_between.insert(v, k) }
    [first_and_last_chars[0], first_and_last_letters[0], chars_in_between, first_and_last_letters[1], first_and_last_chars[1]].join
  end.join(" ")
end

def scramble_word(word)

end

# puts 'Test result is ' + (scramble_words('professionals') == 'paefilnoorsss').to_s.upcase
# p scramble_words('professionals') # 'paefilnoorsss', 'The first and last letters of a word should reamin in place with the inner letters sorted'

# puts 'Test result is ' + (scramble_words('i') == 'i').to_s.upcase
# p scramble_words('i') # 'i', 'Must handle single charater words'

# puts 'Test result is ' + (scramble_words('') == '').to_s.upcase
# p scramble_words('') # '', 'Must handle empty strings'

# puts 'Test result is ' + (scramble_words('me') == 'me').to_s.upcase
# p scramble_words('me') # 'me', 'Must handle 2 charater words'

# puts 'Test result is ' + (scramble_words('you') == 'you').to_s.upcase
# p scramble_words('you') # 'you', 'Must handle 3 charater words'

# puts 'Test result is ' + (scramble_words('card-carrying') == 'caac-dinrrryg').to_s.upcase
# p scramble_words('card-carrying') # 'caac-dinrrryg', 'Only spaces separate words and punctuation should remain at the same place as it started'

# puts 'Test result is ' + (scramble_words("shan't") == "sahn't").to_s.upcase
# p scramble_words("shan't") # "sahn't", 'Punctuation should remain at the same place as it started'

# puts 'Test result is ' + (scramble_words('-dcba') == '-dbca').to_s.upcase
# p scramble_words('-dcba') # '-dbca', 'Must handle special character at the start'

# puts 'Test result is ' + (scramble_words('dcba.') == 'dbca.').to_s.upcase
# p scramble_words('dcba.') # 'dbca.', 'Must handle special character at the end'

# puts 'Test result is ' + (scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth.").to_s.upcase
# p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") # "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth.", 'Must handle a full sentence'


# Create a test sentence and a test word
test_sentence = "The quick brown fox jumps over the lazy dog."
require 'benchmark'
# Benchmark
Benchmark.bm do |x|
  x.report("scramble_words: ") { 1000.times { scramble_words(test_sentence) } }
  x.report("scramble_word: ")  { 1000.times { scramble_words_2(test_sentence) } }
end
