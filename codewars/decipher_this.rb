# You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

# For each word:

# the second and the last letter is switched (e.g. Hello becomes Holle)
# the first letter is replaced by its character code (e.g. H becomes 72)
# Note: there are no special characters used, only letters and spaces

# Examples

# decipherThis('72olle 103doo 100ya'); // 'Hello good day'
# decipherThis('82yade 115te 103o'); // 'Ready set go'

=begin
PROBLEM
----------------
INPUT: String of words ciphered
OUTPUT: String of words deciphered

RULES:
- For each word:
--- Second and last letter are switched
--- First letter is replaced by its character code (ord)
- No special characters, only letters/spaces

EXAMPLES
----------------
INPUT: Hello
=> Holle
=> 72olle
OUTPUT: 72olle

INPUT: 65
=> A
OUTPUT: A

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

Split the string in words
Map each word in the split
Sub the first multiple digit in the word by the digits to chr

word[0].chr + word[-1] + word[2..-2] + word[1]

=end

def decipher_this(string)
  string.split.map do |word|
    word.sub!(/(\d+)/) { $1.to_i.chr }
    word.scan(/[a-z]/i).size < 3 ? word : word[0] + word[-1] + word[2..-2] + word[1]
  end.join(" ")
end

puts 'Test result is ' + (decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak").to_s.upcase
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") # "A wise old owl lived in an oak"

puts 'Test result is ' + (decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke").to_s.upcase
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") # "The more he saw the less he spoke"

puts 'Test result is ' + (decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard").to_s.upcase
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") # "The less he spoke the more he heard"

puts 'Test result is ' + (decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird").to_s.upcase
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") # "Why can we not all be like that wise old bird"

puts 'Test result is ' + (decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help").to_s.upcase
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") # "Thank you Piotr for all your help"
