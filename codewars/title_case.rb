# A string is considered to be in title case if each word in the string is either
# (a) capitalised (that is, only the first letter of the word is in upper case)
# or (b) considered to be an exception and put entirely into lower case unless
# it is the first word, which is always capitalised.

# Write a function that will convert a string into title case, given an optional
# list of exceptions (minor words). The list of minor words will be given as a
# string with each word separated by a space. Your function should ignore the case
#  of the minor words string -- it should behave in the same way even if the case
#  of the minor word string is changed.

# Arguments (Haskell)
# First argument: space-delimited list of minor words that must always be
# lowercase except for the first word in the string.
# Second argument: the original string to be converted.
# Arguments (Other languages)
# First argument (required): the original string to be converted.
# Second argument (optional): space-delimited list of minor words that must
# always be lowercase except for the first word in the string.
# The JavaScript/CoffeeScript tests will pass undefined when this argument is unused.
#
# Example
# title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
# title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
# title_case('the quick brown fox') # should return: 'The Quick Brown Fox'
#
#
=begin
PROBLEM
----------------
INPUT: String of words, string of exceptions
OUTPUT: Titleized string (every word is capitalized except exceptions)

RULES:
- First word is always capitalised
- Return empty string if empty input
- Don't capitalize words which are exceptions

EXAMPLES
----------------
BEGIN: a clash of KINGS, a an the of
=> ["a", "clash", "of", "KINGS"]
=> "a" -> index? == 0 -> "A"
=> "clash" -> index? == 0 -> exception? -> "Clash"
=> "of" -> index? == 0 -> exception? -> "of"
=> "KINGS" -> index? == 0 --> false -> exception? -> false -> "Kings"
END: A Clash of Kings

DATA STRUCTURES
----------------
BEGIN: Strings
=> Arrays
END: Strings

NOTES:
split ?
index?

ALGORITHM
----------------
Splits the `title` variable
Map through the array element `e` with index `i`
- if i == 0
Capitalize

=end

def title_case(title, minor_words = '')
  minor_array = minor_words.downcase.split
  title.capitalize.split.map.with_index do |e, i|
    if i == 0
      e
    elsif minor_array.any? { |word| word == e.downcase }
      e.downcase
    else
      e.capitalize
    end
  end.join(" ")
end

p title_case('') # => ''
p title_case('a clash of KINGS', 'a an the of') # => 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') # => 'The Wind in the Willows'
p title_case('the quick brown fox') # => 'The Quick Brown Fox'
