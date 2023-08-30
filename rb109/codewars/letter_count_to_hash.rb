# def letter_count(str)
#   chars_array = str.chars.sort.uniq
#   numbers_array = []
#   chars_array.each { |char| numbers_array << str.count(char) }
#   hash = chars_array.each(&:to_sym).zip(numbers_array).to_h
# end

def letter_count(str)
  p str.chars.tally
end

letter_count("activity")
