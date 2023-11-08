# Complete the greatestProduct method so that it'll find the greatest product
# of five consecutive digits in the given string of digits.

# For example:

# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.

# Adapted from Project Euler.
=begin
PROBLEM
----------------
INPUT: String of numbers
OUTPUT: Greatest product

RULES:
- Minimum 5 char in string

EXAMPLES
----------------
BEGIN: "123834"
=> Size : 6
=> Number of elements : 2
=> ["12383", "23834"]
=> [["1", "2", "3", "8", "3"]]
=> [[1, 2, 3, 8, 3], [2, 3, 8, 3, 4]]
=> [144, 576]
END: 576

DATA STRUCTURES
----------------
BEGIN: String
=> Array
END: Integer

NOTES:

ALGORITHM
----------------

Create an empty array

Do size of the string - 4 times  with iterator `i`
- Push into the array string[i, 5]

Map the array to array of chars then on these map to integer and inject multiplication

=end

def greatest_product(n)
  (0..n.size - 4).each_with_object([]) { |i, arr| arr << n[i, 5] }.map { |e| e.chars.map(&:to_i).inject(:*) }.max

end

puts 'Test result is ' + (greatest_product("123834539327238239583") == 3240).to_s.upcase
p greatest_product("123834539327238239583") # 3240

puts 'Test result is ' + (greatest_product("395831238345393272382") == 3240).to_s.upcase
p greatest_product("395831238345393272382") # 3240

puts 'Test result is ' + (greatest_product("92494737828244222221111111532909999") == 5292).to_s.upcase
p greatest_product("92494737828244222221111111532909999") # 5292

puts 'Test result is ' + (greatest_product("92494737828244222221111111532909999") == 5292).to_s.upcase
p greatest_product("92494737828244222221111111532909999") # 5292

puts 'Test result is ' + (greatest_product("02494037820244202221011110532909999") == 0).to_s.upcase
p greatest_product("02494037820244202221011110532909999") # 0
