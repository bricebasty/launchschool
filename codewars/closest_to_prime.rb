# Task :
# Given a List [] of n integers , find minimum number to be inserted in a list,
# so that sum of all elements of list should equal the closest prime number .

# Notes
# List size is at least 2 .

# List's numbers will only positives (n > 0) .

# Repetition of numbers in the list could occur .

# The newer list's sum should equal the closest prime number .

# Input >> Output Examples
#
# 1- minimumNumber ({3,1,2}) ==> return (1)
#
# Explanation:
# Since , the sum of the list's elements equal to (6) , the minimum number to
# be inserted to transform the sum to prime number is (1) , which will make the
# sum of the List equal the closest prime number (7) .
#
# 2-  minimumNumber ({2,12,8,4,6}) ==> return (5)
#
# Explanation:
# Since , the sum of the list's elements equal to (32) , the minimum number to
# be inserted to transform the sum to prime number is (5) , which will make the
# sum of the List equal the closest prime number (37) .
#
# 3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
#
# Explanation:
# Since , the sum of the list's elements equal to (189) , the minimum number to
# be inserted to transform the sum to prime number is (2) , which will make the
# sum of the List equal the closest prime number (191) .
#
#
=begin
PROBLEM
----------------
INPUT:
OUTPUT:

RULES:
-

EXAMPLES
----------------
BEGIN: [3,1,2]
=> Sum of elements: 6
=> 6 + 1 = 7 ->
=> 6 - 1 = 5
=> Next closest prime number: 7
=> Difference between prime number and sum: 1
END: 1

BEGIN: [3,1,5]
=> Sum of elements: 57
=> 57 + 2 = 59.prime?
=> 57 - 2 = 55
=> Next closest prime number: 59
=> Difference between prime number and sum: 1
END: 1

DATA STRUCTURES
----------------
BEGIN:
=>
END:

NOTES:

ALGORITHM
----------------

=end

require "openssl"

def minimum_number(numbers)
  sum = numbers.sum
  difference = 0

  loop do
    return difference if OpenSSL::BN.new(sum).prime?
    sum += sum.even? ? 1 : 2
    difference += sum.even? ? 1 : 2
  end
end

puts 'Test result is ' + (minimum_number([3,1,2]) == 1).to_s.upcase
p minimum_number([3,1,2]) # 1

puts 'Test result is ' + (minimum_number([5,2]) == 0).to_s.upcase
p minimum_number([5,2]) # 0

puts 'Test result is ' + (minimum_number([1,1,1]) == 0).to_s.upcase
p minimum_number([1,1,1]) # 0

puts 'Test result is ' + (minimum_number([2,12,8,4,6]) == 5).to_s.upcase
p minimum_number([2,12,8,4,6]) # 5

puts 'Test result is ' + (minimum_number([50,39,49,6,17,28]) == 2).to_s.upcase
p minimum_number([50,39,49,6,17,28]) # 2
