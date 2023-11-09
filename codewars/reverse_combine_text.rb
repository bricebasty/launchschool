# Your task is to Reverse and Combine Words. It's not too difficult,
# but there are some things you have to consider...

# So what to do?
# Input: String containing different "words" separated by spaces

# 1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
#    (odd number of words => last one stays alone, but has to be reversed too)
# 2. Start it again until there's only one word without spaces
# 3. Return your result...
# Some easy examples:
# Input:  "abc def"
# Output: "cbafed"

# Input:  "abc def ghi 123"
# Output: "defabc123ghi"

# Input:  "abc def gh34 434ff 55_eri 123 343"
# Output: "43hg ff434 cba fed 343 ire_55 321"

=begin
PROBLEM
----------------
INPUT: String containing different "words" separated by spaces
OUTPUT:

RULES:
- If More than one word
--- Reverse each word
--- Combine first word with second word
- Start this again until there is only 1 word

EXAMPLES
----------------
INPUT: "abc def"
=> "cba fed"
=> "cbafed"
OUTPUT: "cbafed"

Input:  "abc def ghi 123"
=> "cba fed ihg 321"
=> "cbafed ihg321"
=> "defabc 123ghi"
Output: "defabc123ghi"


INPUT: "abc def gh34 434ff 55_eri 123 343"
=> ["cba", "fed", "43hg", "ff434", "ire_55", "321", "343"] REVERSE
=> ["cbafed", "43hgff434", "ire_55321", "343"] COMBINE
=> "fedcba 434ffgh34 12355_eri 343" REVERSE
=> "fedcba434ffgh34 12355_eri343" COMBINE
=> "43hgff434abcdef 343ire_55321" REVERSE
OUTPUT: "43hgff434cbafed343ire_55321" COMBINE

DATA STRUCTURES
----------------
INPUT:
=>
OUTPUT:

NOTES:

ALGORITHM
----------------
Until s splitted size is 1
- Split s
- Map each word of the split into a new variable `reversed_words`
--- Reverse the word
- On each word of in `reversed_words` with object `arr` [] and index `i`
--- go to next iteration if index is odd
--- push to `arr` `word` and `reversed_words[i + 1]`
- Join the resulting array and reassign s to this string


=end
def reverse_and_combine_text(s)
  until s.split.size == 1
    reversed_words = s.split.map(&:reverse)
    s = reversed_words.each_with_object([]).with_index do |(word, arr), i|
      next if i.odd?
      arr << (word + (reversed_words[i + 1].nil? ? "" : reversed_words[i + 1]))
    end.join(" ")
  end
  s
end

puts 'Test result is ' + (reverse_and_combine_text("abc def") == "cbafed").to_s.upcase
p reverse_and_combine_text("abc def") # "cbafed"

puts 'Test result is ' + (reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi").to_s.upcase
p reverse_and_combine_text("abc def ghi jkl") # "defabcjklghi"

puts 'Test result is ' + (reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed").to_s.upcase
p reverse_and_combine_text("dfghrtcbafed") # "dfghrtcbafed"

puts 'Test result is ' + (reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll").to_s.upcase
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") # "trzwqfdstrteettr45hh4325543544hjhjh21lllll"

puts 'Test result is ' + (reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf").to_s.upcase
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") # "gffds432243fdsfdseewttf"
