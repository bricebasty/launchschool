# Write a method that takes a string as an argument and groups the number of time
# each character appears in the string as a hash sorted by the highest number of occurrences.

# The characters should be sorted alphabetically e.g:

# get_char_count("cba") => {1=>["a", "b", "c"]}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.

=begin
PROBLEM
----------------
INPUT: String
OUTPUT: Sorted Hash with key being the number of occurences the strings in the array value

RULES:
- array is sorted alphabetically
- hash is sorted by highest to lowest number

EXAMPLES
----------------
BEGIN: "Mississippi"
=> "mississipi"
=> nombre de m : 1
=> { 1 => ["m"] }
=> nombre de i : 4
=> { 4 => ["i"], 1 => ["m"] }
=> nombre de s : 4
=> { 4 => ["i", "s"], 1 => ["m"] }
=> nombre de p : 2
=> { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
END: {4=>["i", "s"], 2=>["p"], 1=>["m"]

DATA STRUCTURES
----------------
BEGIN: String
=>
END: Hash with integers and arrays of string(s)

NOTES:


ALGORITHM
----------------
Downcase the string
For each character `char` in the string with object `hash` {}
- Next iteration if `char` is in values of `hash`
- Count the number of `char` in the string
- Reassigne in `hash` the key `count` with value [`char`]

For each value in the hash, do a sort
Sort by key the hash

=end

def get_char_count(string)
  downcased_string = string.downcase

  count_hash = downcased_string.chars.each_with_object({}) do |char, hash|
    next if hash.values.flatten.include?(char) || char =~ /[^0-9a-z]/
    count_of_char = downcased_string.count(char)
    hash[count_of_char] = (hash[count_of_char] || []) + [char]
  end

  count_hash.each_value(&:sort!).sort_by(&:first).reverse.to_h
end

puts 'Test result is ' + (get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}).to_s.upcase
p get_char_count("Mississippi") # {4=>["i", "s"], 2=>["p"], 1=>["m"]}, "Nope! Try again."

puts 'Test result is ' + (get_char_count("Hello. Hello? HELLO!") == {6=>["l"], 3=>["e", "h", "o"]}).to_s.upcase
p get_char_count("Hello. Hello? HELLO!") # {6=>["l"], 3=>["e", "h", "o"]}, "Nope! Try again."

puts 'Test result is ' + (get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}).to_s.upcase
p get_char_count("aaa...bb...c!") # {3=>["a"], 2=>["b"], 1=>["c"]}, "Nope! Try again."

puts 'Test result is ' + (get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}).to_s.upcase
p get_char_count("abc123") # {1=>["1", "2", "3", "a", "b", "c"]}, "Nope! Try again."

puts 'Test result is ' + (get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}).to_s.upcase
p get_char_count("aaabbbccc") # {3=>["a", "b", "c"]}, "Nope! Try again."
