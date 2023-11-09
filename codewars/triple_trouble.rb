# Write a function

# triple_double(num1, num2)
# which takes numbers num1 and num2 and returns 1 if there is a straight triple
# of a number at any place in num1 and also a straight double of the same number in num2.

# If this isn't the case, return 0
# triple_double(451999277, 41177722899) == 1
# # num1 has straight triple 999s and  num2 has straight double 99s

# triple_double(1222345, 12345) == 0
# # num1 has straight triple 2s but num2 has only a single 2

# triple_double(12345, 12345) == 0

# triple_double(666789, 12345667) == 1

=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
INPUT:451999277, 41177722899
=> 451999277 -> 999
=> 99 in 41177722899 ? YES
OUTPUT: 1

NOTES:

ALGORITHM
----------------
Match if there is 3 consecutive number in the num1 to string
- If yes take the match
--- convert it to string
--- take the 2 first characters 0, 2
--- check if there is match in num2 to string
----- if yes return 1
----- if no return 0
- If no return 0

=end

99967120340009277610569 & 57820001265897275

def triple_double(num1, num2)
  match1 = num1.to_s.scan(/(\d)\1{2}/).flatten
  return 0 if match1.nil?
  match1.any? { |str| num2.to_s.match?(/#{str}{2}/) } ? 1 : 0
end

# puts 'Test result is ' + (triple_double(451999277, 41177722899) == 1).to_s.upcase
p triple_double(99967120340009277610569, 57820001265897275) # 1

puts 'Test result is ' + (triple_double(1222345, 12345) == 0).to_s.upcase
p triple_double(1222345, 12345) # 0

puts 'Test result is ' + (triple_double(12345, 12345) == 0).to_s.upcase
p triple_double(12345, 12345) # 0

puts 'Test result is ' + (triple_double(666789, 12345667) == 1).to_s.upcase
p triple_double(666789, 12345667) # 1

puts 'Test result is ' + (triple_double(10560002, 100) == 1).to_s.upcase
p triple_double(10560002, 100) # 1

puts 'Test result is ' + (triple_double(1112, 122) == 0).to_s.upcase
p triple_double(1112, 122) # 0
