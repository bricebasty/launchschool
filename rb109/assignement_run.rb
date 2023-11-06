# def scramble(s1,s2)
#   s1_counts = Hash.new(0)
#   s1.each_char { |c| s1_counts[c] += 1 }
#   s2.each_char do |c|
#     return false if s1_counts[c] <= 0
#     s1_counts[c] -= 1
#   end

#   true
# end

# puts 'Test result is ' + (scramble('rkqodlw',           'world'     ) == true).to_s.upcase
# p scramble('rkqodlw',           'world'     ) # true
# puts 'Test result is ' + (scramble('cedewaraaossoqqyt', 'codewars'  ) == true).to_s.upcase
# p scramble('cedewaraaossoqqyt', 'codewars'  ) # true
# puts 'Test result is ' + (scramble('katas',             'steak'     ) == false).to_s.upcase
# p scramble('katas',             'steak'     ) # false
# puts 'Test result is ' + (scramble('scriptjava',        'javascript') == true).to_s.upcase
# p scramble('scriptjava',        'javascript') # true
# puts 'Test result is ' + (scramble('scriptingjava',     'javascript') == true).to_s.upcase
# p scramble('scriptingjava',     'javascript') # true


def extend_greeting(greeting)
  greeting + " there"
end

greeting = "hi"
str = greeting
greeting = extend_greeting(greeting)

puts greeting # output: "hi there"
puts str
