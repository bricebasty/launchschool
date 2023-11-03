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
=>
=>
END: {4=>["i", "s"], 2=>["p"], 1=>["m"]}

DATA STRUCTURES
----------------
BEGIN: String
=> Arrays and Strings
END: Hash with integers and arrays of string(s)

NOTES:
tally
group_by

ALGORITHM
----------------

Take the first element in each array
4=>[
  ["i", 4], ["s", 4]
]
4=>["i", "s"]

=end

def get_char_count(string)
  chars_number = string.downcase.chars.tally
  chars_number.delete_if { |k, _| k.match?(/[^a-z0-9]/i) }
              .group_by { |_, v| v }
              .each_with_object({}) { |(k, v), h| h[k] = v.map { |e| e[0] } }
              .sort
              .reverse
              .to_h
              .each_value { |v| v.sort! }
end

# p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
# p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
# p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
# p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == { 1=>["1", "2", "3", "a", "b", "c"] }
