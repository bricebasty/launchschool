# Mothers arranged a dance party for the children in school. At that party,
# there are only mothers and their children. All are having great fun on the
# dance floor when suddenly all the lights went out. It's a dark night and no
# one can see each other. But you were flying nearby and you can see in the dark
# and have ability to teleport people anywhere you want.

# Legend:
# -Uppercase letters stands for mothers, lowercase stand for their children,
# i.e. "A" mother's children are "aaaa".
# -Function input: String contains only letters, uppercase letters are unique.
# Task:
# Place all people in alphabetical order where Mothers are followed by their
# children, i.e. "aAbaBb" => "AaaBbb".

def find_children(s)
  s.downcase.chars.tally.sort.to_h.each_with_object([]) do |(k, v), arr|
    arr << "#{k.upcase}#{k * (v - 1)}"
  end.join
end

puts 'Test result is ' + (find_children("abBA") == "AaBb").to_s.upcase
p find_children("abBA") # "AaBb"

puts 'Test result is ' + (find_children("AaaaaZazzz") == "AaaaaaZzzz").to_s.upcase
p find_children("AaaaaZazzz") # "AaaaaaZzzz"

puts 'Test result is ' + (find_children("CbcBcbaA") == "AaBbbCcc").to_s.upcase
p find_children("CbcBcbaA") # "AaBbbCcc"

puts 'Test result is ' + (find_children("xXfuUuuF") == "FfUuuuXx").to_s.upcase
p find_children("xXfuUuuF") # "FfUuuuXx"

puts 'Test result is ' + (find_children("") == "").to_s.upcase
p find_children("") # ""
