# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

# 12 --> 10 2
# 422 --> 400 20 2
# 3921 --> 3000 900 20 1

# multiplier = num.digits.length
# map each char in number
#   char * 10**multiplier
#   multiplier -= 1

# If you liked this kata, check out part 2!!

def expanded_form(num)
  num.digits.map.with_index { |c, i| (10**i) * c }.delete_if(&:zero?).reverse.join(" + ")
end

expanded_form(39034)
