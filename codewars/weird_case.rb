# Write a function that accepts a string, and returns the same string with all
# even indexed characters in each word upper cased, and all odd indexed characters
#  in each word lower cased. The indexing just explained is zero based,
#  so the zero-ith index is even, therefore that character should be upper cased
#  and you need to start over for each word.

# The passed in string will only consist of alphabetical characters and spaces(' ').
#  Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

# Examples:
# "String" => "StRiNg"
# "Weird string case" => "WeIrD StRiNg CaSe"

# downcase and Split by spacce
# Map for each word
# Chars of the word
# Map each char with index
# if index is even -> char
# if index is odd -> uppercase

def weirdcase string
  string.downcase.split.map do |word|
    word.chars.map.with_index { |c, i| i.even? ? c.upcase : c }.join
  end.join(" ")
end

puts 'Test result is ' + (weirdcase('This') == 'ThIs').to_s.upcase
p weirdcase('This') # 'ThIs'

puts 'Test result is ' + (weirdcase('is') == 'Is').to_s.upcase
p weirdcase('is') # 'Is'

puts 'Test result is ' + (weirdcase('This is a test') == 'ThIs Is A TeSt').to_s.upcase
p weirdcase('This is a test') # 'ThIs Is A TeSt'
